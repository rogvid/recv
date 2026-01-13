#!/usr/bin/env bash
# Image Compare Skill Handler
# Delegates image comparison to a sub-agent

set -euo pipefail

SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
IMAGES=()
PROMPT=""
CONTEXT=""

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --images)
            shift
            while [[ $# -gt 0 && ! "$1" =~ ^-- ]]; do
                IMAGES+=("$1")
                shift
            done
            ;;
        --prompt)
            PROMPT="$2"
            shift 2
            ;;
        --context)
            CONTEXT="$2"
            shift 2
            ;;
        *)
            echo "Unknown argument: $1"
            exit 1
            ;;
    esac
done

# Validate inputs
if [ ${#IMAGES[@]} -lt 2 ]; then
    echo "Error: At least 2 images required for comparison"
    exit 1
fi

if [ -z "$PROMPT" ]; then
    echo "Error: Prompt is required"
    exit 1
fi

# Check all images exist
for img in "${IMAGES[@]}"; do
    if [ ! -f "$img" ]; then
        echo "Error: Image not found: $img"
        exit 1
    fi
done

# Build the comparison prompt
FULL_PROMPT="# Image Comparison Task

## Images to Compare
"

for i in "${!IMAGES[@]}"; do
    FULL_PROMPT+="
Image $((i+1)): ${IMAGES[$i]}
"
done

FULL_PROMPT+="

## Analysis Request
$PROMPT
"

if [ -n "$CONTEXT" ]; then
    FULL_PROMPT+="

## Additional Context
$CONTEXT
"
fi

FULL_PROMPT+="

## Instructions
1. Load and analyze all provided images
2. Perform detailed visual comparison
3. Provide comprehensive textual analysis covering all requested aspects
4. Structure your response with clear sections and actionable recommendations
5. DO NOT include images in your response - only detailed text analysis

Please provide your complete analysis now."

# Output the prompt and images for the sub-agent
echo "$FULL_PROMPT"
