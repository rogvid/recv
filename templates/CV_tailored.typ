// templates/CV_tailored.typ - Tailored CV Template
// This is a simplified version for testing manual tailoring
// Uses config/tailored/ml-engineer-config.typ

#import "cv-common.typ": *
#import "../config/tailored/ml-engineer-config.typ": cv_config
#import "../resources/personal-info.typ": personal, technical_skills, soft_skills, languages

// ============================================================================
// DOCUMENT SETUP
// ============================================================================

#set document(
  title: "CV - " + personal.name + " - " + cv_config.target.position,
  author: personal.name,
  keywords: cv_config.target.keywords,
)

#setup-cv-page(ats-mode: false)

// ============================================================================
// HEADER
// ============================================================================

#cv-header(personal)

#v(0.5cm)

// ============================================================================
// MAIN CONTENT - TWO COLUMN LAYOUT
// ============================================================================

#grid(
  columns: (2fr, 1fr),
  column-gutter: 1.5em,
  
  // ============================================================================
  // LEFT COLUMN - MAIN CONTENT
  // ============================================================================
  [
    // SUMMARY
    #section-header("Summary")
    #personal.summary_long
    #v(0.4cm)
    
    // EXPERIENCE
    #section-header("Experience")
    
    // Load jobs specified in config
    // Job 1: Arge Innovations
    #import "../resources/work/2018-12-arge-innovations-owner.typ": job as job1
    #render-job(job1, cv_config)
    
    // Job 2: DFDS
    #import "../resources/work/2018-12-dfds-data-science-consultant.typ": job as job2
    #render-job(job2, cv_config)
    
    // Job 3: ATP
    #import "../resources/work/2017-02-atp-data-scientist.typ": job as job3
    #render-job(job3, cv_config)
    
    // EDUCATION
    #section-header("Education")
    
    // M.Sc. Physics
    #import "../resources/education/degree-2012-ku-msc-physics.typ": education as edu1
    #render-education(edu1, cv_config)
    
    #v(0.2cm)
    
    // CERTIFICATIONS
    #section-header("Certifications")
    
    // Deep Learning Specialization
    #import "../resources/education/cert-2017-deeplearning-ai-deep-learning-specialization.typ": certificate as cert1
    #render-certificate(cert1, cv_config)
  ],
  
  // ============================================================================
  // RIGHT COLUMN - SIDEBAR
  // ============================================================================
  [
    // TECHNICAL SKILLS
    #section-header("Technical Skills")
    
    #render-skills-section(technical_skills, show-bars: true)
    
    #v(0.5cm)
    
    // SOFT SKILLS
    #section-header("Soft Skills")
    
    #render-skills-section(soft_skills, show-bars: true)
    
    #v(0.5cm)
    
    // LANGUAGES
    #section-header("Languages")
    
    #render-languages-section(languages)
  ]
)
