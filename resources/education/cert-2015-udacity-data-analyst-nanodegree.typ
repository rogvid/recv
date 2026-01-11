// resources/education/cert-2015-udacity-data-analyst-nanodegree.typ
// Data Analyst Nanodegree - Udacity

#let certificate = (
  type: "certificate",
  name: "Data Analyst Nanodegree",
  provider: "Udacity",
  platform: "Udacity",
  completion_date: "Dec. 2015",
  
  // Description
  description: "Comprehensive data analysis program covering Python, SQL, statistics, and visualization",
  
  // Projects (from ATS_CV.tex)
  projects: (
    "Exploratory Data Analysis of NYC Subway Data",
    "Data Wrangling with OpenStreetMap",
    "A/B Testing for Website Optimization",
    "Machine Learning for Enron Email Dataset",
  ),
  
  // Skills Learned
  skills: (
    "Python",
    "SQL",
    "Statistics",
    "Data Visualization",
    "Pandas",
    "NumPy",
    "Data Wrangling",
    "Exploratory Data Analysis",
    "A/B Testing",
  ),
  
  // Tags
  tags: ("data-analysis", "certification", "udacity", "python", "sql", "statistics", "nanodegree", "data-science", "online-course"),
  
  // Relevance Scores (1-10 scale)
  relevance: (
    "data-science": 8,
    "data-analyst": 10,
    "ml-engineering": 6,
    "software-engineering": 5,
    "data-engineering": 7,
    "business-analyst": 8,
    "applied-scientist": 6,
    "research": 5,
    "consulting": 6,
  ),
  
  // Optional fields
  credential_url: none,
  duration_hours: 200,
)
