// resources/work/2018-12-dfds-data-science-consultant.typ
// Data Science Consultant at DFDS A/S

#let job = (
  // Basic Information
  position: "Data Science Consultant",
  company: "DFDS A/S",
  location: "Copenhagen, Denmark",
  start_date: "Dec. 2018",
  end_date: "May 2019",
  current: false,
  
  // Descriptions
  description: "Spearheaded a paradigm shift of the transportation & logistics industry",
  
  description_long: "Led data science initiatives to revolutionize transportation planning through predictive analytics and optimization algorithms. Collaborated with cross-functional teams to deploy machine learning models that significantly improved operational efficiency and planning capabilities in the maritime logistics industry.",
  
  // Accomplishments
  accomplishments: (
    (
      text: "Reduced RMSE of prediction algorithm by 20% by helping to implement a number of scalable machine learning models",
      impact: "high",
      quantifiable: true,
      tags: ("machine-learning", "python", "performance-improvement", "predictive-analytics", "scikit-learn"),
      ats_friendly: true,
    ),
    (
      text: "Enabled a completely new transportation planning paradigm by implementing dynamic optimization tool that visualized optimal plan in real time",
      impact: "high",
      quantifiable: false,
      tags: ("optimization", "visualization", "innovation", "operations-research", "d3", "flask"),
      ats_friendly: true,
    ),
    (
      text: "Spearheaded a paradigm shift of the transportation & logistics industry in successful data science project over a period of 5 months",
      impact: "high",
      quantifiable: true,
      tags: ("project-leadership", "transportation", "logistics", "consulting"),
      ats_friendly: true,
    ),
    (
      text: "Collaborated with cross-functional teams including operations, IT, and business stakeholders to ensure solution alignment",
      impact: "medium",
      quantifiable: false,
      tags: ("collaboration", "stakeholder-management", "cross-functional", "communication"),
      ats_friendly: true,
    ),
  ),
  
  // Technologies
  technologies: ("Python", "Scikit-learn", "Pandas", "OR-Tools", "Flask", "D3.js", "Docker", "Git"),
  
  // Tags
  tags: ("data-science", "machine-learning", "optimization", "transportation", "logistics", "consulting", "operations-research"),
  
  // Relevance Scores (1-10 scale)
  relevance: (
    "data-science": 10,
    "ml-engineering": 9,
    "consulting": 10,
    "optimization": 10,
    "applied-scientist": 9,
    "software-engineering": 7,
    "data-engineering": 7,
    "research": 6,
    "data-analyst": 8,
    "mlops-engineer": 6,
  ),
  
  // Optional fields
  employment_type: "contract",
)
