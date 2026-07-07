# Deploying the AssemblyLine skill

This repository's canonical skill is:

```text
skills/docassemble-assemblyline/SKILL.md
```

The skill is an agent instruction package, not a Docassemble package. Install it by copying the skill directory into the skill-discovery location used by your agent.

Because `SKILL.md` refers to supporting material in `docs/`, `scripts/`, and `examples/`, the recommended install copies those folders with the skill.

Run the commands below from the root of this repository.

## Before deployment

1. Review `skills/docassemble-assemblyline/SKILL.md` and the supporting files you plan to install.
2. Keep the deployed folder name as `docassemble-assemblyline`.
3. Do not add secrets, API keys, private server URLs, or client data to a skill directory.
4. Restart the agent if it does not notice a newly created skills directory.

## Shared install helper

```bash
install_assemblyline_skill() {
  target="$1"
  test -n "$target"
  rm -rf "$target"
  mkdir -p "$target"

  cp -R skills/docassemble-assemblyline/. "$target"/
  cp -R docs scripts examples "$target"/
}
```

## Codex

Use a repository install when the skill should travel with one codebase. Use a user install when you want it available across projects.

### User-scoped install

```bash
install_assemblyline_skill "$HOME/.agents/skills/docassemble-assemblyline"
```

### Repository-scoped install

```bash
install_assemblyline_skill ".agents/skills/docassemble-assemblyline"
```

Commit `.agents/skills/docassemble-assemblyline/` if the whole team should get the skill with the repository.

### Verify in Codex

1. Start Codex from the relevant repository or workspace.
2. Run `/skills` or type `$` and look for `docassemble-assemblyline`.
3. Try a prompt such as:

```text
Use the docassemble-assemblyline skill to review this interview for AssemblyLine conventions.
```

If the skill is missing, confirm the folder contains `SKILL.md` and restart Codex.

## OpenCode

Prefer OpenCode's native paths unless you intentionally want to share one installed copy with another agent.

### User-scoped install

```bash
install_assemblyline_skill "$HOME/.config/opencode/skills/docassemble-assemblyline"
```

### Repository-scoped install

```bash
install_assemblyline_skill ".opencode/skills/docassemble-assemblyline"
```

Commit `.opencode/skills/docassemble-assemblyline/` if the whole team should get the skill with the repository.

### Optional permission

If your OpenCode configuration restricts skills, allow this skill in `opencode.json`:

```json
{
  "permission": {
    "skill": {
      "docassemble-assemblyline": "allow"
    }
  }
}
```

### Verify in OpenCode

1. Start OpenCode from the relevant repository or workspace.
2. Ask a prompt that explicitly names the skill:

```text
Use the docassemble-assemblyline skill to suggest ALKiln smoke tests for this interview.
```

If the skill is not loaded, check that `SKILL.md` is capitalized exactly, the directory is named `docassemble-assemblyline`, and your skill permissions do not deny it.

## Claude Code

Use a personal install for all projects or a project install for one repository.

### Personal install

```bash
install_assemblyline_skill "$HOME/.claude/skills/docassemble-assemblyline"
```

### Project install

```bash
install_assemblyline_skill ".claude/skills/docassemble-assemblyline"
```

Commit `.claude/skills/docassemble-assemblyline/` if the whole team should get the skill with the repository.

### Verify in Claude Code

1. Start Claude Code from the relevant repository or workspace:

```bash
claude
```

2. Invoke the skill directly:

```text
/docassemble-assemblyline
```

Or use a matching prompt:

```text
Use the docassemble-assemblyline skill to check this Docassemble interview before deployment.
```

Claude Code watches skill directories for edits, but restart the session if you created a new top-level skills directory after Claude Code was already running.

## Hosted chat options

Hosted chat products do not all install local `SKILL.md` folders. Use the closest supported equivalent.

| Product | Recommended setup |
| --- | --- |
| ChatGPT | Create a Project or custom GPT. Put the durable rules from `SKILL.md` in the instructions and upload supporting `docs/` and selected `examples/` as reference files. |
| Claude web/desktop apps | Create a Claude custom skill when available. Use `docassemble-assemblyline` as the skill name, make this repository's `SKILL.md` the main skill file, and include supporting resources. |
| Claude Projects | Use project instructions and project knowledge when Claude Skills are unavailable or when the guidance should apply only to one project. |

ChatGPT GPT Actions, MCP connectors, and older plugin-style integrations are for connecting ChatGPT to external APIs or tools. They can complement this guidance, but they are not a direct deployment path for this `SKILL.md` skill.

## Updating an installed skill

After pulling changes to this repository, rerun the same install command for each target you use. The helper replaces the old deployed copy so deleted supporting files do not linger.

For hosted chat adaptations, manually update the pasted instructions and uploaded files whenever this repository changes.

## References

- Codex Agent Skills: https://developers.openai.com/codex/skills
- OpenCode Agent Skills: https://opencode.ai/docs/skills
- Claude Code Skills: https://code.claude.com/docs/en/skills
- ChatGPT Projects: https://help.openai.com/en/articles/10169521-using-projects-in-chatgpt
- ChatGPT custom GPTs: https://help.openai.com/en/articles/8554397-creating-a-gpt
- Claude Skills: https://claude.com/blog/skills
- Claude Projects: https://support.claude.com/en/articles/9517075-what-are-projects
