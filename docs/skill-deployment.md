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

## Hosted chat and web app options

Hosted chat products do not all install local `SKILL.md` folders the same way CLI and IDE agents do. Use the option below that matches the product.

| Product | Best option | Notes |
| --- | --- | --- |
| ChatGPT | Project or custom GPT | ChatGPT does not currently expose a `SKILL.md` folder install path in the chat UI. Use project/custom GPT instructions plus uploaded reference files instead. |
| Claude web/desktop apps | Claude Skills | Claude supports custom skills across Claude apps for Pro, Max, Team, and Enterprise users. |
| Claude Projects | Project instructions and knowledge | Useful fallback when Claude Skills are unavailable or when you want a lightweight project-specific setup. |

### ChatGPT Project adaptation

Use this when you want the AssemblyLine guidance available inside a specific ChatGPT workspace.

1. Create a new ChatGPT Project named something like `AssemblyLine development`.
2. Copy the body of `skills/docassemble-assemblyline/SKILL.md` into the project's instructions.
3. Upload supporting reference files from `docs/`, plus any examples you expect to use often.
4. Start new chats inside the project and ask ChatGPT to follow the AssemblyLine project instructions.

This is not a true agent skill install: ChatGPT treats the uploaded files as project context and the pasted text as project instructions.

### ChatGPT custom GPT adaptation

Use this when you want a reusable ChatGPT entry point that can be shared or listed in a workspace GPT store.

1. Create a custom GPT in ChatGPT.
2. Put the durable behavior rules from `SKILL.md` in the GPT's Instructions field.
3. Upload `docs/` and selected `examples/` as Knowledge files.
4. Add conversation starters such as:

```text
Review this Docassemble interview for AssemblyLine conventions.
Suggest ALKiln smoke tests for this interview.
Explain which AssemblyLine tool I should use for this task.
```

Keep behavior rules in Instructions and reference material in Knowledge. If you later update this repository, update the GPT instructions and uploaded knowledge files manually.

### Claude app custom skill

Use this when you want the closest hosted-chat equivalent to the filesystem skill.

1. In Claude, enable Skills in Settings if needed.
2. Create a custom skill. The built-in `skill-creator` skill can help generate the folder structure and `SKILL.md`.
3. Use `docassemble-assemblyline` as the skill name.
4. Add this repository's `skills/docassemble-assemblyline/SKILL.md` as the main skill file.
5. Include `docs/`, `scripts/`, and `examples/` as supporting resources if the Claude skill creation flow allows multiple files or a bundled folder.
6. Test with a prompt such as:

```text
Use the docassemble-assemblyline skill to review this interview for AssemblyLine conventions.
```

For Team and Enterprise accounts, an admin may need to enable Skills organization-wide before users can create or use custom skills.

### Claude Project fallback

Use this when Claude Skills are unavailable or when the guidance only needs to apply to one Claude project.

1. Create a Claude Project named something like `AssemblyLine development`.
2. Paste the body of `SKILL.md` into the project's instructions.
3. Upload supporting documents, code, and examples to the project's knowledge base.
4. Start chats in that project and explicitly ask Claude to follow the AssemblyLine project instructions.

Like the ChatGPT Project option, this is a project-knowledge adaptation, not a true skill installation.

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
