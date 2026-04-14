# Infra-SIN-Dev-Setup

Development Environment Setup

## Purpose

MCP Server providing tool capabilities to the OpenSIN-AI agent fleet.

## MCP Configuration

| Property | Value |
|:---|:---|
| **Type** | MCP Server |
| **Transport** | stdio / HTTP |
| **Protocol** | MCP 2.0 |

## Agent Config System v5

This MCP server is part of the OpenSIN ecosystem:

| Datei | Zweck |
|:---|:---|
| `opencode.json` | Haupt-Config (Provider, Modelle, MCPs) |
| `oh-my-sin.json` | Zentrales Team Register |
| `oh-my-openagent.json` | Subagenten-Modelle |

### Subagenten-Modelle

| Subagent | Modell |
|:---|:---|
| **explore** | `nvidia-nim/stepfun-ai/step-3.5-flash` |
| **librarian** | `nvidia-nim/stepfun-ai/step-3.5-flash` |

→ [Full Documentation](https://github.com/OpenSIN-AI/OpenSIN-documentation/blob/main/docs/guide/agent-configuration.md)

## License

MIT