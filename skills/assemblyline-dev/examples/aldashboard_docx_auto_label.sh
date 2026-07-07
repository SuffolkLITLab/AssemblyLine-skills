#!/usr/bin/env bash
set -euo pipefail

: "${DOCASSEMBLE_URL:?Set DOCASSEMBLE_URL, e.g. https://apps.example.org}"
: "${DOCASSEMBLE_API_KEY:?Set DOCASSEMBLE_API_KEY}"
: "${OPENAI_API_KEY:?Set OPENAI_API_KEY}"
: "${DOCX_PATH:?Set DOCX_PATH to the input DOCX}"

curl -X POST "$DOCASSEMBLE_URL/al/api/v1/dashboard/docx/auto-label" \
  -H "X-API-Key: $DOCASSEMBLE_API_KEY" \
  -F "mode=sync" \
  -F "file=@$DOCX_PATH" \
  -F "openai_api=$OPENAI_API_KEY"
