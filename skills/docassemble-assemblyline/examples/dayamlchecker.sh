#!/usr/bin/env bash
set -euo pipefail

: "${YAML_PATH:?Set YAML_PATH to the interview YAML file}"

dayamlchecker --style "$YAML_PATH"

# Uncomment for AI-backed checks when OPENAI_API_KEY is set.
# dayamlchecker --style-llm "$YAML_PATH"
