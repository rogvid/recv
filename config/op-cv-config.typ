// config/op-cv-config.typ
// One-Page CV Configuration
// STRICT 1-page limit - selective content only

#let cv_config = (
  // Target information
  target: (
    position: "One-Page CV",
    company: "",
    keywords: (),
  ),
  
  // Work experiences (SELECT TOP 5 to match reference - Flowtale has 2 positions)
  work: (
    "2021-12-flowtale-head-of-data-science.typ",
    "2019-09-flowtale-senior-data-scientist.typ",
    "2018-12-dfds-data-science-consultant.typ", 
    "2017-02-atp-data-scientist.typ",
    "2015-04-conwx-data-analyst.typ",
  ),
  
  // Education (SELECT most relevant - include both degrees like reference)
  education: (
    degrees: (
      "degree-2012-ku-msc-physics.typ",    // M.Sc.
      "degree-2009-ku-bsc-physics.typ",    // B.Sc.
    ),
    certificates: (
      "cert-2017-deeplearning-ai-deep-learning-specialization.typ",  // Deep Learning Specialization only
      "cert-2015-udacity-data-analyst-nanodegree.typ",              // Data Analyst Nanodegree  
    ),
  ),
  
  // Accomplishment settings for ONE PAGE - balanced content
  accomplishments: (
    max_per_job: 2,                      // 2 bullets per job max (tight for 1 page)
    min_impact: "high",                  // Only HIGH impact for space
    prioritize_quantifiable: true,       // Prefer measurable results
    required_tags: (),                   // No tag filtering (rely on impact)
  ),
  
  // Skills display
  skills: (
    technical: "top",                    // Only top 8-10 technical skills
    soft: "top",                         // Only top 5-6 soft skills  
    show_bars: true,                     // Visual bars OK for one-page
  ),
  
  // General settings
  ats_mode: false,                       // One-page is for humans, not ATS
  include_all: false,                    // SELECTIVE content only
  page_limit: 1,                         // STRICT 1-page limit
  compact_mode: true,                    // Use compact spacing
)
