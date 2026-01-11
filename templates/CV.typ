// templates/CV.typ
// Main CV Template - Professional 2-Column Layout

// Import common functions and styles
#import "cv-common.typ": *

// Import configuration
#import "../config/cv-config.typ": cv_config

// Import personal info
#import "../resources/personal-info.typ": personal, technical_skills, soft_skills, languages

// Set document metadata
#set document(
  title: "CV - " + personal.name,
  author: personal.name,
  keywords: ("CV", "Data Science", "Machine Learning"),
)

// Apply page setup
#setup-cv-page(ats-mode: false)

// ============================================================================
// HEADER
// ============================================================================

#cv-header(
  personal,
  include-photo: false,  // Set to true and provide path if you want photo
  photo-path: none
)

// ============================================================================
// SUMMARY
// ============================================================================

#section-header("Summary")

#personal.summary_long

#v(0.5cm)

// ============================================================================
// MAIN CONTENT - TWO COLUMN LAYOUT
// ============================================================================

#grid(
  columns: (2fr, 1fr),
  column-gutter: 1.5em,
  
  // ====================================
  // LEFT COLUMN - Main Content
  // ====================================
  [
    // EXPERIENCE SECTION
    #section-header("Experience")
    
    // Import and render all jobs
    #import "../resources/work/2018-12-arge-innovations-owner.typ": job as job1
    #render-job(job1, cv_config)
    
    #import "../resources/work/2018-12-dfds-data-science-consultant.typ": job as job2
    #render-job(job2, cv_config)
    
    #import "../resources/work/2017-02-atp-data-scientist.typ": job as job3
    #render-job(job3, cv_config)
    
    #import "../resources/work/2016-09-sdu-research-assistant.typ": job as job4
    #render-job(job4, cv_config)
    
    #import "../resources/work/2015-04-conwx-data-analyst.typ": job as job5
    #render-job(job5, cv_config)
    
    // EDUCATION SECTION
    #section-header("Education")
    
    #import "../resources/education/degree-2012-ku-msc-physics.typ": education as edu1
    #render-education(edu1, cv_config)
    
    #import "../resources/education/degree-2009-ku-bsc-physics.typ": education as edu2
    #render-education(edu2, cv_config)
    
    // CERTIFICATIONS SECTION
    #section-header("Certifications")
    
    #import "../resources/education/cert-2017-deeplearning-ai-deep-learning-specialization.typ": certificate as cert1
    #render-certificate(cert1, cv_config)
    
    #import "../resources/education/cert-2018-coursera-social-network-analysis.typ": certificate as cert2
    #render-certificate(cert2, cv_config)
    
    #import "../resources/education/cert-2015-udacity-data-analyst-nanodegree.typ": certificate as cert3
    #render-certificate(cert3, cv_config)
  ],
  
  // ====================================
  // RIGHT COLUMN - Sidebar
  // ====================================
  [
    // TECHNICAL SKILLS SECTION
    #section-header("Technical Skills")
    
    #render-skills-section(technical_skills, show-bars: true)
    
    #v(0.5cm)
    
    // SOFT SKILLS SECTION
    #section-header("Soft Skills")
    
    #render-skills-section(soft_skills, show-bars: true)
    
    #v(0.5cm)
    
    // LANGUAGES SECTION
    #section-header("Languages")
    
    #render-languages-section(languages)
  ]
)
