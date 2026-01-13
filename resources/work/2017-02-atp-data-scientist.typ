// resources/work/2017-02-atp-data-scientist.typ
// Data Scientist at ATP

#let job = (
  // Basic Information
  position: "Data Scientist",
  company: "ATP",
  location: "Hillerød, Denmark",
  start_date: "Feb. 2017",
  end_date: "Dec. 2018",
  current: false,
  
  // Descriptions
  description: "Built predictive models and data infrastructure for Denmark's largest pension fund",
  
  description_long: "Developed and deployed machine learning models and data infrastructure solutions for ATP, Denmark's largest pension fund. Focused on predictive modeling, data visualization, and business intelligence to support strategic decision-making and operational efficiency.",
  
  // Accomplishments
  accomplishments: (
    (
      text: "Developed predictive models forecasting pension member behavior, improving strategic planning accuracy by 15%",
      impact: "high",
      quantifiable: true,
      tags: ("machine-learning", "predictive-modeling", "python", "forecasting"),
      ats_friendly: true,
    ),
    (
      text: "Built automated data pipeline processing 100K+ member records daily, reducing manual processing time by 80%",
      impact: "high",
      quantifiable: true,
      tags: ("data-engineering", "automation", "python", "etl", "efficiency-improvement"),
      ats_friendly: true,
    ),
    (
      text: "Created interactive dashboards for executive decision-making using D3.js and Flask, enabling real-time insights",
      impact: "medium",
      quantifiable: false,
      tags: ("data-visualization", "d3", "flask", "dashboarding", "business-intelligence"),
      ats_friendly: true,
    ),
    (
      text: "Implemented A/B testing framework for product optimization, driving data-driven product decisions",
      impact: "medium",
      quantifiable: false,
      tags: ("ab-testing", "experimentation", "product-analytics", "statistics"),
      ats_friendly: true,
    ),
    (
      text: "Collaborated with actuarial team to integrate ML predictions into pension calculation models",
      impact: "medium",
      quantifiable: false,
      tags: ("cross-functional", "collaboration", "finance", "domain-expertise"),
      ats_friendly: true,
    ),
  ),
  
  // Technologies
  technologies: ("Python", "Scikit-learn", "Pandas", "SQL", "Flask", "D3.js", "Git", "MongoDB"),
  
  // Tags
  tags: ("data-science", "machine-learning", "finance", "pension", "predictive-modeling", "data-visualization", "business-intelligence"),
  
  // Relevance Scores (1-10 scale)
  relevance: (
    "data-science": 10,
    "ml-engineering": 8,
    "data-engineering": 8,
    "data-analyst": 9,
    "software-engineering": 7,
    "consulting": 6,
    "applied-scientist": 8,
    "research": 5,
    "mlops-engineer": 6,
    "business-analyst": 8,
  ),
  
  // Optional fields
  employment_type: "full-time",
)
