// resources/education/cert-2019-aws-cloud-practitioner.typ
// AWS Cloud Practitioner - Amazon Web Services

#let certificate = (
  type: "certificate",
  name: "AWS Cloud Practitioner",
  provider: "Amazon Web Services (AWS)",
  platform: "AWS",
  completion_date: "Nov. 2019",
  
  // Description
  description: "Basic certification in Amazon Web Services covering cloud concepts, architecture, and core services",
  
  // Skills Learned
  skills: (
    "AWS Cloud Fundamentals",
    "Cloud Architecture",
    "AWS Services (EC2, S3, RDS, Lambda)",
    "Cloud Security",
    "AWS Pricing and Billing",
    "Cloud Deployment Models",
  ),
  
  // Tags
  tags: ("aws", "cloud", "certification", "infrastructure", "cloud-computing", "devops"),
  
  // Relevance Scores (1-10 scale)
  relevance: (
    "cloud-engineer": 10,
    "mlops-engineer": 9,
    "data-engineering": 8,
    "software-engineering": 7,
    "ml-engineering": 7,
    "data-science": 6,
    "devops-engineer": 9,
    "backend-engineering": 8,
  ),
  
  // Optional fields
  credential_url: none,
  duration_hours: 40,
  exam_based: true,
)
