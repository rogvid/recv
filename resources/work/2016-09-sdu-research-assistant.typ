// resources/work/2016-09-sdu-research-assistant.typ
// Research Assistant at University of Southern Denmark

#let job = (
  // Basic Information
  position: "Research Assistant",
  company: "University of Southern Denmark",
  location: "Odense, Denmark",
  start_date: "Sep. 2016",
  end_date: "Jan. 2017",
  current: false,
  
  // Descriptions
  description: "Conducted computational physics research on pattern formation in biological systems",
  
  description_long: "Conducted research in computational physics and mathematical modeling of biological systems. Developed and implemented computational models using Python and numerical methods to simulate pattern formation in neural tissue and disease progression.",
  
  // Accomplishments
  accomplishments: (
    (
      text: "Developed computational model of multiple sclerosis disease progression using partial differential equations and Monte Carlo methods",
      impact: "high",
      quantifiable: false,
      tags: ("research", "computational-modeling", "python", "mathematics", "physics"),
      ats_friendly: true,
    ),
    (
      text: "Implemented numerical simulation algorithms in Python for solving complex PDE systems with 10,000+ grid points",
      impact: "medium",
      quantifiable: true,
      tags: ("python", "numerical-methods", "algorithms", "performance-optimization"),
      ats_friendly: true,
    ),
    (
      text: "Analyzed simulation results using statistical methods and machine learning to identify disease patterns",
      impact: "medium",
      quantifiable: false,
      tags: ("data-analysis", "statistics", "machine-learning", "research"),
      ats_friendly: true,
    ),
    (
      text: "Collaborated with experimental biologists to validate computational predictions against real data",
      impact: "low",
      quantifiable: false,
      tags: ("collaboration", "interdisciplinary", "research", "biology"),
      ats_friendly: true,
    ),
  ),
  
  // Technologies
  technologies: ("Python", "NumPy", "SciPy", "Matplotlib", "Git", "LaTeX"),
  
  // Tags
  tags: ("research", "academic-research", "physics", "computational-modeling", "mathematics", "biology", "numerical-methods"),
  
  // Relevance Scores (1-10 scale)
  relevance: (
    "research": 10,
    "ml-researcher": 7,
    "applied-scientist": 8,
    "data-science": 6,
    "ml-engineering": 4,
    "software-engineering": 5,
    "consulting": 3,
    "data-analyst": 5,
    "data-engineering": 3,
    "computational-science": 10,
  ),
  
  // Optional fields
  employment_type: "part-time",
)
