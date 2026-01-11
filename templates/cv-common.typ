// templates/cv-common.typ
// Shared components and utilities for CV generation
//
// This module provides common functions, styles, and components
// used by both CV.typ and ATS_CV.typ templates.
//
// Usage:
//   #import "cv-common.typ": *
//   #setup-cv-page()
//   #section-header("Experience")
//
// Functions:
//   - setup-cv-page(ats-mode: bool) - Configure page layout and typography
//   - cv-header(personal) - Render CV header with contact info
//   - section-header(title: str) - Render section header with underline
//   - text-line(position, company, date) - Render job title line
//   - accomplishment(content) - Render accomplishment with bullet
//   - skill-bar(filled, total, color) - Render skill proficiency bar
//   - competency-tag(skill, highlighted) - Render skill tag/badge
//   - job-entry(position, company, date, description, accomplishments) - Render complete job entry
//   - render-job(job, config) - Render job from resource dictionary
//   - render-education(edu, config) - Render education from resource dictionary
//   - render-certificate(cert, config) - Render certificate from resource dictionary
//   - render-skills-section(skills) - Render skills with bars
//   - render-languages-section(languages) - Render languages section

// ============================================================================
// COLOR DEFINITIONS
// ============================================================================

#let primary-color = rgb("#1E3A8A")      // Dark blue for headers
#let accent-color = rgb("#3B82F6")       // Bright blue for highlights
#let neutral-color = rgb("#64748B")      // Gray for secondary text
#let text-color = rgb("#1F2937")         // Dark gray for body text
#let light-gray = rgb("#F3F4F6")         // Light gray for backgrounds
#let border-color = rgb("#E5E7EB")       // Border color
#let white = rgb("#FFFFFF")              // White

// Color scheme variants
#let color-schemes = (
  blue: (
    primary: rgb("#1E3A8A"),
    accent: rgb("#3B82F6"),
  ),
  red: (
    primary: rgb("#7F1D1D"),
    accent: rgb("#DC2626"),
  ),
  gray: (
    primary: rgb("#374151"),
    accent: rgb("#6B7280"),
  ),
  minimal: (
    primary: rgb("#000000"),
    accent: rgb("#000000"),
  ),
)

// ============================================================================
// TYPOGRAPHY
// ============================================================================

#let sizes = (
  huge: 28pt,
  xlarge: 20pt,
  large: 16pt,
  normal: 11pt,
  small: 10pt,
  tiny: 9pt,
)

// ============================================================================
// PAGE SETUP
// ============================================================================

/// Configure page layout and typography for CV
/// 
/// Parameters:
///   - ats-mode (bool): Use ATS-friendly layout (wider margins, simpler formatting)
#let setup-cv-page(ats-mode: false) = {
  set page(
    paper: "a4",
    margin: if ats-mode {
      (top: 2cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm)
    } else {
      (top: 1.5cm, bottom: 1.2cm, left: 2cm, right: 2cm)
    },
    numbering: none,
  )
  
  set text(
    font: "New Computer Modern",  // Default Typst font, professional and readable
    size: sizes.normal,
    lang: "en",
    fill: text-color,
  )
  
  set par(
    justify: false,
    leading: 0.65em,
  )
  
  // Set default list styling
  set list(
    indent: 0pt,
    body-indent: 0.5em,
    marker: [#circle(radius: 2pt, fill: primary-color)],
  )
}

// ============================================================================
// LAYOUT COMPONENTS
// ============================================================================

/// Render a section header with underline
/// 
/// Parameters:
///   - title (str): Section title text
#let section-header(title) = {
  v(0.4cm)
  text(size: sizes.large, fill: primary-color, weight: "bold")[#title]
  v(0.15cm)
  line(length: 100%, stroke: 0.3mm + primary-color)
  v(0.3cm)
}

/// Create a horizontal line separator
#let separator(thickness: 0.3mm, color: primary-color) = {
  line(length: 100%, stroke: thickness + color)
}

/// Flexible spacer
/// 
/// Parameters:
///   - size (str): "xs", "sm", "md", "lg", "xl"
#let spacer(size: "md") = {
  let spacing = (
    xs: 0.1cm,
    sm: 0.2cm,
    md: 0.3cm,
    lg: 0.5cm,
    xl: 0.8cm,
  )
  v(spacing.at(size, default: 0.3cm))
}

// ============================================================================
// CV HEADER
// ============================================================================

/// Render CV header with name, title, and contact information
/// 
/// Parameters:
///   - personal (dict): Personal info dictionary from resources/personal-info.typ
///   - include-photo (bool): Whether to include profile photo
///   - photo-path (str): Path to photo file
#let cv-header(personal, include-photo: false, photo-path: none) = {
  // Header grid: photo (optional) + info
  if include-photo and photo-path != none {
    grid(
      columns: (auto, 1fr),
      column-gutter: 1.5em,
      // Photo column
      align(center + horizon)[
        #box(
          width: 3.5cm,
          height: 3.5cm,
          radius: 50%,
          clip: true,
          image(photo-path, width: 3.5cm, height: 3.5cm, fit: "cover")
        )
      ],
      // Info column
      [
        #text(size: sizes.huge, weight: "bold", fill: primary-color)[#personal.name]
        
        #v(0.15cm)
        #text(size: sizes.large, fill: neutral-color)[#personal.title]
        
        #v(0.3cm)
        #grid(
          columns: (auto, auto),
          column-gutter: 1.5em,
          row-gutter: 0.3em,
          
          // Phone
          [#text(size: sizes.small)[📞 #personal.phone]],
          
          // Email
          [#text(size: sizes.small)[✉️ #link("mailto:" + personal.email)[#personal.email]]],
          
          // LinkedIn
          [#text(size: sizes.small)[🔗 #link(personal.linkedin)[LinkedIn]]],
          
          // GitHub
          [#text(size: sizes.small)[💻 #link(personal.github)[GitHub]]],
        )
        
        #if "location" in personal [
          #v(0.2cm)
          #text(size: sizes.small, fill: neutral-color)[📍 #personal.location]
        ]
      ]
    )
  } else {
    // No photo layout
    align(center)[
      #text(size: sizes.huge, weight: "bold", fill: primary-color)[#personal.name]
      
      #v(0.15cm)
      #text(size: sizes.large, fill: neutral-color)[#personal.title]
      
      #v(0.3cm)
      #text(size: sizes.small)[
        📞 #personal.phone
        #h(1em) | #h(1em)
        ✉️ #link("mailto:" + personal.email)[#personal.email]
        #h(1em) | #h(1em)
        🔗 #link(personal.linkedin)[LinkedIn]
        #h(1em) | #h(1em)
        💻 #link(personal.github)[GitHub]
      ]
      
      #if "location" in personal [
        #v(0.1cm)
        #text(size: sizes.small, fill: neutral-color)[📍 #personal.location]
      ]
    ]
  }
  
  v(0.5cm)
}

// ============================================================================
// CONTENT COMPONENTS
// ============================================================================

/// Render a job/company/date line
/// 
/// Parameters:
///   - position (str): Job title
///   - company (str): Company name
///   - date (str): Date range
#let text-line(position, company, date) = {
  grid(
    columns: (1fr, auto),
    column-gutter: 1em,
    [*#position* #text(fill: neutral-color)[|] #company],
    align(right)[#text(fill: neutral-color, style: "italic")[#date]]
  )
}

/// Render an accomplishment with bullet point
/// 
/// Parameters:
///   - content (str): Accomplishment text
///   - bullet-color (color): Color of bullet point
#let accomplishment(content, bullet-color: primary-color) = {
  block(
    inset: (left: 0em, top: 0.08cm, bottom: 0.08cm),
    [
      #box(baseline: 20%, circle(radius: 2pt, fill: bullet-color))
      #h(0.4em)
      #text(size: sizes.small)[#content]
    ]
  )
}

/// Render a skill proficiency bar
/// 
/// Parameters:
///   - filled (int): Number of filled circles (proficiency level)
///   - total (int): Total number of circles (default 5)
///   - color (color): Fill color for filled circles
#let skill-bar(filled, total: 5, color: primary-color) = {
  let empty = total - filled
  // Wrap each circle in box() to make it inline instead of block-level
  {
    for i in range(filled) {
      box(circle(radius: 2.5pt, fill: color))
      h(3pt)
    }
    for i in range(empty) {
      box(circle(radius: 2.5pt, fill: light-gray, stroke: 0.5pt + border-color))
      h(3pt)
    }
  }
}

/// Render a competency tag/badge
/// 
/// Parameters:
///   - skill (str): Skill name
///   - highlighted (bool): Use accent color background
#let competency-tag(skill, highlighted: false) = {
  let bg = if highlighted { accent-color } else { light-gray }
  let fg = if highlighted { white } else { text-color }
  
  box(
    fill: bg,
    inset: (x: 8pt, y: 5pt),
    radius: 4pt,
    text(size: sizes.small, fill: fg, weight: if highlighted { "bold" } else { "regular" })[#skill]
  )
  h(5pt)
}

/// Render a complete job entry
/// 
/// Parameters:
///   - position (str): Job title
///   - company (str): Company name
///   - date (str): Date range
///   - description (str): Job description
///   - accomplishments (array): List of accomplishment strings
#let job-entry(position, company, date, description, accomplishments) = {
  text-line(position, company, date)
  v(0.1cm)
  
  if description != none and description != "" {
    text(size: sizes.small, style: "italic", fill: neutral-color)[#description]
    v(0.15cm)
  }
  
  for item in accomplishments {
    accomplishment(item)
  }
  v(0.3cm)
}

// ============================================================================
// RESOURCE RENDERING FUNCTIONS
// ============================================================================

/// Render a job from resource dictionary
/// 
/// Parameters:
///   - job (dict): Job resource dictionary
///   - config (dict): Configuration with filters and limits
#let render-job(job, config) = {
  // Select accomplishments based on config
  let accs = job.accomplishments
  
  // Filter by impact if specified
  if "filters" in config and "min_accomplishment_impact" in config.filters {
    let min_impact = config.filters.min_accomplishment_impact
    let impact_order = (high: 3, medium: 2, low: 1)
    let min_level = impact_order.at(min_impact, default: 1)
    
    accs = accs.filter(a => impact_order.at(a.impact, default: 1) >= min_level)
  }
  
  // Filter by ATS mode
  if "filters" in config and "ats_mode" in config.filters and config.filters.ats_mode {
    accs = accs.filter(a => a.at("ats_friendly", default: true))
  }
  
  // Limit number of accomplishments
  if "accomplishments" in config and "max_per_job" in config.accomplishments {
    let max_count = config.accomplishments.max_per_job
    accs = accs.slice(0, calc.min(accs.len(), max_count))
  }
  
  // Extract text from accomplishments
  let acc_texts = accs.map(a => a.text)
  
  // Determine which description to use
  let desc = if "description_long" in job { job.description_long } else { job.description }
  
  // Render
  job-entry(
    job.position,
    job.company,
    job.start_date + " - " + job.end_date,
    desc,
    acc_texts
  )
}

/// Render education (degree) from resource dictionary
/// 
/// Parameters:
///   - edu (dict): Education resource dictionary
///   - config (dict): Configuration
#let render-education(edu, config) = {
  let degree_name = if "degree_type" in edu and "field" in edu {
    edu.degree_type + " in " + edu.field
  } else if "degree" in edu {
    edu.degree
  } else {
    "Degree"
  }
  
  let date_str = if "graduation_date" in edu {
    edu.graduation_date
  } else if "end_date" in edu {
    edu.end_date
  } else {
    ""
  }
  
  text-line(degree_name, edu.institution, date_str)
  
  if "description" in edu and edu.description != "" {
    v(0.1cm)
    text(size: sizes.small, style: "italic", fill: neutral-color)[#edu.description]
  }
  
  if "thesis_title" in edu and edu.thesis_title != "" {
    v(0.1cm)
    text(size: sizes.small)[*Thesis:* #edu.thesis_title]
  }
  
  v(0.3cm)
}

/// Render certificate from resource dictionary
/// 
/// Parameters:
///   - cert (dict): Certificate resource dictionary
///   - config (dict): Configuration
#let render-certificate(cert, config) = {
  text-line(cert.name, cert.provider, cert.completion_date)
  
  if "description" in cert and cert.description != "" {
    v(0.1cm)
    text(size: sizes.small, style: "italic", fill: neutral-color)[#cert.description]
  }
  
  v(0.25cm)
}

/// Render skills section with proficiency bars
/// 
/// Parameters:
///   - skills (array): Array of skill dictionaries with name and proficiency
///   - show-bars (bool): Whether to show proficiency bars
#let render-skills-section(skills, show-bars: true) = {
  for skill in skills {
    // Simple horizontal layout matching old design
    box(width: 100%)[
      #text(size: sizes.small)[#skill.name]
      #h(1fr)
      #if show-bars {
        skill-bar(skill.proficiency, total: 5)
      }
    ]
    v(0.15cm)
  }
}

/// Render languages section
/// 
/// Parameters:
///   - languages (array): Array of language dictionaries
#let render-languages-section(languages) = {
  for lang in languages {
    grid(
      columns: (1fr, auto),
      column-gutter: 1em,
      text(size: sizes.small)[#lang.name],
      text(size: sizes.small, fill: neutral-color, style: "italic")[#lang.level]
    )
    v(0.15cm)
  }
}

// ============================================================================
// UTILITY FUNCTIONS
// ============================================================================

/// Create a bullet icon
/// 
/// Parameters:
///   - color (color): Bullet color
#let bullet-icon(color: primary-color) = {
  box(baseline: 20%, circle(radius: 2pt, fill: color))
}

/// Create a clickable link with styling
/// 
/// Parameters:
///   - url (str): URL to link to
///   - display (str): Display text
#let make-link(url, display) = {
  link(url)[#text(fill: accent-color)[#display]]
}

/// Filter accomplishments by tags
/// 
/// Parameters:
///   - accomplishments (array): Array of accomplishment dictionaries
///   - required_tags (array): Tags that must be present
#let filter-by-tags(accomplishments, required_tags) = {
  if required_tags == none or required_tags.len() == 0 {
    return accomplishments
  }
  
  accomplishments.filter(acc => {
    required_tags.any(tag => acc.tags.contains(tag))
  })
}

// ============================================================================
// RESOURCE LOADING HELPERS
// ============================================================================

/// Load and return job data from work resource file
/// 
/// Parameters:
///   - filename (str): Filename in resources/work/
#let load-job(filename) = {
  // This will be used in templates to load job resources
  // Return value from #include will be the job dictionary
  let path = "../resources/work/" + filename
  let data = eval(read(path))
  data.job
}

/// Load and return education data from education resource file
/// 
/// Parameters:
///   - filename (str): Filename in resources/education/
#let load-education(filename) = {
  let path = "../resources/education/" + filename
  let data = eval(read(path))
  
  if "degree" in data {
    data.degree
  } else if "certificate" in data {
    data.certificate
  } else {
    data
  }
}
