#!/usr/bin/env bash
set -euo pipefail

RESULT_DIR="/var/lib/oci-disk-self-test"
FAILURES=0
THRESHOLD_PCT="${EMERGENCY_THRESHOLD_PCT:-85}"
SERVICES=(
  a2a-sin-code-backend
  a2a-sin-code-command
  a2a-sin-code-frontend
  a2a-sin-code-fullstack
  a2a-sin-code-plugin
  a2a-sin-code-tool
)
TIMERS=(
  runner-cleanup.timer
  oci-space-guardian.timer
  oci-emergency-disk-guard.timer
  oci-log-rotation.timer
  oci-disk-self-test.timer
)
PORTS=(7860 7861 7862 7863 7864 7865)

log() {
  logger -t oci-disk-self-test -- "$*" || true
  printf '%s\n' "$*" >&2 || true
}

fail() {
  FAILURES=$((FAILURES + 1))
  log "FAIL: $*"
}

pass() {
  log "PASS: $*"
}

current_use_pct() {
  df -P / | awk 'NR==2 {gsub("%", "", $5); print $5+0}'
}

mkdir -p "$RESULT_DIR"
start_ts="$(date +%s)"

for script in \
  /usr/local/bin/cleanup-runner-libs.sh \
  /usr/local/bin/oci-space-guardian.sh \
  /usr/local/bin/oci-emergency-disk-guard.sh \
  /usr/local/bin/oci-log-rotation.sh \
  /usr/local/bin/oci-disk-self-test.sh; do
  if [ -x "$script" ]; then
    pass "script executable: $script"
  else
    fail "script missing or not executable: $script"
  fi
done

for timer in "${TIMERS[@]}"; do
  if systemctl is-enabled --quiet "$timer" && systemctl is-active --quiet "$timer"; then
    pass "timer active+enabled: $timer"
  else
    fail "timer not active+enabled: $timer"
  fi
done

if [ -f /etc/systemd/journald.conf.d/90-oci-limits.conf ] && \
  grep -q '^SystemMaxUse=200M$' /etc/systemd/journald.conf.d/90-oci-limits.conf && \
  grep -q '^RuntimeMaxUse=200M$' /etc/systemd/journald.conf.d/90-oci-limits.conf && \
  grep -q '^SystemKeepFree=2G$' /etc/systemd/journald.conf.d/90-oci-limits.conf && \
  grep -q '^MaxRetentionSec=7day$' /etc/systemd/journald.conf.d/90-oci-limits.conf; then
  pass 'journald hardening present'
else
  fail 'journald hardening missing or incomplete'
fi

if grep -RInE 'opencode.*--version|\[\s*"opencode"\s*,\s*"--version"' /opt/a2a-agents/a2a-sin-code-*/app/coder_agent.py /opt/a2a-agents/a2a-sin-code-*/start.sh >/dev/null 2>&1; then
  fail 'opencode --version leak path still present'
else
  pass 'no opencode --version leak path present'
fi

for svc in "${SERVICES[@]}"; do
  active_state="$(systemctl show -p ActiveState --value "$svc")"
  restart_usec="$(systemctl show -p RestartUSec --value "$svc")"
  limit_burst="$(systemctl show -p StartLimitBurst --value "$svc")"
  limit_interval="$(systemctl show -p StartLimitIntervalUSec --value "$svc")"
  if [ "$active_state" != "active" ]; then
    fail "$svc not active"
  elif [ "$restart_usec" != "30s" ] || [ "$limit_burst" != "3" ] || [ "$limit_interval" != "5min" ]; then
    fail "$svc hardening mismatch restart=$restart_usec burst=$limit_burst interval=$limit_interval"
  else
    pass "$svc hardening active"
  fi
done

disk_pct="$(current_use_pct)"
if [ "$disk_pct" -ge "$THRESHOLD_PCT" ]; then
  fail "root disk above threshold ${disk_pct}% >= ${THRESHOLD_PCT}%"
else
  pass "root disk below threshold ${disk_pct}% < ${THRESHOLD_PCT}%"
fi

for port in "${PORTS[@]}"; do
  if curl -fsS "http://127.0.0.1:${port}/health" >/dev/null; then
    pass "health endpoint ok on ${port}"
  else
    fail "health endpoint failed on ${port}"
  fi
done

new_tmp_files="$(python3 - <<PY
import glob, os
start_ts = int(${start_ts})
files = [f for f in glob.glob('/tmp/.*.so') if os.path.isfile(f) and int(os.stat(f).st_mtime) >= start_ts]
print(len(files))
PY
)"
if [ "$new_tmp_files" != "0" ]; then
  fail "health checks created ${new_tmp_files} new /tmp/.*.so files"
else
  pass 'health checks created no new /tmp/.*.so files'
fi

result_file="$RESULT_DIR/last-result.txt"
{
  echo "timestamp=$(date -u +%FT%TZ)"
  echo "failures=$FAILURES"
  echo "disk_pct=$disk_pct"
  echo "new_tmp_files=$new_tmp_files"
} > "$result_file"

if [ "$FAILURES" -gt 0 ]; then
  log "self-test failed count=$FAILURES"
  exit 1
fi

log 'self-test passed'
