# Server-backed workflows

Several AssemblyLine development workflows require a running Docassemble server.

## ALDashboard API

When ALDashboard is installed on a Docassemble server, it exposes API endpoints for common developer workflows.

Common endpoints include:

- `POST /al/api/v1/dashboard/translation`
- `POST /al/api/v1/dashboard/docx/auto-label`
- `POST /al/api/v1/dashboard/docx/validate`
- `POST /al/api/v1/dashboard/yaml/check`
- `POST /al/api/v1/dashboard/yaml/reformat`
- `POST /al/api/v1/dashboard/pdf/label-fields`
- `POST /al/api/v1/dashboard/pdf/fields/detect`
- `POST /al/api/v1/dashboard/pdf/fields/relabel`
- `POST /al/api/v1/dashboard/pdf/repair`
- `POST /al/api/v1/dashboard/review-screen/draft`

## DOCX auto-labeling

See:

```bash
examples/aldashboard_docx_auto_label.sh
```

## Translation generation

Translation generation requires a running Docassemble server. Use the ALDashboard translation endpoint to extract strings and generate the XLSX file.

Typical request shape:

```bash
curl -X POST "$DOCASSEMBLE_URL/al/api/v1/dashboard/translation" \
  -H "X-API-Key: $DOCASSEMBLE_API_KEY" \
  -F "interview_path=docassemble.MyPackage:data/questions/main.yml" \
  -F "tr_langs=es"
```

## YAML check through ALDashboard

Prefer local DAYamlChecker when possible. Use ALDashboard when the check should run against the server environment or through an agent tool bridge.

```bash
curl -X POST "$DOCASSEMBLE_URL/al/api/v1/dashboard/yaml/check" \
  -H "X-API-Key: $DOCASSEMBLE_API_KEY" \
  -F "filename=main.yml" \
  -F "yaml_text=@main.yml"
```

## ALDashboard MCP-style bridge

If enabled, ALDashboard can expose a lightweight MCP-style tool discovery and call bridge. Use this when an agent needs to discover and call ALDashboard or ALWeaver server tools through a single endpoint.
