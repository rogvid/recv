// config/cv-config.typ
// Configuration for full CV (all content)

#let cv_config = (
  // Personal Information
  personal_info: "../resources/personal-info.typ",
  
  // Work Experiences (in display order - most recent first)
  work_experiences: (
    "2018-12-arge-innovations-owner.typ",
    "2018-12-dfds-data-science-consultant.typ",
    "2017-02-atp-data-scientist.typ",
    "2016-09-sdu-research-assistant.typ",
    "2015-04-conwx-data-analyst.typ",
  ),
  
  // Education
  education: (
    // Degrees
    degrees: (
      "degree-2012-ku-msc-physics.typ",
      "degree-2009-ku-bsc-physics.typ",
    ),
    
    // Certificates (ordered by relevance/recency)
    certificates: (
      "cert-2017-deeplearning-ai-deep-learning-specialization.typ",
      "cert-2018-coursera-social-network-analysis.typ",
      "cert-2015-udacity-data-analyst-nanodegree.typ",
    ),
  ),
  
  // Skills Display
  skills: (
    technical: "all",  // Show all technical skills
    soft: "all",       // Show all soft skills
    highlight: none,   // Optionally highlight specific skills
  ),
  
  // Accomplishment Selection
  accomplishments: (
    max_per_job: 5,                 // Maximum accomplishments per job
    min_impact: "low",              // Include all impact levels (low, medium, high)
    prioritize_quantifiable: true,  // Prefer quantifiable achievements
    prioritize_high_impact: true,   // Sort high impact first
  ),
  
  // Filtering (none for full CV - include everything)
  filters: (
    target_job_type: none,          // No specific target for full CV
    min_relevance_score: 0,         // Include all experiences
    required_tags: none,            // No tag requirements
    exclude_tags: none,             // Don't exclude anything
    ats_mode: false,                // Not optimized for ATS
    max_work_experiences: 10,       // Include many jobs
    max_accomplishments_per_job: 5, // Up to 5 accomplishments per job
    max_certificates: 3,            // Show up to 3 certificates
    max_education: 2,               // Show 2 degrees (M.Sc. + B.Sc.)
  ),
  
  // Layout Preferences
  layout: (
    include_photo: true,            // Include profile photo
    two_column: true,               // Use two-column layout
    color_scheme: "blue",           // Color scheme: blue, red, gray, minimal
    compact_mode: false,            // Full detail mode
  ),
)
