// templates/OP_CV.typ - One-Page CV Template
// Strictly 1-page CV with selective content and compact formatting
// Uses config/op-cv-config.typ by default (can be overridden by tailored configs)
// Maximum 3 jobs supported for 1-page constraint

#import "cv-common.typ": *
#import "../config/op-cv-config.typ": cv_config
#import "../resources/personal-info.typ": personal, technical_skills, soft_skills, languages, favorite_tools

// ============================================================================
// DOCUMENT SETUP - COMPACT FOR 1-PAGE
// ============================================================================

#set document(
  title: "CV - " + personal.name + " - One Page",
  author: personal.name,
  keywords: ("CV", "Data Science", "Machine Learning"),
)

// Use compact mode for strict 1-page layout
#setup-cv-page(ats-mode: false, compact-mode: true)

// Override paragraph leading to match LaTeX \linespread{1.0} - VERY TIGHT for 1-page
#set par(leading: 0.43em, spacing: 0.43em)  // Further reduced to compensate for larger dots/lines

// Additional compact styling overrides - VERY TIGHT spacing
#set list(
  indent: 0pt,
  body-indent: 0.3em,
  spacing: 0.01em,
  marker: [#circle(radius: 1.5pt, fill: primary-color)],
)

// Compact section header - ALL CAPS with full-width underline (matches LaTeX exactly)
#let compact-section-header(title) = {
  text(size: 14.4pt, fill: primary-color, weight: 700)[#upper(title)]  // Explicit weight 700
  v(0.1cm)
  line(length: 100%, stroke: 0.9pt + primary-color)  // Increased from 0.3mm to match reference
  v(0.1cm)
}

// Competency box for tools - matches LaTeX \competency with light gray background and border
#let competency-box(tool-name) = {
  box(
    fill: rgb("#EBEBEB"),  // LaTeX black!8!white = 92% white + 8% black
    stroke: 0.5pt + white,  // LaTeX colframe=white
    radius: 4pt,  // LaTeX arc=4pt
    inset: (x: 3pt, y: 3pt),  // LaTeX left/right/top/bottom=3pt
  )[#text(size: 9pt)[#tool-name]]  // LaTeX \footnotesize
  h(2pt)
}

// Render accomplishments for a job
#let render-accomplishments(job, config) = {
  let max_acc = config.accomplishments.max_per_job
  let min_impact = config.accomplishments.min_impact
  
  let filtered = job.accomplishments.filter(a => {
    if min_impact == "high" {
      a.impact == "high"
    } else if min_impact == "medium" {
      a.impact == "high" or a.impact == "medium"
    } else {
      true
    }
  })
  
  let acc_count = 0
  for acc in filtered.slice(0, calc.min(max_acc, filtered.len())) {
    if acc_count > 0 { v(0.02cm) }
    box(baseline: 20%, circle(radius: 2.5pt, fill: primary-color))  // Increased from 2pt
    h(0.3em)
    text(size: 9pt)[#acc.text]
    acc_count += 1
  }
  if acc_count > 0 { linebreak() }
}

// Compact job rendering for grouped positions under same company
#let render-grouped-company(company_name, jobs, config) = {
  // Company name on its own line (bold, normal size)
  text(size: 11pt, weight: "bold")[#company_name]  // LaTeX \normalsize = 11pt
  linebreak()
  
  for job in jobs {
    // Position + date on same line (footnotesize = 9pt)
    text(size: 9pt, weight: "bold")[#job.position]
    h(1fr)
    text(size: 9pt, style: "italic", fill: neutral-color)[#job.start_date - #job.end_date]  // LaTeX \footnotesize\textit
    linebreak()
    
    // Render accomplishments
    render-accomplishments(job, config)
  }
  
  v(0.05cm)  // Reduced from 0.1cm for tighter spacing
}

// Compact job rendering - matches reference format (standalone company)
#let render-compact-job(job, config) = {
  // Company name on its own line (bold, normal size)
  text(size: 11pt, weight: "bold")[#job.company]  // LaTeX \normalsize = 11pt
  linebreak()
  // Position + date on same line (footnotesize = 9pt)
  text(size: 9pt, weight: "bold")[#job.position]
  h(1fr)
  text(size: 9pt, style: "italic", fill: neutral-color)[#job.start_date - #job.end_date]  // Will fix to 9pt later
  linebreak()
  
  // Render accomplishments  
  render-accomplishments(job, config)
  
  v(0.05cm)  // Reduced from 0.1cm for tighter spacing
}

// ============================================================================
// HEADER - Matches reference: Blue name, title below, single-line contacts (COMPACT)
// ============================================================================

#align(center)[
  // Name - blue, bold, Huge in LaTeX
  #text(size: 24.88pt, weight: "bold", fill: primary-color)[#personal.name]  // LaTeX \Huge = 24.88pt
  
  #v(0.15cm)  // Reduced from 0.2cm
  // Title - Large in LaTeX
  #text(size: 14.4pt, fill: neutral-color)[Head of Data Science]  // LaTeX \Large = 14.4pt
  
  #v(0.08cm)  // Reduced from 0.1cm
  
  // Contact info on single line with icon images - matching reference layout exactly
  #text(size: 9pt)[  // LaTeX \footnotesize = 9pt
    #box(baseline: 20%, image("../resources/images/birthday.png", height: 1em)) #personal.birth_date
    #h(0.8em)  // Reduced from 1em for tighter spacing
    #box(baseline: 20%, image("../resources/images/phone.png", height: 1em)) #personal.phone
    #h(0.8em)
    #box(baseline: 20%, image("../resources/images/linkedin.png", height: 1em)) #personal.linkedin
    #h(0.8em)
    #box(baseline: 20%, image("../resources/images/git.png", height: 1em)) #personal.github
  ]
]

#v(0.1cm)  // Further reduced from 0.15cm before SUMMARY section

// ============================================================================
// FULL-WIDTH SUMMARY SECTION (outside column layout)
// ============================================================================

#compact-section-header("Summary")
#set par(justify: true)
#text(size: 11pt)[#personal.summary_long]  // Normal size, not footnotesize
#set par(justify: false)
#v(0.15cm)  // Further reduced from 0.2cm

// ============================================================================
// MAIN CONTENT - TWO COLUMN LAYOUT (2fr/1fr ratio like reference)
// ============================================================================

#grid(
  columns: (0.68fr, 0.28fr),  // Adjusted from 0.66fr to better match reference 70/30 split
  column-gutter: 1.5em,  // Matches LaTeX minipage spacing
  
  // ============================================================================
  // LEFT COLUMN - MAIN CONTENT
  // ============================================================================
  [
    // EXPERIENCE
    #compact-section-header("Experience")
    
    // Flowtale - grouped (2 positions under same company like reference)
    #{
      let flowtale_head = {
        import "../resources/work/2021-12-flowtale-head-of-data-science.typ": job
        job
      }
      let flowtale_senior = {
        import "../resources/work/2019-09-flowtale-senior-data-scientist.typ": job
        job
      }
      render-grouped-company("Flowtale", (flowtale_head, flowtale_senior), cv_config)
    }
    
    // DFDS A/S
    #{
      let job_dfds = {
        import "../resources/work/2018-12-dfds-data-science-consultant.typ": job
        job
      }
      render-compact-job(job_dfds, cv_config)
    }
    
    // ATP
    #{
      let job_atp = {
        import "../resources/work/2017-02-atp-data-scientist.typ": job
        job
      }
      render-compact-job(job_atp, cv_config)
    }
    
    // ConWX
    #{
      let job_conwx = {
        import "../resources/work/2015-04-conwx-data-analyst.typ": job
        job
      }
      render-compact-job(job_conwx, cv_config)
    }
    
    // EDUCATION - more compact, both degrees
    #compact-section-header("Education")
    
    // Load degree 1 (MSc)
    #if cv_config.education.degrees.len() >= 1 {
      let edu = {
        import ("../resources/education/" + cv_config.education.degrees.at(0)): education
        education
      }
      text(size: 9pt)[#edu.degree]
      h(1fr)
      text(size: 9pt)[#edu.institution]
      text(size: 9pt)[ #edu.start_date - #edu.end_date]
      linebreak()
      text(size: 9pt, style: "italic", fill: neutral-color)[#edu.description]
      v(0.03cm)  // Reduced from 0.05cm
    }
    
    // Load degree 2 (BSc) if exists
    #if cv_config.education.degrees.len() >= 2 {
      let edu2 = {
        import ("../resources/education/" + cv_config.education.degrees.at(1)): education
        education
      }
      text(size: 9pt)[#edu2.degree]
      h(1fr)
      text(size: 9pt)[#edu2.institution]
      text(size: 9pt)[ #edu2.start_date - #edu2.end_date]
      linebreak()
      text(size: 9pt, style: "italic", fill: neutral-color)[#edu2.description]
      v(0.03cm)  // Reduced from 0.05cm
    }
    
    // CERTIFICATIONS - compact
    #if cv_config.education.certificates.len() > 0 {
      compact-section-header("Certifications")
      
      // Load certificate 1 (if exists)  
      if cv_config.education.certificates.len() >= 1 {
        let cert1 = {
          import ("../resources/education/" + cv_config.education.certificates.at(0)): certificate
          certificate
        }
        text(size: 9pt)[#cert1.name]
        h(1fr)
        text(size: 9pt)[#cert1.provider]
        text(size: 9pt)[ #cert1.completion_date]
        linebreak()
        text(size: 9pt, fill: neutral-color)[#cert1.description]
        v(0.03cm)  // Reduced from 0.05cm
      }
      
      // Load certificate 2 (if exists)
      if cv_config.education.certificates.len() >= 2 {
        let cert2 = {
          import ("../resources/education/" + cv_config.education.certificates.at(1)): certificate
          certificate
        }
        text(size: 9pt)[#cert2.name]
        h(1fr)
        text(size: 9pt)[#cert2.provider]
        text(size: 9pt)[ #cert2.completion_date]
        linebreak()
        text(size: 9pt, fill: neutral-color)[#cert2.description]
      }
    }
  ],
  
  // ============================================================================
  // RIGHT COLUMN - SIDEBAR (COMPACT)
  // ============================================================================
  [
    // TECHNICAL SKILLS - Top 14 to match reference
    #compact-section-header("Technical Skills")
    
    #for skill in technical_skills.slice(0, calc.min(14, technical_skills.len())) {
      box(width: 100%)[
        #text(size: 9pt)[#skill.name]
        #h(1fr)
        #skill-bar(skill.proficiency, total: 5)
      ]
      v(0.015cm)  // Further reduced from 0.02cm
    }
    
    #v(0.18cm)  // Further reduced from 0.2cm
    
    // FAVORITE TOOLS - with competency boxes like LaTeX (inline wrapping)
    #compact-section-header("Favorite Tools")
    
    // Display tools with gray boxes that wrap horizontally
    #box(width: 100%)[
      #for tool in favorite_tools {
        competency-box(tool)
      }
    ]
    
    #v(0.18cm)  // Further reduced from 0.2cm
    
    // SOFT SKILLS - Top 7 to match reference
    #compact-section-header("Soft Skills")
    
    #for skill in soft_skills.slice(0, calc.min(7, soft_skills.len())) {
      box(width: 100%)[
        #text(size: 9pt)[#skill.name]
        #h(1fr)
        #skill-bar(skill.proficiency, total: 5)
      ]
      v(0.015cm)  // Further reduced from 0.02cm
    }
    
    #v(0.18cm)  // Further reduced from 0.2cm
    
    // LANGUAGES - All 6
    #compact-section-header("Languages")
    
    #for lang in languages.slice(0, calc.min(6, languages.len())) {
      box(width: 100%)[
        #text(size: 9pt)[#lang.name]
        #h(1fr)
        #skill-bar(lang.proficiency, total: 5)
      ]
      v(0.015cm)  // Further reduced from 0.02cm
    }
  ]
)
