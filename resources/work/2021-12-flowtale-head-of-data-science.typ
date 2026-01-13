// resources/work/2021-12-flowtale-head-of-data-science.typ
// Head of Data Science at Flowtale

#let job = (
  // Basic Information
  position: "Head of Data Science",
  company: "Flowtale",
  location: "Copenhagen, Denmark",
  start_date: "Sep. 2021",
  end_date: "Present",
  current: true,
  
  // Descriptions
  description: "Leading data science team and developing AI solutions for enterprise clients",
  
  description_long: "Responsible for Flowtale's data scientists and data science solutions. Lead development of generative AI applications, MLOps infrastructure, and end-to-end ML solutions across various industries. Manage team hiring, mentoring, and strategic data science initiatives.",
  
  // Accomplishments
  accomplishments: (
    (
      text: "Led development of generative AI applications for chat and workflow automation using Azure OpenAI and LangChain",
      impact: "high",
      quantifiable: false,
      tags: ("generative-ai", "llm", "azure", "openai", "python", "fastapi", "langchain"),
      ats_friendly: true,
    ),
    (
      text: "Built in-house MLOps infrastructure with open-source tools (MLFlow, DVC, Hydra, CVAT) reducing model deployment time by 60%",
      impact: "high",
      quantifiable: true,
      tags: ("mlops", "infrastructure", "mlflow", "dvc", "hydra", "cvat", "docker", "python"),
      ats_friendly: true,
    ),
    (
      text: "Developed server provisioning automation with Ansible playbooks for data science infrastructure deployment",
      impact: "medium",
      quantifiable: false,
      tags: ("ansible", "devops", "infrastructure", "automation", "jenkins", "docker"),
      ats_friendly: true,
    ),
    (
      text: "Led deep learning model development for timeseries classification achieving 92% accuracy on sonar event detection",
      impact: "high",
      quantifiable: true,
      tags: ("deep-learning", "pytorch", "timeseries", "classification", "python"),
      ats_friendly: true,
    ),
    (
      text: "Managed hiring and onboarding of data scientists and data engineers, growing team from 3 to 8 members",
      impact: "high",
      quantifiable: true,
      tags: ("leadership", "hiring", "team-management", "mentoring"),
      ats_friendly: true,
    ),
    (
      text: "Provided data maturity consulting to enterprise clients, developing roadmaps for organizational improvement",
      impact: "medium",
      quantifiable: false,
      tags: ("consulting", "strategy", "data-maturity", "stakeholder-management"),
      ats_friendly: true,
    ),
    (
      text: "Developed custom labeling tools for specialized data types using Python and Panels",
      impact: "medium",
      quantifiable: false,
      tags: ("python", "panels", "sqlalchemy", "data-labeling", "tools-development"),
      ats_friendly: true,
    ),
  ),
  
  // Technologies
  technologies: ("Python", "Azure", "OpenAI", "FastAPI", "PostgreSQL", "Docker", "MLFlow", "DVC", "Hydra", "CVAT", "PyTorch", "Ansible", "Jenkins", "GitLab", "Pydantic", "SQLAlchemy", "Panels", "Dask"),
  
  // Tags
  tags: ("leadership", "generative-ai", "llm", "mlops", "deep-learning", "team-management", "consulting", "infrastructure", "python", "azure"),
  
  // Relevance Scores (1-10 scale)
  relevance: (
    "leadership": 10,
    "data-science": 10,
    "ml-engineering": 10,
    "mlops-engineer": 10,
    "generative-ai": 10,
    "applied-scientist": 9,
    "consulting": 9,
    "software-engineering": 8,
    "data-engineering": 7,
    "research": 6,
  ),
  
  // Optional fields
  employment_type: "full-time",
)
