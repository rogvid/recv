# Ticket 005: Convert ATS_CV.tex to ATS_CV.typ

**Status**: OPEN  
**Priority**: HIGH  
**Created**: 2026-01-08  
**Depends On**: 001, 002, 003, 004  
**Blocks**: 007  

## Objective

Convert the ATS-optimized LaTeX CV (ATS_CV.tex) to Typst (ATS_CV.typ) using the extracted content and common helper functions while prioritizing ATS parsability and simple single-column layout.

## Tasks

### 1. File Setup

- [ ] Create `ATS_CV.typ` file
- [ ] Import `cv-common.typ` module
- [ ] Set up document metadata
- [ ] Apply ATS-friendly page configuration

```typst
#import "cv-common.typ": *

#set document(
  title: "CV - Rogvi David Arge - ATS Optimized",
  author: "Rogvi David Arge",
  keywords: ("CV", "Data Science", "Machine Learning", "Python", "Optimization")
)

#setup-cv-page(ats-mode: true)
```

### 2. Header Section

- [ ] Create centered name with large text (simpler than CV.typ)
- [ ] Add professional title/tagline
- [ ] Add contact information (plain text, no complex formatting)
- [ ] Format links simply

```typst
#align(center)[
  #text(size: 24pt, weight: "bold")[
    Rogvi David Arge
  ]
  #v(0.2cm)
  #text(size: 16pt)[
    Data Science & Optimization Consultant
  ]
]

#v(0.3cm)

#align(center)[
  #text(size: 10pt)[
    +45 5042 5002
    #h(0.5cm)
    argeinnovations\@gmail.com
    #h(0.5cm)
    linkedin.com/in/rogvidarge/en
    #h(0.5cm)
    github.com/rogvid
  ]
]

#v(0.4cm)
```

### 3. Summary Section

- [ ] Add "Summary" section header
- [ ] Format summary paragraph (simple, no fancy styling)
- [ ] Use standard spacing

```typst
#section-header("Summary")

Data Scientist with more than 4 years of experience in agile project development and a passion for deep learning, predictive analytics and optimization. Vast experience in data wrangling, exploratory data analysis, machine learning and data visualization and applying these skills to generate corporate wide improvements.

#v(0.4cm)
```

### 4. Key Competencies Section

- [ ] Add "Key Competencies" section header
- [ ] Create competency tags using `competency-tag()` function
- [ ] Include all relevant keywords for ATS parsing
- [ ] Format in flowing layout (not grid)

```typst
#section-header("Key Competencies")

#competency-tag("Python")
#competency-tag("Machine Learning")
#competency-tag("Data Science")
#competency-tag("Deep Learning")
#competency-tag("Data Visualization")
#competency-tag("AWS")
#competency-tag("Problem Solving")
#competency-tag("Critical Thinking")
#competency-tag("Communication")
#competency-tag("Data Analysis")
#competency-tag("SQL")
#competency-tag("TensorFlow")
#competency-tag("Keras")
#competency-tag("NoSQL")
#competency-tag("NLP")
#competency-tag("Optimization")
#competency-tag("API")
#competency-tag("Flask")
#competency-tag("CI")
#competency-tag("CD")
#competency-tag("Statistical Modeling")
#competency-tag("Analytics")
#competency-tag("Git")
#competency-tag("Docker")
#competency-tag("Operations Research")
#competency-tag("D3")
#competency-tag("JavaScript")
#competency-tag("HTML")
#competency-tag("CSS")
#competency-tag("C\#")
#competency-tag("Azure")
#competency-tag("SCRUM")

#v(0.4cm)
```

### 5. Employment History Section

- [ ] Add "Employment History" section header
- [ ] Format each job entry with clear structure
- [ ] Use bullet lists for accomplishments (standard bullets)
- [ ] Include company, position, dates
- [ ] Add job descriptions and achievements

```typst
#section-header("Employment History")

#text-line("Owner & Data Science Consultant", "Arge Innovations", "Dec. 2018 - Present")
#v(0.1cm)

Development of data science, machine learning, deep learning, optimization, and analytics solutions for businesses

#v(0.15cm)

#list(
  marker: text(fill: primary-color)[•],
  indent: 1em,
  [Spearheaded a paradigm shift of the transportation & logistics industry in two successful data science projects over a period of 5 months]
)

#v(0.3cm)

#text-line("Freelance Data Science Consultant", "DFDS A/S", "Dec. 2018 - May 2019")
#v(0.1cm)

Spearheaded a paradigm shift of the transportation & logistics industry

#v(0.15cm)

#list(
  marker: text(fill: primary-color)[•],
  indent: 1em,
  [Reduced RMSE of prediction algorithm by 20\% by helping to implement a number of scalable machine learning models],
  [Enabled a completely new transportation planning methodology by implementing dynamic optimization tool that visualized optimal plan in real time]
)

#v(0.3cm)

// Continue for all positions...
```

### 6. Education History Section

- [ ] Add "Education History" section header
- [ ] Format M.Sc. entry with full details
- [ ] Format B.Sc. entry with full details
- [ ] Include focus areas and thesis information

```typst
#section-header("Education History")

#text-line("M.Sc. in Physics", "University of Copenhagen", "Aug. 2012 - May 2015")
#v(0.1cm)

Focused my studies on applied mathematics, computational physics, machine learning, statistics and mathematical modeling. Wrote my thesis _"Inflammation of the Central Nervous System - Modeling Multiple Sclerosis as a Motile Excitable Medium"_ under Professor Mogens Høgh Jensen

#v(0.3cm)

#text-line("B.Sc. in Physics", "University of Copenhagen", "Aug. 2009 - Jun. 2012")
#v(0.1cm)

Focused my studies on quantum optics, solid state physics, laser physics, optics, and experimental physics

#v(0.4cm)
```

### 7. Certificates Section

- [ ] Add "Certificates" section header
- [ ] Format each certification with provider and date
- [ ] Include descriptions and notable projects
- [ ] Use bullet lists where appropriate

```typst
#section-header("Certificates")

#text-line("Applied Social Network Analysis", "Coursera", "Feb. 2018")
#v(0.1cm)

Python based course on Social Network Analysis, developing essential knowledge in the field of SNA.

#v(0.3cm)

#text-line("Deep Learning Specialization", "Coursera", "Sep. 2017 - Feb. 2018")
#v(0.1cm)

Development of deep learning models in Tensorflow & Keras. Specialization taught by Andrew Ng on Coursera. Notable projects in Image Recognition, Deep Learning, Transfer Learning, Convolutional Neural Networks, Recurrent Neural Networks, Speech Detection, Speech Recognition, Generative Adversarial Networks, and Trigger Word Detection

#v(0.3cm)

#text-line("Data Analyst Nanodegree", "Udacity", "Jul. 2015 - May 2017")
#v(0.1cm)

Project based courses teaching essential knowledge and skills for data scientists. Notable projects:

#v(0.15cm)

#list(
  marker: text(fill: primary-color)[•],
  indent: 1em,
  [Copenhagen apartment price evolution. Map visualizing the evolution of apartment prices in greater Copenhagen],
  [Investigating fraud in Enron financial data and email corpus]
)

#v(0.4cm)
```

### 8. Languages Section

- [ ] Add "Languages" section header
- [ ] Format languages with proficiency descriptions (text-based, not bars)
- [ ] Use standard proficiency terminology

```typst
#section-header("Languages")

*Faroese, Danish* #h(1em) Native Language

*English* #h(1em) Professional Proficiency

*Swedish, Norwegian, French, German* #h(1em) Elementary Proficiency

#v(0.4cm)
```

### 9. ATS Optimization

- [ ] Ensure simple, linear document flow
- [ ] Use standard section names (Employment, Education, etc.)
- [ ] Include keywords naturally in text
- [ ] Avoid tables, complex grids, or multi-column layouts
- [ ] Use standard bullet points
- [ ] Ensure proper heading hierarchy
- [ ] Keep formatting simple (bold, italic only)

### 10. Final Touches

- [ ] Review overall spacing and alignment
- [ ] Ensure consistent styling throughout
- [ ] Verify all content is included
- [ ] Check that document flows in logical order
- [ ] Remove any overly decorative elements

### 11. Compilation and Testing

- [ ] Compile with `typst compile ATS_CV.typ`
- [ ] Review PDF output
- [ ] Test text extraction order (should be top-to-bottom)
- [ ] Verify all keywords are extractable
- [ ] Test with ATS parser (if available)
- [ ] Compare with original ATS_CV.tex output

## Deliverables

- [ ] `ATS_CV.typ` - Complete ATS-optimized Typst CV file
- [ ] `ATS_CV.pdf` - Compiled output
- [ ] `.ticket/005-ats-testing-notes.md` - ATS compatibility testing results

## Acceptance Criteria

- File compiles without errors
- All content from ATS_CV.tex is present
- Single-column layout works correctly
- Text extraction order is correct (top-to-bottom, left-to-right)
- All keywords are present and extractable
- No complex formatting that could confuse ATS
- PDF is ATS-friendly and parsable
- Competency tags are visible and extractable
- File size is reasonable

## ATS-Specific Requirements

- [ ] Simple, linear document structure
- [ ] Standard section headings
- [ ] No images or graphics (except optional subtle elements)
- [ ] No headers/footers that could confuse parsing
- [ ] Standard fonts (no decorative fonts)
- [ ] Clear hierarchy with proper heading levels
- [ ] Keywords repeated in context (not just listed)
- [ ] Standard date formats
- [ ] No text in graphics or shapes
- [ ] Proper text encoding (UTF-8)

## Testing Checklist

- [ ] Compile succeeds with no errors
- [ ] PDF opens in multiple readers
- [ ] All sections are present and complete
- [ ] Single-column layout is clean
- [ ] Competency tags render correctly
- [ ] Text extraction is in correct order
- [ ] All keywords are extractable
- [ ] No visual artifacts or rendering issues
- [ ] Print preview looks good
- [ ] Copy-paste text maintains structure

## ATS Testing (if tools available)

- [ ] Test with Jobscan or similar ATS simulator
- [ ] Verify keyword matching works
- [ ] Check contact information is parsed correctly
- [ ] Verify work history dates are recognized
- [ ] Confirm education is parsed properly
- [ ] Test with different ATS systems if possible

## Notes

- Prioritize parsability over visual design
- Keep formatting simple and standard
- Use competency tags to highlight keywords
- Reference Ticket 001 for exact content
- Reference Ticket 002 for ATS-specific styling
- Document any ATS compatibility decisions

## Related Files

- `ATS_CV.tex` (source reference)
- `cv-common.typ` (helper functions)
- `CV.typ` (reference for common elements)
- `.ticket/001-content-inventory.md`
- `.ticket/002-design-spec.md`

## Estimated Time

2 hours

## Common ATS Pitfalls to Avoid

- Complex tables or grids
- Text in headers/footers
- Graphics with embedded text
- Unusual fonts or characters
- Multi-column layouts
- Text boxes or shapes with content
- Merged cells or complex formatting
- Non-standard section names
- Dates in unusual formats

## Optional Enhancements

- [ ] Add more keywords naturally in descriptions
- [ ] Include industry-specific terminology
- [ ] Optimize for specific job descriptions
- [ ] Add relevant certifications or training
- [ ] Expand technical skills list
