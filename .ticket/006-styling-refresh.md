# Ticket 006: Implement Modern Styling Refresh

**Status**: OPEN  
**Priority**: MEDIUM  
**Created**: 2026-01-08  
**Depends On**: 004, 005  
**Blocks**: 007  

## Objective

Apply modern design enhancements to the converted Typst CVs, refreshing the visual style while maintaining professionalism and ensuring both variants benefit from contemporary design trends.

## Tasks

### 1. Visual Hierarchy Enhancements

- [ ] Review current text size scale for optimal hierarchy
- [ ] Adjust line spacing for improved readability
- [ ] Fine-tune section spacing for visual flow
- [ ] Ensure proper contrast between heading levels
- [ ] Add breathing room around dense content

```typst
// Example adjustments
#let spacing = (
  section-before: 0.6cm,
  section-after: 0.3cm,
  subsection: 0.2cm,
  paragraph: 0.15cm,
  list-item: 0.1cm
)
```

### 2. Color Refinements

- [ ] Review color contrast for accessibility (WCAG AA minimum)
- [ ] Add subtle color accents to key elements
- [ ] Consider gradient or tone variations for depth
- [ ] Ensure colors print well in grayscale
- [ ] Test color combinations in different contexts

**Potential enhancements:**
```typst
// Subtle color variations
#let colors = (
  primary: rgb("#1E3A8A"),
  primary-light: rgb("#3B82F6"),
  primary-dark: rgb("#1E40AF"),
  accent: rgb("#0EA5E9"),
  text: rgb("#1F2937"),
  text-light: rgb("#6B7280"),
  background: rgb("#F9FAFB"),
  background-dark: rgb("#F3F4F6")
)
```

### 3. Section Header Design

- [ ] Enhance section headers with modern styling
- [ ] Consider adding subtle icons or shapes
- [ ] Add depth with background colors or borders
- [ ] Maintain consistency across all sections

**Options to explore:**
```typst
// Option 1: Side accent bar
#let section-header(title) = {
  v(0.5cm)
  block(
    width: 100%,
    inset: (left: 0.8em, top: 0.2em, bottom: 0.2em),
    stroke: (left: 3pt + primary-color),
    [#text(size: 16pt, fill: primary-color, weight: "bold")[#title]]
  )
  v(0.3cm)
}

// Option 2: Underline with gradient effect
#let section-header(title) = {
  v(0.5cm)
  text(size: 16pt, fill: primary-color, weight: "bold")[#title]
  v(0.1cm)
  line(length: 100%, stroke: (
    paint: gradient.linear(primary-color, primary-light),
    thickness: 2pt
  ))
  v(0.3cm)
}

// Option 3: Background highlight
#let section-header(title) = {
  v(0.5cm)
  block(
    width: 100%,
    fill: background-dark,
    inset: 0.4em,
    radius: 3pt,
    [#text(size: 16pt, fill: primary-color, weight: "bold")[#title]]
  )
  v(0.3cm)
}
```

### 4. Job Entry Enhancements

- [ ] Add subtle visual separation between jobs
- [ ] Enhance date badges or styling
- [ ] Consider light background for alternating entries
- [ ] Improve accomplishment bullet styling
- [ ] Add subtle hover-like effects (visual weight)

```typst
#let job-entry(position, company, date, description, accomplishments) = {
  block(
    width: 100%,
    inset: (x: 0.5em, y: 0.4em),
    radius: 4pt,
    fill: rgb("#FAFBFC"),  // Optional subtle background
    [
      #grid(
        columns: (1fr, auto),
        [
          #text(weight: "bold", fill: primary-color)[#position]
          #text(fill: text-light)[ | #company]
        ],
        align(right)[
          #box(
            fill: primary-light.lighten(80%),
            inset: (x: 0.5em, y: 0.2em),
            radius: 3pt,
            text(size: 9pt, fill: primary-color, weight: "medium")[#date]
          )
        ]
      )
      #v(0.15cm)
      #text(size: 10pt)[#description]
      #v(0.2cm)
      #for item in accomplishments {
        accomplishment(item)
      }
    ]
  )
  #v(0.3cm)
}
```

### 5. Skill Bar Modernization

- [ ] Update skill bar design for modern look
- [ ] Consider pill shapes instead of circles
- [ ] Add subtle shadows or gradients
- [ ] Ensure bars are visually balanced
- [ ] Test with different proficiency levels

```typst
// Modern pill-style skill bar
#let skill-bar(filled, total: 5, color: primary-color) = {
  let empty = total - filled
  let pill-width = 1.2cm
  let pill-height = 6pt
  
  box[
    #for i in range(total) {
      box(
        width: pill-width,
        height: pill-height,
        radius: pill-height / 2,
        fill: if i < filled { color } else { rgb("#E5E7EB") },
        inset: 0pt
      )[]
      if i < total - 1 { h(3pt) }
    }
  ]
}

// Alternative: Linear progress bar
#let skill-bar-linear(filled, total: 5, color: primary-color) = {
  let percentage = filled / total * 100
  box(
    width: 100%,
    height: 6pt,
    radius: 3pt,
    fill: rgb("#E5E7EB"),
    [
      #place(
        box(
          width: percentage * 1%,
          height: 6pt,
          radius: 3pt,
          fill: color
        )
      )
    ]
  )
}
```

### 6. Competency Tag Refinements

- [ ] Update tag design for modern appearance
- [ ] Add subtle shadows or borders
- [ ] Improve spacing and padding
- [ ] Consider hover-like states (darker variants)
- [ ] Ensure tags flow naturally

```typst
#let competency-tag(skill, highlighted: false) = {
  let bg = if highlighted {
    gradient.linear(accent-color, primary-light)
  } else {
    rgb("#F3F4F6")
  }
  let fg = if highlighted { white } else { text-color }
  
  box(
    fill: bg,
    inset: (x: 10pt, y: 6pt),
    radius: 6pt,
    stroke: if highlighted { none } else { 0.5pt + rgb("#D1D5DB") },
    [#text(size: 10pt, fill: fg, weight: if highlighted { "medium" } else { "regular" })[#skill]]
  )
  h(6pt)
}
```

### 7. Typography Refinements

- [ ] Fine-tune font sizes for balance
- [ ] Adjust letter spacing for readability
- [ ] Review line heights for optimal reading
- [ ] Ensure consistent font weights
- [ ] Add subtle typographic details

```typst
#set text(
  font: "Inter",
  size: 11pt,
  lang: "da",
  hyphenate: true,
  ligatures: true,
  number-type: "lining"
)

#set par(
  justify: false,
  leading: 0.7em,
  spacing: 0.65em
)

// Heading styles
#show heading.where(level: 1): it => {
  text(
    size: 16pt,
    fill: primary-color,
    weight: "bold",
    tracking: -0.02em  // Tighter tracking for headings
  )[#it.body]
}
```

### 8. Sidebar Enhancements (CV.typ only)

- [ ] Add subtle background color to sidebar
- [ ] Improve section separation
- [ ] Enhance skill visualization
- [ ] Add visual interest without clutter
- [ ] Ensure sidebar remains scannable

```typst
// Enhanced sidebar with background
#grid(
  columns: (2fr, 1fr),
  column-gutter: 1.5em,
  [
    // Main content
  ],
  block(
    width: 100%,
    fill: rgb("#F9FAFB"),
    inset: 1em,
    radius: 6pt,
    [
      // Sidebar content
    ]
  )
)
```

### 9. Contact Information Styling

- [ ] Modernize contact info layout
- [ ] Add subtle separators or icons
- [ ] Improve link styling
- [ ] Make contact info more prominent
- [ ] Consider adding social media icons (optional)

```typst
#let contact-item(icon: none, content) = {
  box[
    #if icon != none [
      #text(fill: primary-color)[#icon]
      #h(0.3em)
    ]
    #content
  ]
}

#align(center)[
  #text(size: 10pt)[
    #contact-item(icon: "📞")[+45 5042 5002]
    #h(0.5cm)
    #contact-item(icon: "✉")[argeinnovations\@gmail.com]
    #h(0.5cm)
    #contact-item[#make-link("https://linkedin.com/in/rogvidarge/en")[LinkedIn]]
    #h(0.5cm)
    #contact-item[#make-link("https://github.com/rogvid")[GitHub]]
  ]
]
```

### 10. White Space Optimization

- [ ] Review and optimize spacing throughout
- [ ] Ensure proper breathing room
- [ ] Balance density with readability
- [ ] Create clear visual groupings
- [ ] Improve scanability

### 11. Accessibility Improvements

- [ ] Verify color contrast ratios (WCAG AA: 4.5:1 for text)
- [ ] Ensure sufficient font sizes (minimum 10pt)
- [ ] Test with screen readers (PDF structure)
- [ ] Improve heading hierarchy
- [ ] Add proper PDF metadata

```typst
#set document(
  title: "CV - Rogvi David Arge",
  author: "Rogvi David Arge",
  keywords: ("Data Science", "Machine Learning", "CV"),
  date: datetime.today()
)
```

### 12. Print Optimization

- [ ] Test grayscale printing
- [ ] Ensure sufficient contrast in B&W
- [ ] Verify page breaks are appropriate
- [ ] Check margins are print-friendly
- [ ] Test on different paper sizes (A4 primary)

## Deliverables

- [ ] Updated `cv-common.typ` with enhanced functions
- [ ] Updated `CV.typ` with modern styling
- [ ] Updated `ATS_CV.typ` with appropriate enhancements
- [ ] `.ticket/006-design-decisions.md` - Document all styling choices
- [ ] `.ticket/006-before-after-comparison.md` - Visual comparison notes

## Acceptance Criteria

- Visual design is modern and professional
- Colors meet accessibility standards (WCAG AA minimum)
- Typography is crisp and readable
- Spacing is balanced and consistent
- Design enhances rather than distracts
- Print output looks good in color and B&W
- ATS version remains parsable despite enhancements
- All enhancements are documented

## Design Principles to Follow

1. **Less is more**: Subtle enhancements over dramatic changes
2. **Consistency**: Maintain patterns throughout
3. **Hierarchy**: Clear visual hierarchy guides the eye
4. **Balance**: Equal visual weight across sections
5. **Professionalism**: Modern but not trendy or gimmicky
6. **Accessibility**: Design for everyone
7. **Printability**: Works in all output formats

## Testing Checklist

- [ ] Visual review in PDF reader
- [ ] Print preview (color and B&W)
- [ ] Test on multiple screens
- [ ] Check color contrast with tools
- [ ] Verify text is still extractable
- [ ] Compare with original LaTeX version
- [ ] Get feedback if possible

## Modern Design Trends to Consider

- **2024-2026 Trends:**
  - Generous white space
  - Subtle shadows and depth
  - Rounded corners (but subtle)
  - Linear gradients (used sparingly)
  - Sans-serif typography
  - High contrast for key elements
  - Asymmetric layouts (carefully)
  - Data visualization for skills
  - Minimal color palettes (2-3 colors)
  - Clean, geometric shapes

## Notes

- Don't over-design; keep it professional
- Test all changes before committing
- Document rationale for design decisions
- Consider personal branding vs. universal appeal
- Balance creativity with conservatism
- Keep ATS version simpler than standard CV

## Related Files

- `cv-common.typ` (will be updated)
- `CV.typ` (will be enhanced)
- `ATS_CV.typ` (subtle enhancements only)
- `.ticket/002-design-spec.md` (reference)

## Estimated Time

2-3 hours

## Optional Advanced Enhancements

- [ ] Add subtle page border or frame
- [ ] Create custom bullet shapes
- [ ] Add timeline visualization for experience
- [ ] Design custom link styling
- [ ] Add QR code for digital version
- [ ] Create dark mode variant (experimental)
- [ ] Add interactive elements (PDF forms)
