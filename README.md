# AssemblyLine Skills

Agent skills, setup scripts, and reusable workflow guidance for developing high-quality Docassemble interviews that follow Suffolk LIT Lab AssemblyLine conventions.

## Contents

```text
skills/docassemble-assemblyline/SKILL.md   Main agent-facing skill
scripts/setup-ubuntu.sh                    Ubuntu/Debian system dependency installer
scripts/setup-python.sh                    Python package installer
docs/skill-deployment.md                   How to install the skill in Codex, OpenCode, and Claude Code
docs/tool-selection.md                     Which AssemblyLine tool to use for each task
docs/environment.md                        Local and server environment notes
docs/server-workflows.md                   ALDashboard and Docassemble server workflows
examples/                                  Small runnable examples and curl snippets
```

## Recommended install for an agent workspace

From the repository root:

```bash
bash scripts/setup-ubuntu.sh
bash scripts/setup-python.sh
```

Some workflows require a running Docassemble server with API access, especially ALDashboard translation, ALDashboard DOCX/PDF endpoints, and deployment with `docassemblecli`.

## Skill

The canonical skill file is:

```text
skills/docassemble-assemblyline/SKILL.md
```

It intentionally stays focused on agent behavior, conventions, and tool selection. Long dependency lists, curl examples, and runnable snippets live in `scripts/`, `docs/`, and `examples/`.

To install the skill in Codex, OpenCode, or Claude Code, see [`docs/skill-deployment.md`](docs/skill-deployment.md).

## Related projects

- [docassemble-AssemblyLine](https://github.com/SuffolkLITLab/docassemble-AssemblyLine)
- [docassemble-ALWeaver](https://github.com/SuffolkLITLab/docassemble-ALWeaver)
- [docassemble-ALDashboard](https://github.com/SuffolkLITLab/docassemble-ALDashboard)
- [ALKiln](https://github.com/SuffolkLITLab/ALKiln)
- [DAYamlChecker](https://github.com/SuffolkLITLab/DAYamlChecker)
- [FormFyxer](https://github.com/SuffolkLITLab/FormFyxer)
- [docassemble-ALToolbox](https://github.com/SuffolkLITLab/docassemble-ALToolbox)
