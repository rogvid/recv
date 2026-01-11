// resources/work/2015-04-conwx-data-analyst.typ
// Data Analyst at ConWX ApS

#let job = (
  // Basic Information
  position: "Data Analyst",
  company: "ConWX ApS",
  location: "Copenhagen, Denmark",
  start_date: "Apr. 2015",
  end_date: "Jan. 2017",
  current: false,
  
  // Descriptions
  description: "Developed analytics solutions and data infrastructure for weather-based business intelligence",
  
  description_long: "Developed data analytics solutions and infrastructure for a weather data startup, focusing on business intelligence, predictive modeling, and customer-facing data products. Built end-to-end data pipelines and visualization tools to deliver weather-based insights to enterprise clients.",
  
  // Accomplishments
  accomplishments: (
    (
      text: "Built automated weather data pipeline processing 50+ data sources, reducing data lag from hours to minutes",
      impact: "high",
      quantifiable: true,
      tags: ("data-engineering", "python", "etl", "automation", "performance-improvement"),
      ats_friendly: true,
    ),
    (
      text: "Developed predictive weather models for agriculture and energy sectors, generating €500K+ in client revenue",
      impact: "high",
      quantifiable: true,
      tags: ("predictive-modeling", "machine-learning", "python", "revenue-growth"),
      ats_friendly: true,
    ),
    (
      text: "Created interactive weather dashboards for enterprise clients using D3.js and Flask",
      impact: "medium",
      quantifiable: false,
      tags: ("data-visualization", "d3", "flask", "frontend", "client-facing"),
      ats_friendly: true,
    ),
    (
      text: "Implemented SQL database architecture for efficient weather data storage and retrieval",
      impact: "medium",
      quantifiable: false,
      tags: ("sql", "database-design", "data-engineering", "backend"),
      ats_friendly: true,
    ),
    (
      text: "Conducted exploratory data analysis to identify weather patterns and business opportunities",
      impact: "low",
      quantifiable: false,
      tags: ("eda", "data-analysis", "statistics", "business-intelligence"),
      ats_friendly: true,
    ),
  ),
  
  // Technologies
  technologies: ("Python", "SQL", "Pandas", "Scikit-learn", "Flask", "D3.js", "PostgreSQL", "Git"),
  
  // Tags
  tags: ("data-analysis", "data-engineering", "machine-learning", "weather", "agriculture", "energy", "startup"),
  
  // Relevance Scores (1-10 scale)
  relevance: (
    "data-analyst": 10,
    "data-science": 8,
    "data-engineering": 9,
    "ml-engineering": 6,
    "software-engineering": 7,
    "consulting": 5,
    "applied-scientist": 6,
    "research": 4,
    "business-analyst": 8,
    "backend-engineering": 7,
  ),
  
  // Optional fields
  employment_type: "full-time",
)
