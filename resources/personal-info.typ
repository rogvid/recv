// resources/personal-info.typ
// Personal information, skills, and contact details

#let personal = (
  // Contact Information
  name: "Rogvi David Arge",
  title: "Head of Data Science",
  birth_date: "26-07-1988",
  phone: "+298 216 017",
  email: "rogvidarge@gmail.com",
  linkedin: "linkedin.com/in/rogvidarge/en",
  github: "github.com/rogvid",
  location: "Torshavn, Faroe Islands",
  
  // Professional Summary
  summary_short: "Data Scientist, AI Engineer, Project Manager, and Team Lead",
  
  summary_long: [AI engineer and hands-on builder with a MSc in computational physics and a passion for building applications that make a difference. I combine deep knowledge of machine learning and python development with practical experience building workflow-based and agentic AI applications. Experienced in both developing novel solutions and leading teams to deliver them at scale.],
  
  
  // Photo (optional)
  photo_path: "workpicture.png",
  photo_width: "70%",
)

// Technical Skills (from CV.tex sidebar)
#let technical_skills = (
  (name: "Python", proficiency: 5, category: "programming", tags: ("backend", "data-science", "ml")),
  (name: "Machine Learning", proficiency: 5, category: "frameworks", tags: ("ml", "data-science")),
  (name: "Linux", proficiency: 5, category: "tools", tags: ("devops", "development")),
  (name: "Optimization", proficiency: 5, category: "frameworks", tags: ("operations-research", "ml")),
  (name: "Generative AI", proficiency: 5, category: "frameworks", tags: ("ai", "llm")),
  (name: "Data Visualization", proficiency: 5, category: "tools", tags: ("visualization", "data-science")),
  (name: "Git", proficiency: 5, category: "tools", tags: ("development", "version-control")),
  (name: "SQL", proficiency: 5, category: "databases", tags: ("data-engineering", "backend")),
  (name: "Docker", proficiency: 4, category: "tools", tags: ("devops", "deployment")),
  (name: "MLOps", proficiency: 4, category: "frameworks", tags: ("ml", "devops")),
  (name: "Azure", proficiency: 4, category: "cloud", tags: ("cloud", "devops")),
  (name: "FastAPI", proficiency: 4, category: "frameworks", tags: ("backend", "python", "web")),
  (name: "PyTorch", proficiency: 4, category: "frameworks", tags: ("ml", "deep-learning")),
  (name: "Ansible", proficiency: 3, category: "tools", tags: ("devops", "automation")),
  (name: "CI/CD", proficiency: 3, category: "tools", tags: ("devops", "automation")),
)

// Soft Skills (matching reference exactly)
#let soft_skills = (
  (name: "Problem Solving", proficiency: 5, tags: ("analytical-thinking", "critical-thinking")),
  (name: "Management", proficiency: 5, tags: ("leadership", "organization")),
  (name: "Team Leadership", proficiency: 5, tags: ("leadership", "team-management")),
  (name: "Communication", proficiency: 5, tags: ("presentation", "stakeholder-management")),
  (name: "Critical Thinking", proficiency: 5, tags: ("analytical-thinking", "problem-solving")),
  (name: "Adaptability", proficiency: 5, tags: ("flexibility", "learning")),
  (name: "Project Planning", proficiency: 4, tags: ("project-management", "organization")),
)

// Favorite Tools (for FAVORITE TOOLS section - matches reference)
#let favorite_tools = (
  "Python", "MLFlow", "Cursor",
  "SQLModels", "Minio", "Git", 
  "Pydantic-AI", "LangGraph",
  "Linux", "Streamlit", "Docker",
  "FastAPI", "uv", "PostgreSQL",
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
