// resources/work/2019-09-flowtale-senior-data-scientist.typ
// Senior Data Scientist at Flowtale

#let job = (
  // Basic Information
  position: "Senior Data Scientist",
  company: "Flowtale",
  location: "Copenhagen, Denmark",
  start_date: "Sep. 2019",
  end_date: "Dec. 2021",
  current: false,
  
  // Descriptions
  description: "Developed data science, ML, deep learning, and optimization solutions for businesses",
  
  description_long: "Development of data science, machine learning, deep learning, optimization, and analytics solutions for businesses across multiple industries. Led end-to-end project delivery from design to deployment, working with diverse technologies and business domains.",
  
  // Accomplishments
  accomplishments: (
    (
      text: "Developed and deployed sonar outlier detection system using PyTorch and ONNX, achieving 95% accuracy in production",
      impact: "high",
      quantifiable: true,
      tags: ("deep-learning", "pytorch", "onnx", "tensorrt", "outlier-detection", "python", "deployment"),
      ats_friendly: true,
    ),
    (
      text: "Built project management solution for global engineering consultancy with PowerBI dashboard and Django backend",
      impact: "high",
      quantifiable: false,
      tags: ("django", "powerbi", "sql", "python", "javascript", "nginx", "docker", "cicd"),
      ats_friendly: true,
    ),
    (
      text: "Designed and deployed IoT smart home solution for telecom company on Azure with React frontend",
      impact: "high",
      quantifiable: false,
      tags: ("iot", "azure", "react", "django", "python", "docker", "cicd"),
      ats_friendly: true,
    ),
    (
      text: "Developed product quality forecasting ML solution with complete Azure architecture and CI/CD pipelines",
      impact: "high",
      quantifiable: false,
      tags: ("machine-learning", "azure", "forecasting", "sql", "python", "cicd", "mlops"),
      ats_friendly: true,
    ),
    (
      text: "Built waste management analytics solution reducing collection costs by 25% through route optimization",
      impact: "high",
      quantifiable: true,
      tags: ("analytics", "optimization", "machine-learning", "python", "postgresql", "docker"),
      ats_friendly: true,
    ),
    (
      text: "Developed cashflow forecasting R package for global mining company with integrated SQL pipelines",
      impact: "medium",
      quantifiable: false,
      tags: ("r", "forecasting", "machine-learning", "sql", "docker"),
      ats_friendly: true,
    ),
  ),
  
  // Technologies
  technologies: ("Python", "PyTorch", "ONNX", "TensorRT", "Django", "React", "Azure", "PostgreSQL", "MSSQL", "Docker", "GitLab", "CI/CD", "PowerBI", "R", "NGINX", "FastAPI", "Panels"),
  
  // Tags
  tags: ("data-science", "machine-learning", "deep-learning", "azure", "iot", "optimization", "forecasting", "django", "python"),
  
  // Relevance Scores (1-10 scale)
  relevance: (
    "data-science": 10,
    "ml-engineering": 10,
    "deep-learning": 9,
    "software-engineering": 9,
    "mlops-engineer": 8,
    "data-engineering": 8,
    "applied-scientist": 9,
    "consulting": 8,
    "backend-engineering": 9,
    "research": 6,
  ),
  
  // Optional fields
  employment_type: "full-time",
)
