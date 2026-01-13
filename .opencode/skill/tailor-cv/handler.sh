#!/bin/bash
# .opencode/skills/tailor-cv/handler.sh
# Main entry point for the tailor-cv skill
# This script is called by OpenCode when the skill is invoked

set -e

SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SKILL_DIR/../../.." && pwd)"

cd "$PROJECT_ROOT"

# Parse arguments
JOB_INPUT="$1"
JOB_NAME="${2:-}"

if [ -z "$JOB_INPUT" ]; then
    echo "Usage: /tailor-cv <job_description_url_or_file> [job_name]"
    exit 1
fi

echo "=========================================="
echo "CV Tailoring Skill"
echo "=========================================="
echo ""
echo "Input: $JOB_INPUT"
echo "Custom name: ${JOB_NAME:-auto-detect}"
echo ""

# The actual LLM-powered analysis will be done by the OpenCode agent
# This is just a wrapper that sets up the environment

# Check if input is a URL or file
if [[ "$JOB_INPUT" =~ ^https?:// ]]; then
    echo "Note: URL input detected. The OpenCode agent will fetch the content."
    INPUT_TYPE="url"
else
    if [ ! -f "$JOB_INPUT" ]; then
        echo "Error: File not found: $JOB_INPUT"
        exit 1
    fi
    INPUT_TYPE="file"
fi

echo "Input type: $INPUT_TYPE"
echo ""
echo "The OpenCode agent will now:"
echo "  1. Extract and analyze the job description"
echo "  2. Match requirements to your work experience"
echo "  3. Generate tailored CV configurations"
echo "  4. Compile both OP_CV and ATS_CV"
echo "  5. Generate previews and reports"
echo ""
echo "Please wait..."
