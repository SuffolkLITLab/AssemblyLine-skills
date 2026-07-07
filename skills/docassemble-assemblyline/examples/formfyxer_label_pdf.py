#!/usr/bin/env python
"""Auto-label PDF fields with FormFyxer."""

from formfyxer import auto_name_pdf_fields


def main() -> None:
    input_pdf = "raw_form.pdf"
    output_pdf = "labeled_form.pdf"

    stats = auto_name_pdf_fields(
        input_pdf,
        output_pdf,
        model="gpt-4o-mini",
    )

    print("PDF fields renamed:", stats)


if __name__ == "__main__":
    main()
