# Ticket 001 - Tag Taxonomy

## Overview

This document defines the standardized tag system used throughout all CV resources. Consistent tagging enables effective filtering, relevance scoring, and AI-powered tailoring.

## Tag Naming Conventions

**Rules:**
1. All lowercase
2. Use hyphens for multi-word tags: `machine-learning` not `machine_learning` or `machineLearning`
3. Prefer specific over generic: `deep-learning` over `ai`
4. Use common abbreviations when widely understood: `ml` for machine learning, `nlp` for natural language processing
5. Maximum tag length: 30 characters
6. Avoid special characters except hyphens

---

## 1. Technology Tags

### Programming Languages
```
python
r
sql
java
javascript
typescript
c++
c
scala
julia
bash
matlab
```

### Machine Learning & AI
```
ml
machine-learning
deep-learning
neural-networks
nlp
natural-language-processing
computer-vision
reinforcement-learning
supervised-learning
unsupervised-learning
feature-engineering
model-deployment
mlops
```

### ML Frameworks & Libraries
```
tensorflow
pytorch
keras
scikit-learn
xgboost
lightgbm
catboost
huggingface
opencv
spacy
nltk
```

### Data Science & Analytics
```
data-science
data-analysis
statistics
statistical-modeling
time-series
forecasting
predictive-modeling
exploratory-data-analysis
eda
hypothesis-testing
ab-testing
causal-inference
```

### Data Engineering
```
data-engineering
etl
data-pipeline
data-warehouse
big-data
spark
hadoop
airflow
kafka
databricks
dbt
```

### Databases
```
sql
postgresql
mysql
mongodb
redis
elasticsearch
cassandra
neo4j
graph-databases
```

### Cloud & DevOps
```
aws
azure
gcp
docker
kubernetes
ci-cd
terraform
ansible
jenkins
github-actions
```

### Web & APIs
```
rest-api
graphql
fastapi
flask
django
express
react
vue
html
css
```

### Tools & Platforms
```
git
jupyter
vscode
pycharm
tableau
power-bi
excel
jira
confluence
slack
```

---

## 2. Domain Tags

### Industries
```
finance
banking
fintech
healthcare
pharma
biotech
retail
e-commerce
transportation
logistics
maritime
energy
telecommunications
telecom
education
government
insurance
real-estate
manufacturing
automotive
aerospace
```

### Application Domains
```
recommendation-systems
fraud-detection
risk-assessment
credit-scoring
customer-segmentation
churn-prediction
demand-forecasting
price-optimization
supply-chain
inventory-management
quality-control
predictive-maintenance
sentiment-analysis
chatbots
document-processing
image-classification
object-detection
speech-recognition
translation
```

---

## 3. Activity & Role Tags

### Core Activities
```
research
development
consulting
teaching
mentoring
leadership
architecture
design
implementation
testing
debugging
optimization
deployment
maintenance
documentation
presentation
reporting
```

### Research Activities
```
academic-research
applied-research
literature-review
experimentation
prototyping
peer-review
publishing
conference-presentation
```

### Development Activities
```
backend
frontend
full-stack
api-development
database-design
algorithm-design
system-design
code-review
refactoring
performance-tuning
```

### Data Activities
```
data-collection
data-cleaning
data-preprocessing
data-validation
data-visualization
feature-engineering
model-training
model-evaluation
model-deployment
model-monitoring
```

### Business Activities
```
stakeholder-management
requirements-gathering
business-analysis
product-management
project-management
agile
scrum
kanban
roadmap-planning
strategy
```

---

## 4. Impact Tags

### Business Impact
```
revenue-growth
cost-reduction
efficiency-improvement
performance-improvement
quality-improvement
time-savings
process-automation
scalability
reliability
user-experience
customer-satisfaction
```

### Technical Impact
```
technical-debt-reduction
architecture-improvement
code-quality
test-coverage
documentation-improvement
security-enhancement
accessibility
maintainability
```

### Scale Impact
```
high-volume
real-time
distributed-systems
microservices
enterprise-scale
production-ready
```

---

## 5. Soft Skill Tags

### Communication
```
communication
presentation
technical-writing
documentation
stakeholder-communication
cross-functional
client-facing
public-speaking
```

### Collaboration
```
teamwork
collaboration
mentoring
teaching
knowledge-sharing
code-review
pair-programming
cross-team
```

### Leadership
```
leadership
team-lead
project-lead
mentorship
hiring
onboarding
training
strategic-planning
```

### Problem Solving
```
problem-solving
critical-thinking
analytical-thinking
creativity
innovation
troubleshooting
debugging
root-cause-analysis
```

### Work Style
```
agile
self-directed
independent
proactive
detail-oriented
deadline-driven
adaptable
fast-learner
```

---

## 6. Certification & Education Tags

### Certification Types
```
certification
online-course
specialization
nanodegree
bootcamp
workshop
seminar
conference
```

### Certification Providers
```
coursera
udacity
edx
datacamp
kaggle
aws-certified
google-certified
microsoft-certified
deeplearning-ai
fast-ai
```

### Academic Tags
```
academic
degree
masters
bachelors
phd
physics
mathematics
computer-science
statistics
thesis
dissertation
publication
```

---

## 7. Job Type Tags (for relevance scoring)

These tags are used as keys in the `relevance` dictionary:

```
data-science
ml-engineering
machine-learning-engineering
data-engineering
software-engineering
backend-engineering
frontend-engineering
full-stack-engineering
research-scientist
applied-scientist
data-analyst
business-analyst
ml-researcher
ai-researcher
consulting
technical-consulting
product-management
engineering-management
devops-engineer
mlops-engineer
data-architect
solutions-architect
```

---

## 8. Special Tags

### Format & Compatibility
```
ats-friendly
quantifiable
visual
compact
detailed
```

### Prioritization
```
featured
highlight
core-competency
differentiator
```

### Time Period
```
recent
current
legacy
historical
```

---

## 9. Tag Usage Guidelines

### For Work Experiences

**Required tag categories:**
1. At least 2-3 technology tags
2. At least 1 domain tag
3. At least 2-3 activity tags

**Example:**
```typst
tags: ("data-science", "ml", "python", "consulting", "transportation", "optimization"),
```

### For Accomplishments

**Required tag categories:**
1. At least 1-2 technology tags (what was used)
2. At least 1 activity tag (what was done)
3. Optionally 1 impact tag (what was achieved)

**Example:**
```typst
tags: ("ml", "python", "forecasting", "optimization", "performance-improvement"),
```

### For Education

**Required tag categories:**
1. Field of study tags
2. Academic level tags
3. Related skill tags

**Example:**
```typst
tags: ("physics", "academic", "research", "ml", "statistics", "thesis"),
```

### For Certificates

**Required tag categories:**
1. Subject area tags
2. Certification type tags
3. Related technology tags

**Example:**
```typst
tags: ("ml", "deep-learning", "certification", "coursera", "tensorflow", "neural-networks"),
```

### For Skills (in personal-info.typ)

**Required:**
1. Category tag (programming, tools, frameworks, databases)
2. Related domain tags

**Example:**
```typst
tags: ("programming", "backend", "data-science", "ml"),
```

---

## 10. Tag Combination Strategies

### For Filtering by Job Type

**Data Science Role:**
```
required_tags: ("data-science", "ml", "python", "statistics")
```

**ML Engineering Role:**
```
required_tags: ("ml", "deep-learning", "model-deployment", "mlops")
```

**Data Engineering Role:**
```
required_tags: ("data-engineering", "etl", "data-pipeline", "sql")
```

**Research Scientist Role:**
```
required_tags: ("research", "ml", "academic-research", "publishing")
```

**Consulting Role:**
```
required_tags: ("consulting", "stakeholder-management", "communication", "client-facing")
```

### For Highlighting Specific Domains

**Healthcare Focus:**
```
required_tags: ("healthcare", "ml", "data-science")
```

**Finance Focus:**
```
required_tags: ("finance", "risk-assessment", "fraud-detection")
```

**Transportation/Logistics Focus:**
```
required_tags: ("transportation", "logistics", "optimization", "forecasting")
```

---

## 11. Tag Expansion Strategy

**When to add new tags:**
1. New technology becomes relevant to your work
2. New domain/industry experience added
3. New certification or skill area acquired
4. Emerging job types require new categorization

**Process for adding tags:**
1. Check if existing tag can be used (avoid redundancy)
2. Follow naming conventions
3. Add to appropriate category in this document
4. Update existing resources if tag applies retroactively
5. Document in tag changelog below

**Tag Changelog:**
- 2026-01-11: Initial taxonomy created with 200+ tags

---

## 12. Tag Cross-Reference

### Common Tag Combinations

**Python Data Science:**
`python`, `data-science`, `pandas`, `scikit-learn`, `jupyter`

**Deep Learning:**
`deep-learning`, `neural-networks`, `tensorflow` or `pytorch`, `ml`

**MLOps:**
`mlops`, `model-deployment`, `docker`, `kubernetes`, `ci-cd`, `monitoring`

**Big Data:**
`big-data`, `spark`, `hadoop`, `data-engineering`, `distributed-systems`

**Cloud ML:**
`ml`, `aws` or `azure` or `gcp`, `cloud`, `model-deployment`

**Research:**
`research`, `academic-research`, `experimentation`, `publishing`, `peer-review`

---

## 13. Validation Checklist

**Tag validation rules:**
- [ ] All lowercase
- [ ] Hyphens for multi-word tags
- [ ] No special characters except hyphens
- [ ] Maximum 30 characters
- [ ] Exists in this taxonomy document
- [ ] Not redundant with existing tags
- [ ] Specific enough to be useful for filtering

---

## Completion Status

- [x] Technology tags defined (100+ tags)
- [x] Domain tags defined (40+ tags)
- [x] Activity tags defined (50+ tags)
- [x] Impact tags defined (20+ tags)
- [x] Soft skill tags defined (30+ tags)
- [x] Certification tags defined (20+ tags)
- [x] Job type tags defined (20+ tags)
- [x] Usage guidelines documented
- [x] Tag combination strategies provided
- [x] Validation rules specified

**Status:** COMPLETE
**Next Step:** Create relevance scoring guide (001-relevance-scoring.md)
