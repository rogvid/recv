// resources/education/degree-2012-ku-msc-physics.typ

#let education = (
  type: "degree",
  degree: "M.Sc. in Physics",
  institution: "University of Copenhagen",
  location: "Copenhagen, Denmark",
  start_date: "Aug. 2012",
  end_date: "May 2015",
  
  // Short description for standard CV
  description: "Focus on computational physics, machine learning and mathematical modeling.",
  
  // Detailed description for ATS or full CV
  description_long: "Focused studies on applied mathematics, computational physics, machine learning, statistics and mathematical modeling. Conducted extensive research on complex systems and pattern formation in biological systems, developing both theoretical frameworks and computational implementations.",
  
  // Thesis information
  thesis: (
    title: "Inflammation of the Central Nervous System - Modeling Multiple Sclerosis as a Motile Excitable Medium",
    advisor: "Professor Mogens Høgh Jensen",
    summary: "Developed computational models to simulate multiple sclerosis disease progression using partial differential equations and Monte Carlo methods, investigating pattern formation and wave propagation in neural tissue.",
  ),
  
  // Key areas and highlights
  highlights: (
    "Computational Physics",
    "Machine Learning",
    "Mathematical Modeling",
    "Statistical Mechanics",
    "Numerical Methods",
    "Applied Mathematics",
  ),
  
  // Tags for filtering and matching
  tags: ("physics", "machine-learning", "computational-modeling", "mathematics", "research", "statistics", "numerical-methods", "scientific-computing"),
  
  // Relevance scores for different job types (1-10 scale)
  relevance: (
    "data-science": 10,
    "machine-learning": 9,
    "research": 10,
    "physics": 10,
    "computational-science": 10,
    "data-engineering": 7,
    "software-engineering": 6,
    "ai-engineering": 8,
  ),
)
