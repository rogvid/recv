# Ticket 002: Design Typst Template and Styling System

**Status**: OPEN  
**Priority**: HIGH  
**Created**: 2026-01-08  
**Depends On**: 001  
**Blocks**: 003, 004, 005, 006  

## Objective

Design a modern, refreshed visual style for the CV using Typst, creating reusable design patterns and a cohesive styling system that improves upon the LaTeX version.

## Tasks

### 1. Color Scheme Refresh

- [ ] Review current color scheme (myblue #006C96)
- [ ] Research modern professional color palettes (2024-2026 trends)
- [ ] Propose 2-3 alternative color schemes
- [ ] Document color accessibility (WCAG contrast ratios)
- [ ] Define primary, secondary, and accent colors
- [ ] Create color variable definitions for Typst

**Suggested Modern Palettes:**
```typst
// Option 1: Deep Blue Professional
#let primary = rgb("#1E3A8A")      // Deep blue
#let accent = rgb("#3B82F6")       // Bright blue
#let neutral = rgb("#64748B")      // Slate gray

// Option 2: Teal Modern
#let primary = rgb("#0F766E")      // Teal
#let accent = rgb("#14B8A6")       // Light teal
#let neutral = rgb("#475569")      // Dark gray

// Option 3: Indigo Professional
#let primary = rgb("#4F46E5")      // Indigo
#let accent = rgb("#818CF8")       // Light indigo
#let neutral = rgb("#6B7280")      // Medium gray
```

### 2. Typography System

- [ ] Select primary font family (consider Inter, Roboto, Source Sans Pro)
- [ ] Define font scale (heading sizes, body, small)
- [ ] Set line heights and letter spacing
- [ ] Define font weights to use (regular, medium, bold)
- [ ] Create text style presets

```typst
#let font-sizes = (
  huge: 28pt,      // Name
  xlarge: 20pt,    // Job title
  large: 16pt,     // Section headings
  normal: 11pt,    // Body text
  small: 10pt,     // Details
  tiny: 9pt        // Fine print
)

#let fonts = (
  main: "Inter",
  mono: "JetBrains Mono",
  serif: "Merriweather"  // Optional for name
)
```

### 3. Layout Grid System

- [ ] Design responsive grid system
- [ ] Define standard spacing units (0.25cm, 0.5cm, 1cm, etc.)
- [ ] Create layout templates for:
  - Two-column (main content + sidebar)
  - Single column (for ATS version)
  - Header section
  - Footer (if needed)
- [ ] Define breakpoints and column widths

```typst
#let spacing = (
  xs: 0.2cm,
  sm: 0.4cm,
  md: 0.6cm,
  lg: 1cm,
  xl: 1.5cm
)

#let columns = (
  main: 65%,
  sidebar: 30%,
  gutter: 5%
)
```

### 4. Component Design

Design modern versions of:

- [ ] **Section headers** - Bold, with subtle underline or side accent
- [ ] **Job entry cards** - Clean separation, maybe light background
- [ ] **Skill bars** - Modern pill/dot style or linear bars
- [ ] **Accomplishment bullets** - Styled bullets with proper indentation
- [ ] **Competency tags** - Rounded pills for ATS version
- [ ] **Contact info row** - Icon-friendly layout (or icon placeholders)
- [ ] **Date badges** - Subtle styling for date ranges

### 5. Visual Enhancements

- [ ] Add subtle visual hierarchy (weights, sizes, spacing)
- [ ] Design section dividers (lines, shapes, or spacing)
- [ ] Create consistent icon/bullet style
- [ ] Add subtle background textures or accents (optional)
- [ ] Design header with name and title
- [ ] Consider adding a subtle sidebar background color

### 6. Accessibility and ATS Considerations

- [ ] Ensure sufficient color contrast (4.5:1 minimum)
- [ ] Design ATS-friendly variant without complex layouts
- [ ] Verify text remains selectable and readable
- [ ] Test PDF text extraction order
- [ ] Avoid complex overlapping elements

### 7. Create Design Specification

Create `.ticket/002-design-spec.md` with:

```markdown
## Color System
- Primary: [color] - [usage]
- Accent: [color] - [usage]
- Neutral: [color] - [usage]
- Background: [color]
- Text: [color]

## Typography
- Primary font: [name]
- Heading scales: [sizes]
- Body text: [size]
- Line height: [value]

## Spacing Scale
- xs, sm, md, lg, xl values

## Components
### Section Header
[description, measurements, mockup]

### Job Entry
[description, measurements, mockup]

[... for each component]

## Layout Templates
### Two-Column Layout
- Proportions: [values]
- Gutter: [value]

### Single Column (ATS)
- Max width: [value]
- Margins: [values]
```

## Deliverables

- [ ] `.ticket/002-design-spec.md` - Complete design specification
- [ ] `.ticket/002-color-options.md` - Color palette options with rationale
- [ ] `.ticket/002-mockup.typ` - Visual mockup of key components (optional)
- [ ] Design decision documentation

## Acceptance Criteria

- Color scheme is modern and professional
- Typography system is clear and scalable
- Component designs are well-documented
- Layout system accommodates both CV variants
- Design maintains readability and professionalism
- ATS compatibility is considered
- All measurements and values are specified

## Inspiration Sources

- Modern resume trends 2024-2026
- Typst community templates
- Dribbble/Behance professional CV designs
- Corporate design systems (Google, Stripe, Atlassian)

## Notes

- Balance modern aesthetics with professional conservatism
- Ensure design works across different PDF readers
- Keep print-friendliness in mind (black & white, color)
- Consider personal brand colors vs. universal professionalism
- Document rationale for major design decisions

## Related Files

- `CV.tex` (current design reference)
- `ATS_CV.tex` (current ATS design)
- `AGENTS.md` (style guidelines)

## Estimated Time

2-3 hours

## Testing

- [ ] Review with multiple PDF readers
- [ ] Check print preview
- [ ] Verify color contrast ratios
- [ ] Test text extraction from PDF
- [ ] Get design feedback (if possible)
