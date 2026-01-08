# AGENTS.md - Typst CV Repository Guidelines

This document provides guidelines for AI coding agents working in this Typst CV repository.

## Repository Overview

This is a Typst-based CV/Resume repository containing professional CVs in different formats:
- `CV.typ` - Standard CV with detailed formatting and visual elements
- `ATS_CV.typ` - ATS-friendly CV optimized for Applicant Tracking Systems
- Both compile to their respective PDF files

## Build Commands

### Compiling PDFs

**Build a single CV:**
```bash
typst compile CV.typ
typst compile ATS_CV.typ
```

**Build with custom output name:**
```bash
typst compile CV.typ output.pdf
```

**Watch mode (auto-rebuild on changes):**
```bash
typst watch CV.typ
typst watch ATS_CV.typ
```

**Build all CVs:**
```bash
typst compile CV.typ && typst compile ATS_CV.typ
```

**Check for errors without building:**
```bash
typst compile --diagnostic-format=short CV.typ
```

### Validation

**Format check:**
```bash
typst compile CV.typ 2>&1 | grep -i error
```

**Preview in browser (if typst supports it):**
```bash
typst watch CV.typ --open
```

## Typst Style Guidelines

### Document Structure

**Basic template structure:**
```typst
#set document(title: "CV - Name", author: "Your Name")
#set page(
  paper: "a4",
  margin: (top: 1.5cm, bottom: 1.2cm, left: 2.0cm, right: 2.0cm)
)
#set text(font: "New Computer Modern", size: 11pt, lang: "da")
#set par(justify: false, leading: 0.65em)
```

### Imports and Setup

**Standard imports:**
```typst
// No package manager yet, use built-in features
// Custom functions defined in-file or separate module
```

**Font setup:**
```typst
#set text(
  font: "New Computer Modern",  // or "Liberation Sans", "Inter"
  size: 11pt,
  lang: "da",
  hyphenate: true
)
```

### Color Scheme

**Define colors at top of document:**
```typst
#let myblue = rgb("#006C96")        // rgb(0.0, 0.43, 0.59)
#let carmine = rgb("#96000E")       // rgb(0.59, 0.0, 0.09)
#let coralred = rgb("#FF4040")      // rgb(1.0, 0.25, 0.25)
#let darkscarlet = rgb("#570319")   // rgb(0.34, 0.01, 0.1)
#let lightgray = rgb("#D4DEF0")     // rgb(0.83, 0.87, 0.94)
```

**Usage**: Use `myblue` for headlines, accents, and professional elements.

### Custom Functions

**Headline styling:**
```typst
#let headline(content) = {
  text(size: 14pt, fill: myblue, weight: "bold")[#content]
}
```

**Text line formatting (position | company | date):**
```typst
#let textline(position, company, date) = {
  grid(
    columns: (1fr, auto),
    [*#position* | #company],
    align(right)[_#date_]
  )
}
```

**Accomplishments (bullet points):**
```typst
#let accomplishment(content) = {
  text(size: 10pt)[
    #box(baseline: 20%, circle(radius: 2pt, fill: myblue))
    #h(0.3em)
    #content
  ]
}
```

**Skill bars (proficiency visualization):**
```typst
#let skillbar(filled, empty) = {
  let total = filled + empty
  box[
    #for i in range(filled) {
      circle(radius: 2pt, fill: myblue)
      h(2pt)
    }
    #for i in range(empty) {
      circle(radius: 2pt, fill: rgb("#CCCCCC"))
      h(2pt)
    }
  ]
}
```

**Section divider:**
```typst
#let section-line() = {
  line(length: 100%, stroke: 0.3mm + myblue)
}
```

### Formatting Conventions

**Spacing:**
- Use `v(0.2cm)` for consistent vertical spacing
- Section headers followed by `section-line()`
- Use `h(0.5cm)` for horizontal spacing

**Page Layout:**
```typst
#set page(
  paper: "a4",
  margin: (top: 1.5cm, bottom: 1.2cm, left: 2.0cm, right: 2.0cm),
  numbering: none
)
```

**Text Sizes:**
```typst
// Name: 24pt
// Title: 18pt
// Section headings: 14pt
// Body text: 11pt
// Details: 10pt

#text(size: 24pt)[Name]
#text(size: 18pt)[Title]
#text(size: 14pt)[Section]
#text(size: 11pt)[Body]
#text(size: 10pt)[Detail]
```

### Content Structure

**Section Order:**
1. Header (Name, Title, Contact Info)
2. Summary
3. Experience / Employment History
4. Education
5. Certifications (if applicable)
6. Skills (Technical & Soft Skills)
7. Languages

**Experience Entries:**
```typst
#textline("Position", "Company", "Date Range")
#text(size: 10pt)[Description text]
#v(0.1cm)
#accomplishment[Key achievement or responsibility]
#accomplishment[Another accomplishment]
```

### Layout Techniques

**Two-column layouts:**
```typst
#grid(
  columns: (2fr, 1fr),
  column-gutter: 1em,
  [
    // Main content (left column)
  ],
  [
    // Sidebar content (right column)
  ]
)
```

**Flexible boxes:**
```typst
#box(width: 100%)[Content]
#block(width: 100%, fill: lightgray, inset: 8pt)[Highlighted content]
```

### ATS Optimization (ATS_CV.typ)

1. **Simpler formatting**: Minimal visual complexity
2. **Competency boxes**: Use simple text boxes for keywords
3. **Standard lists**: Use bullet points with `list` function
4. **More whitespace**: Larger font (12pt), more padding
5. **Standard fonts**: Use widely supported fonts

**Competency box:**
```typst
#let competency(skill) = {
  box(
    fill: rgb("#E8E8E8"),
    inset: (x: 6pt, y: 4pt),
    radius: 3pt,
    [#skill]
  )
  h(4pt)
}
```

### Typography Rules

1. **Links**: Use `#link("url")[display text]`
2. **Dates**: Full month names: "Dec. 2018 - May 2019"
3. **Abbreviations**: Use periods: "M.Sc.", "B.Sc.", "Feb."
4. **Special characters**: UTF-8 supported natively (ø, æ, å)
5. **Bold/Italic**: Use `*bold*` or `_italic_` in markup mode

### Image Handling

**Work photos:**
```typst
#image("workpicture.png", width: 70%)
```

**With alignment:**
```typst
#align(right)[
  #image("workpicture.png", width: 60%)
]
```

- Images should be in repository root or `images/` folder
- Use PNG format for photos
- Specify width as percentage or absolute measure

## Naming Conventions

**Files:**
- Main CV: `CV.typ` → `CV.pdf`
- ATS version: `ATS_CV.typ` → `ATS_CV.pdf`
- Images: lowercase with underscores: `workpicture.png`
- Modules: descriptive names: `cv-helpers.typ`, `styles.typ`

**Functions:**
- Use kebab-case: `text-line`, `skill-bar`, `section-line`
- Or camelCase: `textLine`, `skillBar` (be consistent)
- Descriptive names: `headline` not `hl`

**Colors:**
- Lowercase with descriptors: `myblue`, `coralred`, `darkscarlet`

## Error Handling

**Common Typst Errors:**

1. **Type mismatch**: Check function argument types
2. **Unknown variable**: Ensure variables are defined before use
3. **Invalid syntax**: Check for missing brackets, parentheses
4. **Missing file**: Verify image paths and imports

**Debugging approach:**
1. Compile to see specific error line numbers
2. Use `#assert()` to validate assumptions
3. Comment out sections to isolate problematic code
4. Check Typst documentation for function signatures

## Git Workflow

**Ignored files** (update `.gitignore`):
```
*.pdf
*.log
.typst-cache/
```

**What to commit:**
- `.typ` source files
- `.png` image assets
- `AGENTS.md` and documentation
- Configuration files

**What NOT to commit:**
- Compiled PDF files (optional: may commit for convenience)
- Cache directories
- Editor-specific files
- OS-specific files

## Testing Changes

Before committing changes:

1. **Compile both CVs**: `typst compile CV.typ && typst compile ATS_CV.typ`
2. **Visual inspection**: Open PDFs and check formatting
3. **Check for errors**: Review compilation output
4. **Validate links**: Ensure all URLs work correctly
5. **Cross-platform**: Test on different systems if possible

## Common Tasks

**Adding a new job:**
```typst
#textline("Job Title", "Company Name", "Month Year - Month Year")
#text(size: 10pt)[Job description and context]
#v(0.1cm)
#accomplishment[Key achievement with metrics]
#accomplishment[Another important contribution]
#v(0.3cm)
```

**Adding a skill:**
```typst
#grid(
  columns: (auto, 1fr),
  [Python], [#skillbar(5, 0)]  // 5 filled, 0 empty = expert
)
```

**Adding a certification:**
```typst
#textline("Certification Name", "Provider", "Month Year")
#text(size: 10pt)[Brief description of what was learned]
#v(0.2cm)
```

**Updating contact information:**
```typst
#align(center)[
  #text(size: 10pt)[
    +45 5042 5002 #h(0.5cm)
    argeinnovations\@gmail.com #h(0.5cm)
    #link("https://linkedin.com/in/rogvidarge/en")[LinkedIn] #h(0.5cm)
    #link("https://github.com/rogvid")[GitHub]
  ]
]
```

## Best Practices

1. **Consistency**: Match formatting style of existing entries
2. **Metrics**: Include quantifiable achievements when possible
3. **Conciseness**: Keep descriptions clear and brief
4. **Professional tone**: Maintain formal, professional language
5. **Function reuse**: Create helper functions for repeated patterns
6. **Color usage**: Use `myblue` for all accent colors consistently
7. **Whitespace**: Maintain consistent spacing between sections
8. **Compile frequently**: Build after each significant change
9. **Modular design**: Consider separating styles into reusable modules
10. **Comments**: Document complex functions and layout logic

## Typst-Specific Features

**Show rules (styling):**
```typst
#show heading.where(level: 1): it => {
  text(fill: myblue, size: 14pt, weight: "bold")[#it.body]
  v(0.2cm)
  section-line()
  v(0.2cm)
}
```

**Custom state management:**
```typst
#let section-counter = counter("sections")
#section-counter.step()
```

**Conditional content:**
```typst
#if include-photo {
  image("workpicture.png")
}
```

## Migration from LaTeX

**Package equivalents:**
- `geometry` → `#set page(margin: ...)`
- `xcolor` → `rgb()`, `cmyk()`, `luma()`
- `tikz` → Typst's native drawing with `line()`, `circle()`, `rect()`
- `hyperref` → `#link()` and automatic PDF metadata
- Custom commands → Typst functions with `#let`

**Key differences:**
- No preamble needed - settings applied inline
- Functions instead of commands
- Content mode vs. code mode
- Simpler syntax for common tasks
- Built-in grid and layout system

## Additional Notes

- Typst compiles much faster than LaTeX
- No auxiliary files needed (single pass compilation)
- Native support for modern features (no package hunting)
- Both CVs should share common helper functions (consider `cv-common.typ`)
- ATS version prioritizes parsability over visual design
- Always test PDF output for proper text extraction
- Use `typst watch` during development for live preview
