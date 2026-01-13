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

// Override paragraph leading to match LaTeX \linespread{1.0}
#set par(leading: 0.40em, spacing: 0.40em)

// Additional compact styling overrides
#set list(
  indent: 0pt,
  body-indent: 0.3em,
  spacing: 0.05em,
  marker: [#circle(radius: 1.5pt, fill: primary-color)],
)

// Compact section header - ALL CAPS with full-width underline (matches LaTeX exactly)
#let compact-section-header(title) = {
  text(size: 11pt, fill: primary-color, weight: "bold")[#upper(title)]  // Reduced from 14pt to 11pt
  v(0.15cm)  // Reduced from 0.2cm
  line(length: 100%, stroke: 0.5pt + primary-color)  // Reduced from 0.3pt to 0.5pt
  v(0.1cm)  // Reduced from 0.2cm
}

// Competency box for tools - matches LaTeX \competency with light gray background and border
#let competency-box(tool-name) = {
  box(
    fill: rgb("#f0f0f0"),  // light gray background (black!8!white in LaTeX)
    stroke: 0.5pt + rgb("#e0e0e0"),  // subtle border
    radius: 4pt,  // rounded corners
    inset: (x: 3pt, y: 3pt),
  )[#text(size: 9pt)[#tool-name]]
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
    if acc_count > 0 { v(0.03cm) }  // Reduced from 0.05cm
    box(baseline: 20%, circle(radius: 2pt, fill: primary-color))
    h(0.3em)
    text(size: 9pt)[#acc.text]
    acc_count += 1
  }
  if acc_count > 0 { linebreak() }
}

// Compact job rendering for grouped positions under same company
#let render-grouped-company(company_name, jobs, config) = {
  // Company name on its own line (bold, normal size)
  text(size: 9.5pt, weight: "bold")[#company_name]  // Reduced from 11pt
  linebreak()
  
  for job in jobs {
    // Position + date on same line (footnotesize = 9pt)
    text(size: 9pt, weight: "bold")[#job.position]  // Reduced from 10pt
    h(1fr)
    text(size: 8.5pt, style: "italic", fill: neutral-color)[#job.start_date - #job.end_date]  // Reduced from 9pt
    linebreak()
    
    // Render accomplishments
    render-accomplishments(job, config)
  }
  
  v(0.06cm)  // Reduced from 0.1cm
}

// Compact job rendering - matches reference format (standalone company)
#let render-compact-job(job, config) = {
  // Company name on its own line (bold, normal size)
  text(size: 9.5pt, weight: "bold")[#job.company]  // Reduced from 11pt
  linebreak()
  // Position + date on same line (footnotesize = 9pt)
  text(size: 9pt, weight: "bold")[#job.position]  // Reduced from 10pt
  h(1fr)
  text(size: 8.5pt, style: "italic", fill: neutral-color)[#job.start_date - #job.end_date]  // Reduced from 9pt
  linebreak()
  
  // Render accomplishments  
  render-accomplishments(job, config)
  
  v(0.06cm)  // Reduced from 0.1cm
}

// ============================================================================
// HEADER - Matches reference: Blue name, title below, single-line contacts (COMPACT)
// ============================================================================

#align(center)[
  // Name - blue, bold, Huge in LaTeX
  #text(size: 24pt, weight: "bold", fill: primary-color)[#personal.name]  // Reduced from 25pt
  
  #v(0.15cm)  // Reduced from 0.2cm
  // Title - Large in LaTeX
  #text(size: 13pt, fill: neutral-color)[Head of Data Science]  // Reduced from 14pt
  
  #v(0.12cm)  // Reduced from 0.15cm
  
  // Contact info on single line with icon images - matching reference layout exactly
  #text(size: 8.5pt)[  // Reduced from 9pt
    #box(baseline: 20%, image("../resources/images/birthday.png", height: 0.9em)) #personal.birth_date  // Reduced icon
    #h(0.8em)  // Reduced from 1em
    #box(baseline: 20%, image("../resources/images/phone.png", height: 0.9em)) #personal.phone
    #h(0.8em)
    #box(baseline: 20%, image("../resources/images/linkedin.png", height: 0.9em)) #personal.linkedin
    #h(0.8em)
    #box(baseline: 20%, image("../resources/images/git.png", height: 0.9em)) #personal.github
  ]
]

// Blue separator line under header
#v(0.08cm)  // Reduced from 0.1cm
#line(length: 100%, stroke: 0.5pt + primary-color)  // Reduced from 0.3pt
#v(0.15cm)  // Reduced from 0.2cm

// ============================================================================
// FULL-WIDTH SUMMARY SECTION (outside column layout)
// ============================================================================

#compact-section-header("Summary")
#set par(justify: true)
#text(size: 11pt)[#personal.summary_long]  // Normal size, not footnotesize
#set par(justify: false)
#v(0.25cm)  // Reduced from 0.3cm

// ============================================================================
// MAIN CONTENT - TWO COLUMN LAYOUT (2fr/1fr ratio like reference)
// ============================================================================

#grid(
  columns: (0.66fr, 0.28fr),  // Matches LaTeX 0.66\linewidth and 0.28\linewidth
  column-gutter: 1.2em,  // Reduced from 1.5em
  
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
      v(0.05cm)  // Reduced from 0.1cm
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
      v(0.05cm)  // Reduced from 0.1cm
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
        v(0.05cm)  // Reduced from 0.1cm
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
    }
    
    #v(0.02cm)  // Reduced from 0.03cm
    
    // FAVORITE TOOLS - with competency boxes like LaTeX (inline wrapping)
    #compact-section-header("Favorite Tools")
    
    // Display tools with gray boxes that wrap horizontally
    #box(width: 100%)[
      #for tool in favorite_tools {
        competency-box(tool)
      }
    ]
    
    #v(0.02cm)  // Reduced from 0.03cm
    
    // SOFT SKILLS - Top 7 to match reference
    #compact-section-header("Soft Skills")
    
    #for skill in soft_skills.slice(0, calc.min(7, soft_skills.len())) {
      box(width: 100%)[
        #text(size: 9pt)[#skill.name]
        #h(1fr)
        #skill-bar(skill.proficiency, total: 5)
      ]
    }
    
    #v(0.08cm)  // Reduced from 0.1cm
    
    // LANGUAGES - All 6
    #compact-section-header("Languages")
    
    #for lang in languages.slice(0, calc.min(6, languages.len())) {
      box(width: 100%)[
        #text(size: 9pt)[#lang.name]
        #h(1fr)
        #skill-bar(lang.proficiency, total: 5)
      ]
    }
  ]
)
