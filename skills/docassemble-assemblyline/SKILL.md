---
name: docassemble-assemblyline
description: Provides guidelines, conventions, and tool-selection guidance for building high-quality Docassemble interviews following Suffolk LIT Lab AssemblyLine standards. Covers YAML structure, naming conventions, DOCX/PDF labeling, ALWeaver drafting, ALDashboard server workflows, DAYamlChecker validation, ALKiln tests, translation, and deployment.
---

# Docassemble AssemblyLine Development Guide

Use this skill when developing, reviewing, refactoring, testing, or deploying Docassemble interviews that should follow Suffolk LIT Lab AssemblyLine conventions.

## Core behavior

When helping with Docassemble interview development:

1. Prefer AssemblyLine conventions and reusable classes over one-off code.
2. Keep interview code readable, modular, and easy for legal aid technologists to maintain.
3. Distinguish local-only workflows from workflows that require a running Docassemble server.
4. Validate YAML and templates before suggesting deployment.
5. For generated code, prefer small, testable changes over large rewrites.
6. When in doubt, explain which tool should be used and why.

## Tool selection

Use the ecosystem tools this way:

- **ALWeaver**: Generate first-draft Docassemble interviews from labeled PDF or DOCX templates.
- **ALDashboard**: Run server-backed developer workflows, including DOCX auto-labeling, DOCX validation, YAML checking/reformatting, PDF labeling/repair, review-screen generation, translation file generation, and package/server admin workflows.
- **DAYamlChecker**: Run static YAML validation and AssemblyLine style checks locally or through ALDashboard.
- **ALKiln**: Run browser-based automated tests for Docassemble interviews.
- **FormFyxer**: Detect, rename, repair, and normalize PDF form fields.
- **docassemblecli**: Deploy packages to a Docassemble server from a local package directory.
- **ALToolbox**: Use reusable Python helpers, widgets, and components for interviews.

See `references/tool-selection.md` for more detail.

## Environment setup

For a new agent workspace or local development environment:

```bash
bash scripts/setup-ubuntu.sh
bash scripts/setup-python.sh
```

Do not inline large dependency lists in generated instructions unless the user explicitly asks. Point to the scripts instead.

## Recommended interview file organization

Use lowercase `snake_case` filenames.

- `main.yml`: interview order, metadata, imports, objects, mandatory blocks, bundles, and final download/send screens.
- `questions.yml`: reusable question blocks.
- `logic.yml`: code blocks and calculations.
- `[document].yml`: document-specific questions and attachment blocks. Do not put mandatory blocks here unless there is a specific reason.
- `review.yml`: review screen blocks when separated from main interview flow.
- `data/templates/`: PDF and DOCX templates.
- `data/static/`: images, CSS, and other static files.
- `tests/`: ALKiln tests and fixtures.

## YAML conventions

When writing Docassemble YAML blocks:

- Include stable, descriptive `id` values.
- Put interview order in a small number of clear mandatory blocks.
- Prefer existing AssemblyLine screens such as `al_intro_screen` where appropriate.
- Gather standard parties with AssemblyLine objects and methods such as `users.gather()` and `other_parties.gather()`.
- Keep Python code blocks short and named by purpose.
- Avoid hardcoded English inside Python code blocks when the text may need translation.
- Put user-facing text in question, template, or attachment blocks.

Example question block:

```yaml
---
id: client contact information
question: |
  What is your contact information?
fields:
  - First name: users[0].name.first
  - Last name: users[0].name.last
  - Email: users[0].email
    datatype: email
    required: False
---
```

Example interview order:

```yaml
---
id: interview order
mandatory: True
code: |
  al_intro_screen
  users.gather()
  other_parties.gather()
  signature_date
  al_user_bundle.download()
---
```

## Naming conventions

- Use clear nouns, not ambiguous abbreviations.
- Prefer standard AssemblyLine object names such as `users`, `other_parties`, `children`, `trial_court`, and `docket_number` when they apply.
- Use contextual date names, such as `signature_date`, `hearing_date`, or `service_date`.
- Avoid generic date variables like `day`, `month`, and `year`.
- For PDF checkboxes and radio buttons, map fields cleanly to booleans or invariant values.
- Avoid overloading a variable with multiple meanings.

## DOCX template guidance

For DOCX templates:

- Use Jinja2 variables with double curly braces, for example `{{ users[0].name.full() }}`.
- Use paragraph-aware Jinja tags for conditional paragraphs: `{%p if condition %}` and `{%p endif %}`.
- Use row-aware tags for tables when needed, such as `{%tr for item in items %}`.
- Validate DOCX templates before deployment.
- Use ALDashboard for AI-assisted DOCX labeling when a running server is available.

See `references/server-workflows.md` and `examples/aldashboard_docx_auto_label.sh`.

## PDF template guidance

For PDF templates:

- Prefer meaningful field names that map directly to interview variables or expressions.
- Use FormFyxer to detect, rename, normalize, and repair PDF fields.
- For scanned or broken PDFs, repair or OCR the PDF before field mapping.
- Keep attachment field expressions readable and explicit.

See `examples/formfyxer_label_pdf.py`.

## Draft generation with ALWeaver

Use ALWeaver to create a first draft from labeled PDF or DOCX templates. Treat the generated interview as a starting point, not final code.

See `examples/alweaver_generate.py`.

After generating a draft:

1. Review YAML structure and variable names.
2. Move generated logic into the project’s preferred file layout.
3. Run DAYamlChecker.
4. Add or update ALKiln tests.
5. Test on a Docassemble server.

## Validation with DAYamlChecker

Prefer local validation when possible:

```bash
dayamlchecker --style path/to/interview.yml
```

For AI-backed style checks, use:

```bash
OPENAI_API_KEY=... dayamlchecker --style-llm path/to/interview.yml
```

See `examples/dayamlchecker.sh`.

## Testing with ALKiln

Use ALKiln for browser-based tests of interview flows.

General practice:

1. Create a short smoke test for every interview.
2. Add tests for branching logic, optional documents, and edge cases.
3. Run tests before deployment or major refactors.
4. Use ALDashboard-generated test drafts as a starting point when available.

## Deployment with docassemblecli

Use `docassemblecli` to deploy a local package to a Docassemble server.

Typical flow:

1. Scaffold a package with `dacreate PackageName` when starting from scratch.
2. Configure `docassemblecli` for the target server.
3. From the package directory, run `dainstall`.
4. Test the installed package in a Docassemble playground or staging server.

## Translation and localization

For translation-ready interviews:

- Use invariant values in `choices`, for example `Label: invariant_value`.
- Avoid hardcoded English inside Python code blocks.
- Use Docassemble `template` blocks for reusable user-facing text.
- Do not match on English fragments in question text.
- Avoid `pattern.en` helpers inside translatable question text.
- If sentence structure differs by language, use a Mako conditional around the entire sentence.

Generating translation XLSX files requires a running Docassemble server with ALDashboard:

```text
POST /al/api/v1/dashboard/translation
```

See `references/server-workflows.md`.

## Server-backed workflows

Some workflows require a running Docassemble server:

- ALDashboard translation generation.
- ALDashboard DOCX auto-labeling.
- ALDashboard DOCX validation.
- ALDashboard PDF field detection, relabeling, and repair.
- ALDashboard YAML checking/reformatting through the API.
- Deployment with `docassemblecli`.

Do not tell the user these workflows can be completed locally unless a local Docassemble server or local ALDashboard Flask server is actually running.

## Review checklist

Before considering an interview ready:

- YAML parses successfully.
- DAYamlChecker passes, or known warnings are documented.
- Required variables are gathered before use.
- Attachments assemble without undefined variables.
- DOCX/PDF templates are validated.
- ALKiln smoke tests pass.
- Branching paths for optional documents are tested.
- User-facing text is localization-friendly.
- File names and variable names follow AssemblyLine conventions.
- Final download/send screens work.
