// config/ats-cv-config.typ
// ATS-Optimized CV Configuration
// No page constraints - include ALL experiences and education

#let cv_config = (
  // Target information (optional for full CV)
  target: (
    position: "Full CV - ATS Optimized",
    company: "",
    keywords: (),
  ),
  
  // Work experiences (ALL - in chronological order, most recent first)
  work: (
    "2021-12-flowtale-head-of-data-science.typ",
    "2019-09-flowtale-senior-data-scientist.typ",
    "2018-12-arge-innovations-owner.typ",
    "2018-12-dfds-data-science-consultant.typ",
    "2017-02-atp-data-scientist.typ",
    "2015-04-conwx-data-analyst.typ",
  ),
  
  // Education (ALL)
  education: (
    degrees: (
      "degree-2012-ku-msc-physics.typ",
      "degree-2009-ku-bsc-physics.typ",
    ),
    certificates: (
      "cert-2019-aws-cloud-practitioner.typ",
      "cert-2018-coursera-social-network-analysis.typ",
      "cert-2017-deeplearning-ai-deep-learning-specialization.typ",
      "cert-2015-udacity-data-analyst-nanodegree.typ",
    ),
  ),
  
  // Accomplishment settings for ATS
  accomplishments: (
    max_per_job: 4,                      // More accomplishments for ATS
    min_impact: "medium",                // Include medium and high impact
    prioritize_quantifiable: true,       // ATS loves numbers
    required_tags: (),                   // No filtering - show all
  ),
  
  // Skills display
  skills: (
    technical: "all",                    // Show all technical skills
    soft: "all",                         // Show all soft skills
    show_bars: false,                    // ATS-friendly (no graphics)
  ),
  
  // General settings
  ats_mode: true,                        // Optimize for ATS parsing
  include_all: true,                     // Include all content
  page_limit: none,                      // No page limit
)
