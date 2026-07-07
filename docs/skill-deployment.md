# Deploying the AssemblyLine skill

This repository's canonical skill is:

```text
skills/docassemble-assemblyline/SKILL.md
```

The skill is a reusable agent instruction package, not a Docassemble package. Deploy it by copying the skill directory into the skill-discovery location used by your agent. Because this `SKILL.md` points to supporting material in `docs/`, `scripts/`, and `examples/`, the recommended install copies those folders into the deployed skill directory too.

Run the commands below from the root of this repository.

## Before deployment

1. Review `skills/docassemble-assemblyline/SKILL.md` and the supporting files you plan to install.
2. Keep the deployed folder name as `docassemble-assemblyline`; OpenCode requires the `name` frontmatter to match the directory name.
3. Do not add secrets, API keys, private server URLs, or client data to a skill directory.
4. Restart the agent if it does not notice a newly created top-level skills directory.

## Shared helper

Use this helper for any of the targets below:

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

Codex reads skills from `.agents/skills` in the current repository, from `$HOME/.agents/skills`, and from admin/system locations. Use a repository install when the skill should travel with one codebase, and a user install when you want the skill available across projects.

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
2. In the CLI or IDE, run `/skills` or type `$` and look for `docassemble-assemblyline`.
3. Try a prompt such as:

```text
Use the docassemble-assemblyline skill to review this interview for AssemblyLine conventions.
```

If the skill is missing, confirm the folder contains `SKILL.md` and restart Codex.

## OpenCode

OpenCode supports its own skill paths and also understands Claude-compatible and agent-compatible paths. Prefer OpenCode's native paths unless you intentionally want the same installed copy to be shared with another agent.

### User-scoped install

```bash
install_assemblyline_skill "$HOME/.config/opencode/skills/docassemble-assemblyline"
```

### Repository-scoped install

```bash
install_assemblyline_skill ".opencode/skills/docassemble-assemblyline"
```

Commit `.opencode/skills/docassemble-assemblyline/` if the whole team should get the skill with the repository.

### Optional permissions

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
2. Ask a prompt that explicitly names the skill, for example:

```text
Use the docassemble-assemblyline skill to suggest ALKiln smoke tests for this interview.
```

3. If the skill is not loaded, check that `SKILL.md` is capitalized exactly, the `name` is `docassemble-assemblyline`, and your skill permissions do not deny it.

## Claude Code

Claude Code reads personal skills from `~/.claude/skills/<skill-name>/SKILL.md` and project skills from `.claude/skills/<skill-name>/SKILL.md`. The skill directory name becomes the slash command name.

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

3. Or use a matching prompt:

```text
Use the docassemble-assemblyline skill to check this Docassemble interview before deployment.
```

Claude Code watches skill directories for edits, but if you created a new top-level skills directory after starting Claude Code, restart the session.

## Updating an installed skill

After pulling changes to this repository, rerun the same install command for each target you use. The helper replaces the old deployed copy so deleted supporting files do not linger.

## References

- Codex Agent Skills: https://developers.openai.com/codex/skills
- OpenCode Agent Skills: https://opencode.ai/docs/skills
- Claude Code Skills: https://code.claude.com/docs/en/skills
