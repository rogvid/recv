# Ticket 003: Create Common Helper Functions Module

**Status**: OPEN  
**Priority**: MEDIUM  
**Created**: 2026-01-08  
**Depends On**: 002  
**Blocks**: 004, 005  

## Objective

Create a reusable Typst module containing common helper functions, styles, and components that will be shared between CV.typ and ATS_CV.typ to ensure consistency and maintainability.

## Tasks

### 1. Create Module File

- [ ] Create `cv-common.typ` in repository root
- [ ] Set up module structure with clear sections
- [ ] Add header documentation

### 2. Color Definitions

- [ ] Define all color variables from design spec (Ticket 002)
- [ ] Create color utility functions if needed
- [ ] Export color variables

```typst
// Colors
#let primary-color = rgb("#1E3A8A")
#let accent-color = rgb("#3B82F6")
#let neutral-color = rgb("#64748B")
#let text-color = rgb("#1F2937")
#let light-gray = rgb("#F3F4F6")
```

### 3. Typography Functions

- [ ] Create text size constants
- [ ] Create heading style function
- [ ] Create body text style function
- [ ] Create small text style function

```typst
// Typography
#let sizes = (
  huge: 28pt,
  xlarge: 20pt,
  large: 16pt,
  normal: 11pt,
  small: 10pt,
  tiny: 9pt
)

#let heading-text(content, level: 1) = {
  // Implementation
}
```

### 4. Layout Functions

- [ ] Create section header function
- [ ] Create horizontal rule function
- [ ] Create spacing utilities
- [ ] Create two-column grid helper

```typst
// Layout
#let section-header(title) = {
  v(0.4cm)
  text(size: 16pt, fill: primary-color, weight: "bold")[#title]
  v(0.15cm)
  line(length: 100%, stroke: 0.3mm + primary-color)
  v(0.3cm)
}

#let spacer(size: "md") = {
  // Map size to spacing values
}
```

### 5. Content Components

- [ ] Create job entry function
- [ ] Create accomplishment bullet function
- [ ] Create skill bar visualization
- [ ] Create competency tag function
- [ ] Create text line function (position | company | date)

```typst
// Components
#let text-line(position, company, date) = {
  grid(
    columns: (1fr, auto),
    column-gutter: 1em,
    [*#position* | #company],
    align(right)[_#date_]
  )
}

#let accomplishment(content) = {
  block(
    inset: (left: 0em, top: 0.1cm),
    [
      #box(baseline: 20%, circle(radius: 2pt, fill: primary-color))
      #h(0.4em)
      #text(size: 10pt)[#content]
    ]
  )
}

#let skill-bar(filled, total: 5, color: primary-color) = {
  let empty = total - filled
  box[
    #for i in range(filled) {
      circle(radius: 2.5pt, fill: color)
      h(3pt)
    }
    #for i in range(empty) {
      circle(radius: 2.5pt, fill: rgb("#D1D5DB"))
      h(3pt)
    }
  ]
}

#let competency-tag(skill, highlighted: false) = {
  let bg = if highlighted { accent-color } else { light-gray }
  let fg = if highlighted { white } else { text-color }
  
  box(
    fill: bg,
    inset: (x: 8pt, y: 5pt),
    radius: 4pt,
    text(size: 10pt, fill: fg)[#skill]
  )
  h(5pt)
}

#let job-entry(position, company, date, description, accomplishments) = {
  text-line(position, company, date)
  v(0.1cm)
  text(size: 10pt)[#description]
  v(0.15cm)
  for item in accomplishments {
    accomplishment(item)
  }
  v(0.3cm)
}
```

### 6. Utility Functions

- [ ] Create icon/bullet generators
- [ ] Create conditional content helpers
- [ ] Create list formatting utilities

```typst
// Utilities
#let bullet-icon(color: primary-color) = {
  box(baseline: 20%, circle(radius: 2pt, fill: color))
}

#let make-link(url, display) = {
  link(url)[#text(fill: primary-color)[#display]]
}
```

### 7. Page Setup Functions

- [ ] Create standard page configuration
- [ ] Create ATS page configuration
- [ ] Create header/footer templates if needed

```typst
// Page Setup
#let setup-cv-page(ats-mode: false) = {
  set page(
    paper: "a4",
    margin: if ats-mode {
      (top: 2cm, bottom: 1.5cm, left: 1.5cm, right: 2cm)
    } else {
      (top: 1.5cm, bottom: 1.2cm, left: 2cm, right: 2cm)
    },
    numbering: none
  )
  
  set text(
    font: "Inter",
    size: 11pt,
    lang: "da"
  )
  
  set par(
    justify: false,
    leading: 0.65em
  )
}
```

### 8. Documentation

- [ ] Add inline documentation for all functions
- [ ] Create usage examples for each function
- [ ] Document function parameters and return values
- [ ] Add module overview at top of file

```typst
// cv-common.typ
// Shared components and utilities for CV generation
//
// Usage:
//   #import "cv-common.typ": *
//   #setup-cv-page()
//   #section-header("Experience")
//
// Functions:
//   - setup-cv-page(ats-mode: bool)
//   - section-header(title: str)
//   - text-line(position, company, date)
//   - accomplishment(content)
//   - skill-bar(filled, total, color)
//   - competency-tag(skill, highlighted)
//   - job-entry(position, company, date, description, accomplishments)
```

## Deliverables

- [ ] `cv-common.typ` - Complete module file
- [ ] `.ticket/003-api-docs.md` - API documentation for all functions
- [ ] Example usage file `cv-common-example.typ` (optional)

## Acceptance Criteria

- All common functions are implemented and working
- Functions are well-documented with parameter descriptions
- Code is clean and follows Typst best practices
- Functions are tested with sample data
- Module can be imported and used in both CV variants
- No hardcoded values (use parameters and constants)
- Color scheme is consistent throughout

## Code Quality Standards

- Use meaningful variable names
- Add comments for complex logic
- Keep functions focused (single responsibility)
- Use default parameters where appropriate
- Handle edge cases (empty lists, etc.)
- Consistent code formatting

## Testing Plan

Create a test file to verify all functions:

```typst
#import "cv-common.typ": *

#setup-cv-page()

// Test section header
#section-header("Test Section")

// Test text line
#text-line("Senior Developer", "Tech Company", "2020 - Present")

// Test accomplishments
#accomplishment("Increased performance by 50%")
#accomplishment("Led team of 5 developers")

// Test skill bars
Python #skill-bar(5, total: 5)
JavaScript #skill-bar(3, total: 5)

// Test competency tags
#competency-tag("Python", highlighted: true)
#competency-tag("Machine Learning")
#competency-tag("AWS")

// Test job entry
#job-entry(
  "Data Scientist",
  "ATP",
  "Feb. 2017 - Dec. 2018",
  "Matured fraud detection using data science",
  (
    "Reduced benefit fraud by 10M DKK",
    "Implemented ML expert system"
  )
)
```

## Notes

- Keep functions generic and reusable
- Avoid coupling to specific CV content
- Consider future extensibility
- Make it easy to customize colors/styles
- Balance flexibility with simplicity

## Related Files

- `CV.typ` (will import this module)
- `ATS_CV.typ` (will import this module)
- `.ticket/002-design-spec.md` (design reference)

## Estimated Time

1-2 hours

## Testing

- [ ] Import module in test file
- [ ] Test each function individually
- [ ] Verify visual output matches design spec
- [ ] Check for Typst compilation errors
- [ ] Test with various parameter combinations
