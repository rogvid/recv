#!/bin/bash
# build-cv.sh - Build CV from templates
# Usage: ./build-cv.sh [template] [output-dir]

set -e  # Exit on error

# Default values
TEMPLATE="${1:-CV}"
OUTPUT_DIR="${2:-builds/latest}"

# Template files
TEMPLATE_FILE="templates/${TEMPLATE}.typ"

# Check if template exists
if [ ! -f "$TEMPLATE_FILE" ]; then
    echo "Error: Template file not found: $TEMPLATE_FILE"
    echo ""
    echo "Available templates:"
    ls -1 templates/*.typ | sed 's/templates\//  - /' | sed 's/\.typ$//'
    exit 1
fi

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Build PDF
echo "Building CV from template: $TEMPLATE"
echo "Output directory: $OUTPUT_DIR"
echo ""

typst compile --root . "$TEMPLATE_FILE" "$OUTPUT_DIR/CV.pdf"

echo "✓ Built: $OUTPUT_DIR/CV.pdf"

# Optional: Also export to PNG for preview
if [ "$3" == "--preview" ] || [ "$3" == "-p" ]; then
    echo ""
    echo "Generating PNG preview..."
    typst compile --root . "$TEMPLATE_FILE" "$OUTPUT_DIR/CV-page-{p}.png" --ppi 150
    echo "✓ Preview: $OUTPUT_DIR/CV-page-*.png"
fi

echo ""
echo "Done!"
