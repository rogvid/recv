# AGENTS.md - LaTeX CV Repository Guidelines

This document provides guidelines for AI coding agents working in this LaTeX CV repository.

## Repository Overview

This is a LaTeX-based CV/Resume repository containing professional CVs in different formats:
- `CV.tex` - Standard CV with detailed formatting and visual elements
- `ATS_CV.tex` - ATS-friendly CV optimized for Applicant Tracking Systems
- Both compile to their respective PDF files

## Build Commands

### Compiling PDFs

**Build a single CV:**
```bash
pdflatex CV.tex
pdflatex ATS_CV.tex
```

**Build with bibliography/references (if needed):**
```bash
pdflatex CV.tex
bibtex CV
pdflatex CV.tex
pdflatex CV.tex
```

**Using latexmk (recommended for automated builds):**
```bash
latexmk -pdf CV.tex
latexmk -pdf ATS_CV.tex
```

**Clean auxiliary files:**
```bash
latexmk -c           # Clean auxiliary files, keep PDF
latexmk -C           # Clean all including PDF
rm -f *.aux *.log *.out  # Manual cleanup
```

**Build all CVs:**
```bash
pdflatex CV.tex && pdflatex ATS_CV.tex
```

### Validation

**Check for LaTeX errors:**
```bash
pdflatex -halt-on-error CV.tex
```

**Spell check (if aspell is available):**
```bash
aspell --mode=tex check CV.tex
```

## LaTeX Style Guidelines

### Document Structure

1. **Document Class**: Use `\documentclass[11pt,a4paper]{article}` or `[12pt,a4paper]`
2. **Encoding**: Always use UTF-8: `\usepackage[utf8]{inputenc}`
3. **Font Encoding**: Use T1 encoding: `\usepackage[T1]{fontenc}`
4. **Language**: Danish babel is used: `\usepackage[danish]{babel}`

### Package Management

**Required Packages** (maintain this order for compatibility):
- Geometry packages first: `geometry`
- Graphics: `tikz`, `pgffor`, `graphicx`
- Math: `amsmath`, `amsthm`, `amssymb`, `latexsym`
- Formatting: `color`, `colortbl`, `xcolor`, `microtype`
- Layout: `hyperref`, `url`, `setspace`, `changepage`
- Custom parsing: `xparse`

**Important**: Always load `hyperref` near the end of package declarations to avoid conflicts.

### Color Scheme

**Primary brand color:**
```latex
\definecolor{myblue}{rgb}{0.0, 0.43, 0.59}
```

**Additional colors:**
```latex
\definecolor{carmine}{rgb}{0.59, 0.0, 0.09}
\definecolor{coralred}{rgb}{1.0, 0.25, 0.25}
\definecolor{darkscarlet}{rgb}{0.34, 0.01, 0.1}
\definecolor{MyColor}{rgb}{0.83,0.87,0.94}
```

**Usage**: Use `myblue` for headlines, accents, and professional elements.

### Custom Commands

**Headline styling:**
```latex
\newcommand{\headline}[1]{\Large \textcolor{myblue}{#1}}
```

**Text line formatting (position | company | date):**
```latex
\newcommand{\textline}[3]{\normalsize \textbf{#1} | #2 \hfill \textit{#3}}
```

**Accomplishments (bullet points):**
```latex
\newcommand{\accomplishment}[1]{{\hspace*{-9pt}\textcolor{myblue}{$\bullet$}}\hspace*{4pt}\linespread{1.1}\footnotesize#1}
```

**Skill bars (proficiency visualization):**
```latex
\newcommand{\skillbar}[2]{...}  % Takes filled and empty counts
```

### Formatting Conventions

**Spacing:**
- Use `\vspace{0.2cm}` for consistent vertical spacing
- Section headers followed by `\hrule height 0.3mm`
- Line spread: `\linespread{1.0}` for body text

**Page Layout:**
- Margins: `[top=1.5cm, bottom=1.2cm, left=2.0cm, right=2.0cm]`
- No page numbering: `\pagenumbering{gobble}`
- No paragraph indentation: `\parindent0em`

**Font Sizes:**
- Name: `\Huge`
- Title: `\Large`
- Section headings: `\Large` (via `\headline`)
- Body text: `\normalsize`
- Details: `\footnotesize`

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
```latex
\textline{Position}{Company}{Date Range}\\
\footnotesize Description text\\
\accomplishment{Key achievement or responsibility}\\
```

### ATS Optimization (ATS_CV.tex)

1. **Simpler formatting**: Less visual complexity
2. **Competency boxes**: Use `\competency{}` for keyword highlighting
3. **Itemized lists**: Use standard `itemize` with custom bullet colors
4. **More whitespace**: Larger font (12pt), more padding
5. **Standard fonts**: Avoid complex font customizations

### Typography Rules

1. **Hyperlinking**: Always use `\url{}` for URLs, never raw text
2. **Dates**: Use full month names: "Dec. 2018 - May 2019"
3. **Abbreviations**: Use periods: "M.Sc.", "B.Sc.", "Feb."
4. **Danish characters**: UTF-8 encoded (ø, æ, å)
5. **Professional titles**: Bold for emphasis

### Image Handling

**Work photos:**
```latex
\includegraphics[width=0.7\columnwidth]{workpicture.png}
```

- Images should be in repository root
- Use PNG format for photos
- Specify width relative to columnwidth

### Two-Column Layouts

Use `minipage` environments for side-by-side content:
```latex
\begin{minipage}[t]{0.66\linewidth}
  % Main content
\end{minipage}\hfill
\begin{minipage}[t]{0.28\linewidth}
  % Sidebar content
\end{minipage}
```

## Naming Conventions

**Files:**
- Main CV: `CV.tex` → `CV.pdf`
- ATS version: `ATS_CV.tex` → `ATS_CV.pdf`
- Images: lowercase with underscores: `workpicture.png`

**Commands:**
- Use camelCase: `\textline`, `\skillbar`, `\accomplishment`
- Descriptive names: `\headline` not `\hl`

**Colors:**
- Lowercase with descriptors: `myblue`, `coralred`, `darkscarlet`

## Error Handling

**Common LaTeX Errors:**

1. **Undefined control sequence**: Check package loading order
2. **Missing $ inserted**: Math mode required, use `$...$`
3. **Dimension too large**: Check image sizes and scaling
4. **Package clash**: Review package load order, hyperref should be late

**Debugging approach:**
1. Compile with `-halt-on-error` to stop at first error
2. Check the `.log` file for detailed error messages
3. Comment out sections to isolate problematic code
4. Verify all `\begin{...}` have matching `\end{...}`

## Git Workflow

**Ignored files** (see `.gitignore`):
- `*.aux` - Auxiliary files
- `*.log` - Compilation logs  
- `*.out` - Hyperref output files

**What to commit:**
- `.tex` source files
- `.png` image assets
- Compiled `.pdf` files (for easy access)
- Configuration files

**What NOT to commit:**
- Temporary LaTeX build artifacts
- Editor-specific files
- OS-specific files

## Testing Changes

Before committing changes:

1. **Compile both CVs**: Ensure both CV.tex and ATS_CV.tex compile successfully
2. **Visual inspection**: Open PDFs and check formatting
3. **Check for overfull hboxes**: Review compilation warnings
4. **Validate links**: Ensure all URLs work correctly
5. **Spell check**: Review content for typos

## Common Tasks

**Adding a new job:**
```latex
\textline{Job Title}{Company Name}{Month Year - Month Year}\\
\footnotesize Job description and context\\
\accomplishment{Key achievement with metrics}\\
\accomplishment{Another important contribution}\\
```

**Adding a skill:**
```latex
NewSkill & \hspace{-10pt} \skillbar{4}{1}\\  % 4 filled, 1 empty = 80%
```

**Adding a certification:**
```latex
\textline{Certification Name}{Provider}{Month Year}\\
\footnotesize Brief description of what was learned\\
```

**Updating contact information:**
Edit the header section around line 165 (CV.tex) or 185 (ATS_CV.tex)

## Best Practices

1. **Consistency**: Match formatting style of existing entries
2. **Metrics**: Include quantifiable achievements when possible
3. **Conciseness**: Keep descriptions clear and brief
4. **Professional tone**: Maintain formal, professional language
5. **PDF Unicode**: Keep `\pdfgentounicode=1` for text extraction
6. **Color usage**: Use `myblue` for all accent colors consistently
7. **Whitespace**: Maintain consistent spacing between sections
8. **Compile frequently**: Build after each significant change

## Additional Notes

- This repository uses custom TikZ commands for skill visualization
- The `\makebullet` command uses ExplSyntax for list processing
- Both CVs share similar structure but different visual presentation
- ATS version prioritizes parsability over visual design
- Always test compilation before pushing changes
