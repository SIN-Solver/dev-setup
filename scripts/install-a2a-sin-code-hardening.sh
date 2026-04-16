#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DROPIN_SOURCE="$ROOT_DIR/systemd/a2a-sin-code-hardening.conf"
JOURNALD_SOURCE="$ROOT_DIR/systemd/journald.conf.d/90-oci-limits.conf"
LOGROTATE_SERVICE_SOURCE="$ROOT_DIR/systemd/oci-log-rotation.service"
LOGROTATE_TIMER_SOURCE="$ROOT_DIR/systemd/oci-log-rotation.timer"
LOGROTATE_SCRIPT_SOURCE="$ROOT_DIR/scripts/oci-log-rotation.sh"

for agent in backend command frontend fullstack plugin tool; do
  service_name="a2a-sin-code-${agent}.service"
  dropin_dir="/etc/systemd/system/${service_name}.d"
  sudo mkdir -p "$dropin_dir"
  sudo install -m 0644 "$DROPIN_SOURCE" "$dropin_dir/hardening.conf"
done

sudo mkdir -p /etc/systemd/journald.conf.d
sudo install -m 0644 "$JOURNALD_SOURCE" /etc/systemd/journald.conf.d/90-oci-limits.conf
sudo install -m 0755 "$LOGROTATE_SCRIPT_SOURCE" /usr/local/bin/oci-log-rotation.sh
sudo install -m 0644 "$LOGROTATE_SERVICE_SOURCE" /etc/systemd/system/oci-log-rotation.service
sudo install -m 0644 "$LOGROTATE_TIMER_SOURCE" /etc/systemd/system/oci-log-rotation.timer

sudo systemctl daemon-reload
sudo systemctl restart systemd-journald
sudo systemctl enable --now oci-log-rotation.timer

sudo systemctl restart \
  a2a-sin-code-backend \
  a2a-sin-code-command \
  a2a-sin-code-frontend \
  a2a-sin-code-fullstack \
  a2a-sin-code-plugin \
  a2a-sin-code-tool
