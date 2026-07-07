# Environment setup

This repository keeps setup instructions in scripts so the skill file can stay focused on agent behavior.

## Ubuntu/Debian system packages

Run:

```bash
bash scripts/setup-ubuntu.sh
```

This installs system libraries commonly needed for PDF repair, OCR, image processing, and Python package builds.

## Python packages

Run:

```bash
bash scripts/setup-python.sh
```

This installs the Python packages commonly used for Docassemble AssemblyLine development:

- `dayamlchecker`
- `formfyxer`
- `docxtpl`
- `docx2python`
- `pikepdf`
- `docassemble.ALWeaver`
- `docassemble.ALToolbox`
- `docassemblecli`

## Server-backed workflows

Some workflows cannot be completed with only local packages. They need a running Docassemble server, usually with ALDashboard installed and an API key configured.

Examples:

- Translation generation.
- ALDashboard DOCX auto-labeling.
- ALDashboard YAML check/reformat endpoints.
- ALDashboard PDF repair endpoints.
- Deployment with `docassemblecli`.

## API keys

AI-backed workflows may require one or more LLM provider keys. Prefer environment variables or server configuration over hardcoding keys in scripts.
