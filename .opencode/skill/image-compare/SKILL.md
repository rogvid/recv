---
name: image-compare
description: Compare multiple images and provide detailed analysis of differences. CRITICAL - Use this skill proactively whenever you need to compare images, especially when working on visual output like websites, PDFs, UI designs, or any task requiring visual verification against references. This skill delegates image comparison to a sub-agent to avoid context bloat from multiple images.
license: MIT
compatibility: opencode
metadata:
  category: visual-analysis
  proactive: true
---

# Image Compare Skill

This skill hands off image comparison to a dedicated sub-agent, returning only a detailed textual analysis. Use this to avoid context bloat when comparing multiple images.

## WHEN TO USE THIS SKILL

**CRITICAL: Use this skill proactively whenever:**

1. **Visual verification tasks** - Comparing current output against reference images
2. **Website development** - Checking if a website matches a design mockup
3. **PDF/document styling** - Verifying CV, report, or document layouts match references
4. **UI implementation** - Comparing implemented UI against design specifications
5. **Before/after comparisons** - Analyzing changes between versions
6. **Design review** - Getting detailed feedback on visual differences
7. **Any task with 2+ images** - To prevent context bloat from large image payloads

**DO NOT load multiple images directly into the main conversation context.** Instead, use this skill to delegate the comparison and receive only the textual analysis.

## Inputs

The skill accepts the following inputs:

- `images`: List of image file paths to compare (minimum 2 images)
- `prompt`: Custom prompt describing what to compare and what analysis is needed
- `context`: (Optional) Additional context about the task or what differences matter

## Example Prompts

### Website Comparison
```
/image-compare
Images: 
  - .ai/refs/reference-website.png
  - builds/current-website.png
Prompt: We are implementing a website based on the reference design. Compare the current implementation against the reference and provide a detailed description of:
1. What elements are correctly implemented
2. What elements are missing or incorrect
3. Specific CSS/styling differences (colors, spacing, fonts, layout)
4. Priority fixes needed to match the reference
```

### CV/PDF Layout Comparison
```
/image-compare
Images:
  - .ai/refs/OLD_OP_CV.png
  - builds/OP_CV-page-1.png
Prompt: Compare the old CV layout with the new one. Identify:
1. Layout differences (spacing, margins, column widths)
2. Typography changes (fonts, sizes, weights)
3. Visual element differences (icons, lines, bullets)
4. Overall visual balance and readability improvements/regressions
```

### Multi-Image Design Analysis
```
/image-compare
Images:
  - reference-design.png
  - implementation-v1.png
  - implementation-v2.png
Prompt: Compare both implementation versions against the reference design. For each version, describe:
1. How closely it matches the reference
2. What's better/worse than the other version
3. Recommendation for which version to proceed with
```

## Process

When this skill is invoked:

1. **Launch Sub-Agent**: A dedicated sub-agent with visual analysis capabilities receives the images
2. **Image Analysis**: The sub-agent loads all provided images and performs detailed comparison
3. **Generate Report**: The sub-agent creates a comprehensive textual analysis
4. **Return Results**: Only the textual analysis is returned to the main agent (no images in context)

## Output Format

The skill returns a detailed textual report containing:

### Visual Differences Summary
- High-level overview of major differences
- Similarity assessment (percentage or qualitative)

### Detailed Element Analysis
For each significant difference:
- **Element**: What element/area differs
- **Reference**: How it appears in the reference image(s)
- **Current**: How it appears in the comparison image(s)
- **Severity**: Critical / Major / Minor / Cosmetic
- **Recommendation**: Specific fix or adjustment needed

### Actionable Recommendations
- Prioritized list of changes to make
- Specific CSS/code suggestions when applicable
- Warnings about potential issues

## Benefits

1. **Context Efficiency**: Large images stay in sub-agent context only
2. **Detailed Analysis**: Dedicated focus on visual comparison
3. **Structured Output**: Consistent, actionable reports
4. **Proactive Use**: Integrate into any visual workflow

## Integration with Workflows

### Plan -> Execute -> Test -> Review Loop

This skill fits into the review step:

```
1. Plan: Define visual requirements
2. Execute: Implement changes
3. Test: Compile/build output
4. Review: USE THIS SKILL to compare against reference
   /image-compare reference.png output.png "Verify implementation matches design"
5. Iterate: Fix issues identified in comparison
```

### Example Workflow

```bash
# After implementing website changes
# 1. Take screenshot of current state
playwright screenshot current.png

# 2. Compare against reference
/image-compare .ai/refs/design.png current.png "Compare implementation to design mockup"

# 3. Receive detailed analysis (text only, no image bloat)
# 4. Fix identified issues
# 5. Repeat until matching
```

## Notes

- Always provide clear, specific prompts for best results
- Include context about what aspects matter most (layout, colors, typography, etc.)
- The sub-agent has full visual analysis capabilities
- Results are comprehensive but returned as text only
- Use this skill BEFORE claiming work is "complete" on visual tasks
