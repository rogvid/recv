// ============================================================================
// ATS_CV.typ - ATS-Optimized CV Template
// ============================================================================
// This template prioritizes ATS (Applicant Tracking System) compatibility
// with a simple single-column layout and standard formatting.

#import "cv-common.typ": *
#import "../config/cv-config.typ": cv_config
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

// Import and render all jobs in ATS-friendly format
#import "../resources/work/2018-12-arge-innovations-owner.typ": job as job1

#text-line(job1.position, job1.company, job1.start_date + " - " + job1.end_date)
#v(0.1cm)

#text(size: sizes.small, style: "italic", fill: neutral-color)[#job1.description]

#v(0.15cm)

// List accomplishments as simple bullets
#for accomplishment in job1.accomplishments [
  #list(
    marker: text(fill: primary-color)[•],
    indent: 1em,
    [#accomplishment.text]
  )
]

#v(0.3cm)

// DFDS
#import "../resources/work/2018-12-dfds-data-science-consultant.typ": job as job2

#text-line(job2.position, job2.company, job2.start_date + " - " + job2.end_date)
#v(0.1cm)

#text(size: sizes.small, style: "italic", fill: neutral-color)[#job2.description]

#v(0.15cm)

#for accomplishment in job2.accomplishments [
  #list(
    marker: text(fill: primary-color)[•],
    indent: 1em,
    [#accomplishment.text]
  )
]

#v(0.3cm)

// ATP
#import "../resources/work/2017-02-atp-data-scientist.typ": job as job3

#text-line(job3.position, job3.company, job3.start_date + " - " + job3.end_date)
#v(0.1cm)

#text(size: sizes.small, style: "italic", fill: neutral-color)[#job3.description]

#v(0.15cm)

#for accomplishment in job3.accomplishments [
  #list(
    marker: text(fill: primary-color)[•],
    indent: 1em,
    [#accomplishment.text]
  )
]

#v(0.3cm)

// SDU
#import "../resources/work/2016-09-sdu-research-assistant.typ": job as job4

#text-line(job4.position, job4.company, job4.start_date + " - " + job4.end_date)
#v(0.1cm)

#text(size: sizes.small, style: "italic", fill: neutral-color)[#job4.description]

#v(0.15cm)

#for accomplishment in job4.accomplishments [
  #list(
    marker: text(fill: primary-color)[•],
    indent: 1em,
    [#accomplishment.text]
  )
]

#v(0.3cm)

// Conwx
#import "../resources/work/2015-04-conwx-data-analyst.typ": job as job5

#text-line(job5.position, job5.company, job5.start_date + " - " + job5.end_date)
#v(0.1cm)

#text(size: sizes.small, style: "italic", fill: neutral-color)[#job5.description]

#v(0.15cm)

#for accomplishment in job5.accomplishments [
  #list(
    marker: text(fill: primary-color)[•],
    indent: 1em,
    [#accomplishment.text]
  )
]

#v(0.4cm)

// ============================================================================
// EDUCATION HISTORY SECTION
// ============================================================================

#section-header("Education History")

#import "../resources/education/degree-2012-ku-msc-physics.typ": education as edu1

#text-line(edu1.degree, edu1.institution, edu1.start_date + " - " + edu1.end_date)
#v(0.1cm)

#if "description_long" in edu1 and edu1.description_long != "" [
  #text(size: sizes.small)[#edu1.description_long]
] else if "description" in edu1 [
  #text(size: sizes.small)[#edu1.description]
]

#if "thesis_title" in edu1 and edu1.thesis_title != "" [
  #v(0.1cm)
  #text(size: sizes.small)[*Thesis:* #emph[#edu1.thesis_title]]
]

#v(0.3cm)

#import "../resources/education/degree-2009-ku-bsc-physics.typ": education as edu2

#let edu2_degree = if "degree_type" in edu2 and "field" in edu2 {
  edu2.degree_type + " in " + edu2.field
} else if "degree" in edu2 {
  edu2.degree
} else {
  "Degree"
}

#text-line(edu2_degree, edu2.institution, edu2.start_date + " - " + edu2.end_date)
#v(0.1cm)

#if "description_long" in edu2 and edu2.description_long != "" [
  #text(size: sizes.small)[#edu2.description_long]
] else if "description" in edu2 [
  #text(size: sizes.small)[#edu2.description]
]

#v(0.4cm)

// ============================================================================
// CERTIFICATES SECTION
// ============================================================================

#section-header("Certificates")

#import "../resources/education/cert-2017-deeplearning-ai-deep-learning-specialization.typ": certificate as cert1

#text-line(cert1.name, cert1.provider, cert1.completion_date)
#v(0.1cm)

#if "description_long" in cert1 and cert1.description_long != "" [
  #text(size: sizes.small)[#cert1.description_long]
] else if "description" in cert1 [
  #text(size: sizes.small)[#cert1.description]
]

#v(0.3cm)

#import "../resources/education/cert-2018-coursera-social-network-analysis.typ": certificate as cert2

#text-line(cert2.name, cert2.provider, cert2.completion_date)
#v(0.1cm)

#if "description_long" in cert2 and cert2.description_long != "" [
  #text(size: sizes.small)[#cert2.description_long]
] else if "description" in cert2 [
  #text(size: sizes.small)[#cert2.description]
]

#v(0.3cm)

#import "../resources/education/cert-2015-udacity-data-analyst-nanodegree.typ": certificate as cert3

#text-line(cert3.name, cert3.provider, cert3.completion_date)
#v(0.1cm)

#if "description_long" in cert3 and cert3.description_long != "" [
  #text(size: sizes.small)[#cert3.description_long]
] else if "description" in cert3 [
  #text(size: sizes.small)[#cert3.description]
]

#if "notable_projects" in cert3 and cert3.notable_projects.len() > 0 [
  #v(0.15cm)
  #text(size: sizes.small)[*Notable Projects:*]
  #v(0.1cm)
  #for project in cert3.notable_projects [
    #list(
      marker: text(fill: primary-color)[•],
      indent: 1em,
      [#project]
    )
  ]
]

#v(0.4cm)

// ============================================================================
// LANGUAGES SECTION
// ============================================================================

#section-header("Languages")

// Group languages by proficiency level for ATS
#let native_langs = languages.filter(l => l.proficiency == 5)
#let professional_langs = languages.filter(l => l.proficiency == 4)
#let elementary_langs = languages.filter(l => l.proficiency >= 1 and l.proficiency <= 3)

#if native_langs.len() > 0 [
  #text(weight: "bold")[#native_langs.map(l => l.name).join(", ")] #h(1em) Native Language
  #v(0.2cm)
]

#if professional_langs.len() > 0 [
  #text(weight: "bold")[#professional_langs.map(l => l.name).join(", ")] #h(1em) Professional Proficiency
  #v(0.2cm)
]

#if elementary_langs.len() > 0 [
  #text(weight: "bold")[#elementary_langs.map(l => l.name).join(", ")] #h(1em) Elementary Proficiency
]
