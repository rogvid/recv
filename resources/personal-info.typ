// resources/personal-info.typ
// Personal information, skills, and contact details

#let personal = (
  // Contact Information
  name: "Rogvi David Arge",
  title: "Data Science & Optimization Consultant",
  phone: "+45 5042 5002",
  email: "argeinnovations@gmail.com",
  linkedin: "https://linkedin.com/in/rogvidarge/en",
  github: "https://github.com/rogvid",
  location: "Copenhagen, Denmark",
  
  // Professional Summary
  summary_short: "Data scientist with 4+ years building ML solutions",
  
  summary_long: [Data Scientist with more than 4 years of experience in agile project development and a passion for deep learning, predictive analytics and optimization. Vast experience in data wrangling, exploratory data analysis, machine learning and data visualization and applying these skills to generate corporate wide improvements.],
  
  // Photo (optional)
  photo_path: "workpicture.png",
  photo_width: "70%",
)

// Technical Skills (from CV.tex sidebar)
#let technical_skills = (
  (name: "Python", proficiency: 5, category: "programming", tags: ("backend", "data-science", "ml")),
  (name: "Machine Learning", proficiency: 5, category: "frameworks", tags: ("ml", "data-science")),
  (name: "Optimization", proficiency: 5, category: "frameworks", tags: ("operations-research", "ml")),
  (name: "OR", proficiency: 5, category: "frameworks", tags: ("operations-research", "optimization")),
  (name: "Data Visualization", proficiency: 5, category: "tools", tags: ("visualization", "data-science")),
  (name: "Data Analysis", proficiency: 5, category: "tools", tags: ("data-science", "analytics")),
  (name: "Modeling", proficiency: 5, category: "frameworks", tags: ("ml", "statistics")),
  (name: "Statistics", proficiency: 5, category: "frameworks", tags: ("data-science", "analytics")),
  (name: "Git", proficiency: 5, category: "tools", tags: ("development", "version-control")),
  (name: "SQL", proficiency: 5, category: "databases", tags: ("data-engineering", "backend")),
  (name: "Deep Learning", proficiency: 4, category: "frameworks", tags: ("ml", "ai")),
  (name: "Flask", proficiency: 4, category: "frameworks", tags: ("backend", "python", "web")),
  (name: "API", proficiency: 4, category: "frameworks", tags: ("backend", "web")),
  (name: "D3", proficiency: 4, category: "tools", tags: ("visualization", "javascript")),
  (name: "HTML", proficiency: 4, category: "programming", tags: ("frontend", "web")),
  (name: "CSS", proficiency: 4, category: "programming", tags: ("frontend", "web")),
  (name: "JavaScript", proficiency: 3, category: "programming", tags: ("frontend", "backend")),
  (name: "C#", proficiency: 3, category: "programming", tags: ("backend")),
  (name: "Docker", proficiency: 3, category: "tools", tags: ("devops", "deployment")),
  (name: "AWS", proficiency: 3, category: "cloud", tags: ("cloud", "devops")),
  (name: "Azure", proficiency: 3, category: "cloud", tags: ("cloud", "devops")),
  (name: "MongoDB", proficiency: 3, category: "databases", tags: ("nosql", "backend")),
  (name: "R", proficiency: 3, category: "programming", tags: ("data-science", "statistics")),
)

// Soft Skills
#let soft_skills = (
  (name: "Problem Solving", proficiency: 5, tags: ("analytical-thinking", "critical-thinking")),
  (name: "Critical Thinking", proficiency: 5, tags: ("analytical-thinking", "problem-solving")),
  (name: "Communication", proficiency: 5, tags: ("presentation", "stakeholder-management")),
  (name: "Adaptability", proficiency: 5, tags: ("flexibility", "learning")),
  (name: "Project Planning", proficiency: 5, tags: ("project-management", "organization")),
  (name: "Decision Making", proficiency: 5, tags: ("leadership", "strategic-thinking")),
  (name: "Scrum", proficiency: 4, tags: ("agile", "project-management")),
)

// Languages
#let languages = (
  (name: "Faroese", level: "Native", proficiency: 5),
  (name: "Danish", level: "Native", proficiency: 5),
  (name: "English", level: "Professional", proficiency: 5),
  (name: "Norwegian", level: "Elementary", proficiency: 3),
  (name: "Swedish", level: "Elementary", proficiency: 3),
  (name: "French", level: "Elementary", proficiency: 2),
)
