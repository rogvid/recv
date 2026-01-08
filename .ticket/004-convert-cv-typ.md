# Ticket 004: Convert CV.tex to CV.typ

**Status**: OPEN  
**Priority**: HIGH  
**Created**: 2026-01-08  
**Depends On**: 001, 002, 003  
**Blocks**: 007  

## Objective

Convert the standard LaTeX CV (CV.tex) to Typst (CV.typ) using the extracted content, design system, and common helper functions while maintaining the two-column layout and visual richness.

## Tasks

### 1. File Setup

- [ ] Create `CV.typ` file
- [ ] Import `cv-common.typ` module
- [ ] Set up document metadata
- [ ] Apply page configuration

```typst
#import "cv-common.typ": *

#set document(
  title: "CV - Rogvi David Arge",
  author: "Rogvi David Arge",
  keywords: ("CV", "Data Science", "Machine Learning")
)

#setup-cv-page(ats-mode: false)
```

### 2. Header Section

- [ ] Create centered name with large text
- [ ] Add professional title/tagline
- [ ] Add contact information row
- [ ] Format links (LinkedIn, GitHub, email, phone)
- [ ] Optionally position work photo

```typst
#align(center)[
  #text(size: 28pt, fill: primary-color, weight: "bold")[
    Rogvi David Arge
  ]
  #v(0.2cm)
  #text(size: 18pt)[
    Data Science & Optimization Consultant
  ]
  #v(0.3cm)
  #text(size: 10pt)[
    +45 5042 5002
    #h(0.5cm)
    argeinnovations\@gmail.com
    #h(0.5cm)
    #make-link("https://linkedin.com/in/rogvidarge/en")[LinkedIn]
    #h(0.5cm)
    #make-link("https://github.com/rogvid")[GitHub]
  ]
]
```

### 3. Summary Section

- [ ] Add "Summary" section header
- [ ] Format summary paragraph
- [ ] Ensure proper spacing

```typst
#section-header("Summary")

Data Scientist with more than 4 years of experience in agile project development...

#v(0.4cm)
```

### 4. Two-Column Layout Setup

- [ ] Create main grid with 66/28 proportions
- [ ] Set up left column (main content)
- [ ] Set up right column (sidebar)

```typst
#grid(
  columns: (2fr, 1fr),
  column-gutter: 1.5em,
  [
    // LEFT COLUMN - Main Content
  ],
  [
    // RIGHT COLUMN - Sidebar
  ]
)
```

### 5. Left Column - Experience Section

- [ ] Add "Experience" section header
- [ ] Convert each job entry using `job-entry()` function
- [ ] Include company, position, dates
- [ ] Add job descriptions
- [ ] Add accomplishment bullets

Use content from Ticket 001 inventory:
```typst
#section-header("Experience")

#job-entry(
  "Owner",
  "Arge Innovations",
  "Dec. 2018 - Present",
  "Agile development and deployment of data science, machine learning, and optimization products.",
  (
    "Spearheaded paradigm shift in transportation & logistics industry",
  )
)

#job-entry(
  "Data Science Consultant",
  "DFDS A/S",
  "Dec. 2018 - May 2019",
  "Spearheaded paradigm shift of transportation & logistics industry",
  (
    "Reduced RMSE of prediction algorithm by 20%",
    "Enabled new transportation planning paradigm with optimization tools",
  )
)

// ... continue for all positions
```

### 6. Left Column - Education Section

- [ ] Add "Education" section header
- [ ] Format M.Sc. entry with university and dates
- [ ] Format B.Sc. entry with university and dates
- [ ] Add focus areas/descriptions

```typst
#section-header("Education")

#text-line("M.Sc. in Physics", "University of Copenhagen", "2012 - 2015")
#v(0.1cm)
#text(size: 10pt)[
  Focus on computational physics, machine learning and mathematical modeling.
]
#v(0.3cm)

#text-line("B.Sc. in Physics", "University of Copenhagen", "2009 - 2012")
#v(0.1cm)
#text(size: 10pt)[
  Focus on laser physics, optics, and quantum mechanics.
]
#v(0.3cm)
```

### 7. Left Column - Certifications Section

- [ ] Add "Certifications" section header
- [ ] Format Deep Learning Specialization entry
- [ ] Format Data Analyst Nanodegree entry
- [ ] Include dates and descriptions

```typst
#section-header("Certifications")

#text-line("Deep Learning Specialization", "Coursera", "2017 - 2018")
#v(0.1cm)
#text(size: 10pt)[
  Development of deep learning models in Tensorflow & Keras...
]
#v(0.3cm)

// ... continue for all certifications
```

### 8. Right Column - Technical Skills Section

- [ ] Add "Technical Skills" section header
- [ ] Create skill list with proficiency bars
- [ ] Use `skill-bar()` function for each skill
- [ ] Format in table/grid layout

```typst
#section-header("Technical Skills")

#let skill-row(name, level) = [
  #grid(
    columns: (auto, 1fr),
    column-gutter: 0.5em,
    align(left)[#text(size: 10pt)[#name]],
    align(left)[#skill-bar(level, total: 5)]
  )
  #v(0.15cm)
]

#skill-row("Python", 5)
#skill-row("Machine Learning", 5)
#skill-row("Optimization", 5)
#skill-row("OR", 5)
#skill-row("Data Visualization", 5)
// ... continue for all skills
```

### 9. Right Column - Soft Skills Section

- [ ] Add "Soft Skills" section header
- [ ] Format soft skills with proficiency bars
- [ ] Match styling of technical skills

```typst
#section-header("Soft Skills")

#skill-row("Problem Solving", 5)
#skill-row("Critical Thinking", 5)
#skill-row("Communication", 5)
// ... continue
```

### 10. Right Column - Languages Section

- [ ] Add "Languages" section header
- [ ] Format languages with proficiency bars
- [ ] Include all languages from inventory

```typst
#section-header("Languages")

#skill-row("Faroese", 5)
#skill-row("Danish", 5)
#skill-row("English", 5)
#skill-row("Norwegian", 3)
#skill-row("Swedish", 3)
#skill-row("French", 2)
```

### 11. Final Touches

- [ ] Review overall spacing and alignment
- [ ] Ensure consistent styling throughout
- [ ] Check for widows/orphans
- [ ] Verify all content is included
- [ ] Apply any modern design enhancements from Ticket 002

### 12. Compilation and Testing

- [ ] Compile with `typst compile CV.typ`
- [ ] Review PDF output
- [ ] Check text extraction works properly
- [ ] Verify links are clickable
- [ ] Test printing in black & white
- [ ] Compare with original CV.tex output

## Deliverables

- [ ] `CV.typ` - Complete Typst CV file
- [ ] `CV.pdf` - Compiled output
- [ ] `.ticket/004-conversion-notes.md` - Document any issues or decisions

## Acceptance Criteria

- File compiles without errors
- All content from CV.tex is present
- Visual layout matches or improves upon original
- Two-column layout works correctly
- All links are functional
- Text is extractable and in correct order
- PDF matches professional quality standards
- File size is reasonable (< 1MB)

## Special Considerations

- [ ] Handle Danish characters (ø, æ, å) correctly
- [ ] Ensure skill bars align properly
- [ ] Maintain visual hierarchy (headings, body, details)
- [ ] Keep grid columns balanced (no overflow)
- [ ] Verify spacing is consistent with design spec

## Common Issues to Watch For

- Grid column overflow (sidebar too narrow)
- Incorrect text extraction order in PDF
- Link formatting inconsistencies
- Spacing irregularities
- Font fallback issues
- Color rendering differences

## Testing Checklist

- [ ] Compile succeeds with no errors
- [ ] PDF opens in multiple readers (Adobe, Preview, Chrome)
- [ ] All sections are present and complete
- [ ] Two-column layout is balanced
- [ ] Skills bars render correctly
- [ ] Links work when clicked
- [ ] Text can be selected and copied
- [ ] Print preview looks good
- [ ] Matches design specification
- [ ] No LaTeX artifacts or syntax errors

## Notes

- Reference Ticket 001 for exact content
- Reference Ticket 002 for styling decisions
- Use functions from cv-common.typ consistently
- Document any deviations from LaTeX version
- Keep code readable with comments

## Related Files

- `CV.tex` (source reference)
- `cv-common.typ` (helper functions)
- `.ticket/001-content-inventory.md`
- `.ticket/002-design-spec.md`

## Estimated Time

2-3 hours

## Optional Enhancements

- [ ] Add subtle background color to sidebar
- [ ] Enhance section headers with icons or shapes
- [ ] Add subtle shadow or border to main content area
- [ ] Implement responsive layout (if relevant)
- [ ] Add color accents to job titles or company names
