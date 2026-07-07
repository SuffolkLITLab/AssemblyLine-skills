#!/usr/bin/env python
"""Generate a draft Docassemble interview with ALWeaver."""

from pathlib import Path

from docassemble.ALWeaver.interview_generator import generate_interview_from_path


def main() -> None:
    template_path = Path("data/templates/my_template.pdf")
    output_dir = Path("generated_output")
    output_dir.mkdir(parents=True, exist_ok=True)

    result = generate_interview_from_path(
        template_path,
        output_dir=output_dir,
        create_package_zip=True,
        include_next_steps=False,
    )

    print(f"Generated YAML at: {result.yaml_path}")


if __name__ == "__main__":
    main()
