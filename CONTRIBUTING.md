# Contributing

This repository stores reusable agent-facing skills and supporting resources for AssemblyLine development.

## Guidelines

- Keep `SKILL.md` focused on durable agent behavior and conventions.
- Keep each skill package self-contained under `skills/<skill-name>/`.
- Put setup commands in the skill package's `scripts/` directory.
- Put longer explanations in the skill package's `references/` directory.
- Put runnable snippets in the skill package's `examples/` directory.
- Avoid hardcoding API keys, server URLs, or private package names.
- Prefer links to source repositories for tool-specific details.

## Review checklist

Before opening a pull request:

- Shell scripts use `set -euo pipefail`.
- Examples have placeholders instead of secrets.
- The skill file does not duplicate long setup scripts.
- Tool-specific instructions identify when a running Docassemble server is required.
- File references in `SKILL.md` are relative to the skill package root.
