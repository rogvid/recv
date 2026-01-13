// ============================================================================
// ATS_CV.typ - ATS-Optimized CV Template
// ============================================================================
// This template prioritizes ATS (Applicant Tracking System) compatibility
// with a simple single-column layout and standard formatting.
// Uses config/ats-cv-config.typ for content selection

#import "cv-common.typ": *
#import "../config/ats-cv-config.typ": cv_config
#import "../resources/personal-info.typ": personal, technical_skills, soft_skills, languages

// ============================================================================
// DOCUMENT SETUP
// ============================================================================

#set document(
  title: "CV - " + personal.name + " - ATS Optimized",
  author: personal.name,
  keywords: ("CV", "Data Science", "Machine Learning", "Python", "Optimization", 
             "Deep Learning", "Analytics", "Data Visualization"),
)

// Use ATS mode for simple, parsable formatting
#setup-cv-page(ats-mode: true)

// ============================================================================
// HEADER SECTION
// ============================================================================

#align(center)[
  #text(size: 24pt, weight: "bold")[
    #personal.name
  ]
  #v(0.2cm)
  #text(size: 16pt)[
    #personal.title
  ]
]

#v(0.3cm)

// Contact Information - Simple, linear format
#align(center)[
  #text(size: 10pt)[
    #personal.phone
    #h(0.5cm)
    #personal.email
    #h(0.5cm)
    #personal.linkedin
    #h(0.5cm)
    #personal.github
  ]
]

#v(0.1cm)

#align(center)[
  #text(size: 10pt)[
    #personal.location
  ]
]

#v(0.4cm)

// ============================================================================
// SUMMARY SECTION
// ============================================================================

#section-header("Summary")

#personal.summary_long

#v(0.4cm)

// ============================================================================
// KEY COMPETENCIES SECTION
// ============================================================================
// List all skills as tags for ATS keyword matching

#section-header("Key Competencies")

// Combine technical and soft skills for ATS
#let all_skills = technical_skills + soft_skills

#for skill in all_skills [
  #competency-tag(skill.name)
]

#v(0.4cm)

// ============================================================================
// EMPLOYMENT HISTORY SECTION
// ============================================================================

#section-header("Employment History")

// Dynamically load and render jobs from config
#for job_file in cv_config.work {
  let job_path = "../resources/work/" + job_file
  import job_path: job
  
  text-line(job.position, job.company, job.start_date + " - " + job.end_date)
  v(0.1cm)
  job.description_long
  v(0.2cm)
  
  // Render accomplishments from config
  let max_acc = cv_config.accomplishments.max_per_job
  let min_impact = cv_config.accomplishments.min_impact
  
  let filtered_accomplishments = job.accomplishments.filter(acc => {
    if min_impact == "high" {
      acc.impact == "high"
    } else if min_impact == "medium" {
      acc.impact == "high" or acc.impact == "medium"
    } else {
      true
    }
  })
  
  for acc in filtered_accomplishments.slice(0, calc.min(max_acc, filtered_accomplishments.len())) [
    - #acc.text
  ]
  
  v(0.1cm)
  text(size: 9pt, style: "italic", fill: gray)[
    *Tech:* #job.technologies.join(", ")
  ]
  
  v(0.3cm)
  line(length: 100%, stroke: (paint: gray, thickness: 0.5pt))
  v(0.3cm)
}

// ============================================================================
// EDUCATION HISTORY SECTION
// ============================================================================

#section-header("Education History")

// Dynamically load degrees from config
#for edu_file in cv_config.education.degrees {
  let edu_path = "../resources/education/" + edu_file
  import edu_path: education
  
  text-line(education.degree, education.institution, education.start_date + " - " + education.end_date)
  v(0.1cm)
  education.description_long
  v(0.3cm)
}

// ============================================================================
// CERTIFICATIONS SECTION
// ============================================================================

#section-header("Certifications")

// Dynamically load certificates from config
#for cert_file in cv_config.education.certificates {
  let cert_path = "../resources/education/" + cert_file
  import cert_path: certificate
  
  text-line(certificate.name, certificate.provider, certificate.completion_date)
  v(0.1cm)
  certificate.description
  v(0.3cm)
}

// ============================================================================
// LANGUAGES SECTION
// ============================================================================

#section-header("Languages")

#for lang in languages [
  *#lang.name* - #lang.proficiency
  #v(0.1cm)
]
