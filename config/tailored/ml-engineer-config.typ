// config/tailored/ml-engineer-config.typ
// Configuration for Machine Learning Engineer positions
// Focuses on ML, deep learning, and technical implementation

#let cv_config = (
  // Target job profile
  target: (
    position: "Senior Machine Learning Engineer",
    keywords: ("machine-learning", "deep-learning", "python", "tensorflow", 
               "model-deployment", "mlops", "data-pipeline"),
  ),
  
  // Work experiences (in display order)
  // Prioritize ML-heavy roles
  work: (
    "2018-12-arge-innovations-owner.typ",      // ML consulting - highly relevant
    "2018-12-dfds-data-science-consultant.typ", // ML models + optimization
    "2017-02-atp-data-scientist.typ",          // Predictive models + pipelines
    // Omit: SDU (research), ConWX (less ML-focused)
  ),
  
  // Education - emphasize ML background
  education: (
    degrees: (
      "degree-2012-ku-msc-physics.typ",  // Computational physics + ML focus
      // Omit: B.Sc. to save space and focus on advanced degree
    ),
    certificates: (
      "cert-2017-deeplearning-ai-deep-learning-specialization.typ", // Most relevant
      // Omit: Social Network Analysis, Udacity (less relevant for this role)
    ),
  ),
  
  // Skills display
  skills: (
    // Highlight ML-specific technical skills
    technical_highlight: ("Python", "Machine Learning", "Deep Learning", 
                         "TensorFlow", "Optimization", "Data Analysis"),
    technical: "all",  // Show all, but highlight above
    soft: "all",
  ),
  
  // Accomplishment selection criteria
  accomplishments: (
    max_per_job: 3,                      // Top 3 per job
    min_impact: "high",                   // Only high-impact achievements
    prioritize_quantifiable: true,        // Prefer metrics/numbers
    required_tags: ("machine-learning", "deep-learning", "optimization", "python"),
  ),
)
