# Contributing

This repository stores reusable agent-facing skills and supporting scripts for AssemblyLine development.

## Guidelines

- Keep `SKILL.md` focused on durable agent behavior and conventions.
- Put setup commands in `scripts/`.
- Put longer explanations in `docs/`.
- Put runnable snippets in `examples/`.
- Avoid hardcoding API keys, server URLs, or private package names.
- Prefer links to source repositories for tool-specific details.

## Review checklist

Before opening a pull request:

- Shell scripts use `set -euo pipefail`.
- Examples have placeholders instead of secrets.
- The skill file does not duplicate long setup scripts.
- Tool-specific instructions identify when a running Docassemble server is required.
