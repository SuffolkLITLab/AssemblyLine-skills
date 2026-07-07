# Tool selection guide

Use this guide to decide which AssemblyLine ecosystem tool belongs in a workflow.

## ALWeaver

Use ALWeaver when you need to generate a first-draft Docassemble interview from a labeled PDF or DOCX template.

Good tasks:

- Generate initial YAML from a labeled court form.
- Produce a package draft from a template.
- Bootstrap an interview before manual refactoring.

Do not treat ALWeaver output as final production code without review, validation, and testing.

## ALDashboard

Use ALDashboard for Docassemble-server-backed workflows and admin/developer utilities.

Good tasks:

- DOCX auto-labeling.
- DOCX template validation.
- Translation XLSX generation and validation.
- YAML checking and reformatting through a server API.
- PDF field detection, relabeling, and repair.
- Review screen draft generation.
- Package installation and server maintenance.

Most ALDashboard workflows require a running Docassemble server and API key. Some development workflows can be run from a local checkout if the relevant Flask app is running.

## DAYamlChecker

Use DAYamlChecker for static validation and style review of Docassemble YAML.

Good tasks:

- Catch YAML syntax problems.
- Enforce Docassemble and AssemblyLine style expectations.
- Run AI-backed style review when an API key is available.

## ALKiln

Use ALKiln for browser-based interview tests.

Good tasks:

- Smoke-test the main interview path.
- Test branching logic.
- Test optional document inclusion.
- Test final assembly/download behavior.

## FormFyxer

Use FormFyxer for PDF field work.

Good tasks:

- Detect missing fields.
- Rename fields into AssemblyLine-style names.
- Repair malformed PDFs.
- Normalize checkbox appearances.
- Prepare PDFs before ALWeaver or manual attachment mapping.

## docassemblecli

Use `docassemblecli` for deployment to a Docassemble server.

Good tasks:

- Install a local package to a playground or staging server.
- Automate deploy/test loops.

## ALToolbox

Use ALToolbox for reusable Python helpers, widgets, and components inside interviews.

Good tasks:

- Add small reusable functionality to interviews.
- Avoid duplicating common utilities in individual packages.
