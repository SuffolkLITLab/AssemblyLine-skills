# AssemblyLine Skills

Agent skills, setup scripts, and reusable workflow guidance for developing high-quality Docassemble interviews that follow Suffolk LIT Lab AssemblyLine conventions.

## Contents

```text
skills/assemblyline-dev/            Self-contained AssemblyLine development skill package
skills/assemblyline-dev/SKILL.md    Main agent-facing skill
skills/assemblyline-dev/references/ Longer workflow and environment notes
skills/assemblyline-dev/scripts/    Setup scripts for agent workspaces
skills/assemblyline-dev/examples/   Small runnable examples and curl snippets
docs/skill-deployment.md            How to install or adapt the skill across agent and hosted chat products
```

## Recommended install for an agent workspace

From the repository root:

```bash
bash skills/assemblyline-dev/scripts/setup-ubuntu.sh
bash skills/assemblyline-dev/scripts/setup-python.sh
```

Some workflows require a running Docassemble server with API access, especially ALDashboard translation, ALDashboard DOCX/PDF endpoints, and deployment with `docassemblecli`.

## Skill

The canonical skill package is:

```text
skills/assemblyline-dev/
```

It is self-contained so it can be installed directly by tools that expect an agent skill directory. Its skill name is `assemblyline-dev`, which avoids confusion with the related `docassemble-AssemblyLine` package repository.

To install the skill in Codex, OpenCode, Claude Code, or adapt it for hosted chat products like ChatGPT and Claude, see [`docs/skill-deployment.md`](docs/skill-deployment.md).

## Related projects

- [docassemble-AssemblyLine](https://github.com/SuffolkLITLab/docassemble-AssemblyLine)
- [docassemble-ALWeaver](https://github.com/SuffolkLITLab/docassemble-ALWeaver)
- [docassemble-ALDashboard](https://github.com/SuffolkLITLab/docassemble-ALDashboard)
- [ALKiln](https://github.com/SuffolkLITLab/ALKiln)
- [DAYamlChecker](https://github.com/SuffolkLITLab/DAYamlChecker)
- [FormFyxer](https://github.com/SuffolkLITLab/FormFyxer)
- [docassemble-ALToolbox](https://github.com/SuffolkLITLab/docassemble-ALToolbox)
