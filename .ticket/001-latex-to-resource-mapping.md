# Ticket 001 - LaTeX to Resource Mapping Guide

## Overview

This document explains how to transform content from the existing LaTeX CVs (`CV.tex` and `ATS_CV.tex`) into the new Typst resource-based system.

## Mapping Philosophy

**Old System (LaTeX):**
- Monolithic files with all content inline
- Formatting mixed with content
- Difficult to reuse content across CVs
- Manual tailoring by commenting/uncommenting

**New System (Typst Resources):**
- Content separated into individual resource files
- Metadata-rich (tags, relevance scores, impact levels)
- Automatic tailoring based on filters
- Formatting defined in templates, not content

---

## 1. Personal Information Mapping

### LaTeX Source (`CV.tex`)

```latex
\begin{center}
  {\huge\bfseries Rogvid Arge} \\[0.2cm]
  {\Large Data Scientist \& Machine Learning Engineer} \\[0.3cm]
  {\small +45 5042 5002 \quad argeinnovations@gmail.com} \\
  {\small \href{https://linkedin.com/in/rogvidarge/en}{LinkedIn} \quad \href{https://github.com/rogvid}{GitHub}}
\end{center}
```

### Typst Resource (`resources/personal-info.typ`)

```typst
#let personal = (
  name: "Rogvid Arge",
  title: "Data Scientist & Machine Learning Engineer",
  email: "argeinnovations@gmail.com",
  phone: "+45 5042 5002",
  location: "Copenhagen, Denmark",
  linkedin: "https://linkedin.com/in/rogvidarge/en",
  github: "https://github.com/rogvid",
  website: none,
  
  summary_short: "Data scientist with 5+ years building ML solutions",
  summary_long: "Experienced data scientist and ML engineer specializing in production ML systems, deep learning, and business analytics. Proven track record of delivering measurable business impact through data-driven solutions.",
  
  photo_path: "workpicture.png",
  photo_width: "70%",
)
```

**Key Changes:**
- Structured dictionary instead of LaTeX commands
- Separated formatting from content
- Added metadata fields (summary, photo)
- Consistent field naming

---

## 2. Work Experience Mapping

### LaTeX Source (`CV.tex`)

```latex
\section{Experience}

\textline{Data Science Consultant}{DFDS A/S}{Dec. 2018 - May 2019}
\textit{\small Developed machine learning models for optimizing maritime fleet operations}

\begin{itemize}[left=0pt]
  \item Reduced RMSE by 20\% in demand forecasting model using ensemble methods
  \item Deployed automated data pipeline processing 500K+ records daily
  \item Presented findings to C-level executives
\end{itemize}
```

### Typst Resource (`resources/work/2018-12-dfds-data-science-consultant.typ`)

```typst
#let job = (
  // BASIC INFO
  position: "Data Science Consultant",
  company: "DFDS A/S",
  start_date: "Dec. 2018",
  end_date: "May 2019",
  
  // DESCRIPTIONS
  description: "Developed ML models for optimizing maritime fleet operations",
  description_long: "Contracted to develop machine learning solutions for optimizing maritime fleet operations. Led data pipeline development and model deployment for route optimization and demand forecasting systems.",
  
  // ACCOMPLISHMENTS
  accomplishments: (
    (
      text: "Reduced RMSE by 20% in demand forecasting model using ensemble methods",
      impact: "high",
      quantifiable: true,
      tags: ("ml", "python", "forecasting", "optimization"),
      ats_friendly: true,
    ),
    (
      text: "Deployed automated data pipeline processing 500K+ records daily",
      impact: "high",
      quantifiable: true,
      tags: ("python", "data-engineering", "automation"),
      ats_friendly: true,
    ),
    (
      text: "Presented findings to C-level executives, influencing strategic decisions",
      impact: "medium",
      quantifiable: false,
      tags: ("communication", "leadership", "consulting"),
      ats_friendly: true,
    ),
  ),
  
  // METADATA
  technologies: ("Python", "Scikit-learn", "Pandas", "SQL", "Docker"),
  tags: ("data-science", "ml", "consulting", "transportation", "logistics"),
  
  // RELEVANCE
  relevance: (
    "data-science": 10,
    "ml-engineering": 9,
    "software-engineering": 7,
    "consulting": 10,
    "research": 6,
  ),
  
  // OPTIONAL
  location: "Copenhagen, Denmark",
  employment_type: "contract",
)
```

**Key Changes:**
- Each accomplishment becomes a structured dictionary
- Added `impact` level for filtering
- Added `tags` for each accomplishment
- Added `quantifiable` flag
- Added `relevance` scores for multiple job types
- Separated short/long descriptions
- Extracted technology list

**Transformation Steps:**
1. Extract position, company, dates from `\textline` command
2. Extract italicized description text
3. Convert each `\item` to an accomplishment dictionary
4. Analyze each accomplishment for:
   - Impact level (high/medium/low based on metrics, scope)
   - Quantifiability (does it include numbers/metrics?)
   - Relevant tags (technologies, activities used)
5. Infer technology list from accomplishment text
6. Assign relevance scores based on role type

---

## 3. Education Mapping

### LaTeX Source (`CV.tex`)

```latex
\section{Education}

\textline{M.Sc. in Physics}{University of Southern Denmark}{June 2017}
\textit{\small Thesis: Machine Learning Applications in Quantum Systems}

\textline{B.Sc. in Physics}{University of Southern Denmark}{June 2013}
```

### Typst Resources

**File 1:** `resources/education/degree-2017-university-of-southern-denmark-msc-physics.typ`

```typst
#let degree = (
  degree_type: "M.Sc.",
  field: "Physics",
  institution: "University of Southern Denmark",
  graduation_date: "June 2017",
  
  description: "Specialized in computational physics and machine learning applications",
  thesis_title: "Machine Learning Applications in Quantum Systems",
  
  relevant_courses: (
    "Machine Learning",
    "Statistical Methods",
    "Computational Physics",
  ),
  
  tags: ("physics", "academic", "research", "ml", "statistics", "masters", "thesis"),
  
  relevance: (
    "data-science": 9,
    "ml-engineering": 8,
    "research": 10,
    "software-engineering": 6,
    "ml-researcher": 9,
    "applied-scientist": 9,
  ),
  
  accomplishments: (
    (
      text: "Published thesis on ML applications in quantum systems",
      impact: "high",
      quantifiable: false,
      tags: ("research", "ml", "publishing"),
      ats_friendly: true,
    ),
  ),
)
```

**File 2:** `resources/education/degree-2013-university-of-southern-denmark-bsc-physics.typ`

```typst
#let degree = (
  degree_type: "B.Sc.",
  field: "Physics",
  institution: "University of Southern Denmark",
  graduation_date: "June 2013",
  
  description: "Foundation in physics, mathematics, and computational methods",
  
  tags: ("physics", "academic", "bachelors", "mathematics"),
  
  relevance: (
    "data-science": 7,
    "ml-engineering": 6,
    "research": 8,
    "software-engineering": 5,
  ),
)
```

**Transformation Steps:**
1. Extract degree type, field, institution, date from `\textline`
2. Extract thesis title if present (from `\textit` line)
3. Create separate file for each degree
4. Add relevant metadata (tags, relevance scores)
5. Optionally add accomplishments for significant achievements
6. List relevant coursework if applicable

---

## 4. Certifications Mapping

### LaTeX Source (`CV.tex`)

```latex
\section{Certifications}

\textline{Deep Learning Specialization}{deeplearning.ai}{Oct. 2017}
\textit{\small 5-course specialization covering neural networks, CNNs, RNNs, and deployment}

\textline{Social Network Analysis}{Coursera - UC San Diego}{Aug. 2016}

\textline{Data Analyst Nanodegree}{Udacity}{Dec. 2015}
```

### Typst Resources

**File 1:** `resources/education/cert-2017-deeplearning-ai-deep-learning-specialization.typ`

```typst
#let certificate = (
  name: "Deep Learning Specialization",
  provider: "deeplearning.ai",
  completion_date: "Oct. 2017",
  
  description: "5-course specialization covering neural networks, CNNs, RNNs, and deployment strategies",
  
  skills: ("Deep Learning", "TensorFlow", "CNNs", "RNNs", "Neural Networks"),
  
  tags: ("ml", "deep-learning", "certification", "coursera", "tensorflow", "neural-networks"),
  
  relevance: (
    "ml-engineering": 10,
    "data-science": 9,
    "ml-researcher": 7,
    "applied-scientist": 9,
    "software-engineering": 6,
  ),
  
  credential_url: none,
  duration_hours: 120,
)
```

**File 2:** `resources/education/cert-2016-coursera-social-network-analysis.typ`

```typst
#let certificate = (
  name: "Social Network Analysis",
  provider: "Coursera - UC San Diego",
  completion_date: "Aug. 2016",
  
  description: "Graph theory, network analysis algorithms, and social network modeling",
  
  skills: ("Graph Theory", "Network Analysis", "Python", "NetworkX"),
  
  tags: ("graph-analysis", "networks", "certification", "coursera", "python"),
  
  relevance: (
    "data-science": 7,
    "ml-engineering": 5,
    "research": 8,
    "data-analyst": 6,
  ),
)
```

**File 3:** `resources/education/cert-2015-udacity-data-analyst-nanodegree.typ`

```typst
#let certificate = (
  name: "Data Analyst Nanodegree",
  provider: "Udacity",
  completion_date: "Dec. 2015",
  
  description: "Comprehensive data analysis program covering Python, SQL, statistics, and visualization",
  
  skills: ("Python", "SQL", "Statistics", "Data Visualization", "Pandas"),
  
  tags: ("data-analysis", "certification", "udacity", "python", "sql", "statistics"),
  
  relevance: (
    "data-science": 8,
    "data-analyst": 10,
    "ml-engineering": 6,
    "software-engineering": 5,
  ),
)
```

**Transformation Steps:**
1. Extract certification name, provider, date from `\textline`
2. Extract description from `\textit` line (if present)
3. Create separate file for each certificate
4. Infer skills taught from description
5. Assign appropriate tags
6. Score relevance for different job types

---

## 5. Skills Mapping

### LaTeX Source (`CV.tex`)

```latex
\section{Technical Skills}

\begin{tabular}{l l}
  Python & \skillbar{5}{0} \\
  R & \skillbar{4}{1} \\
  SQL & \skillbar{4}{1} \\
  TensorFlow & \skillbar{4}{1} \\
  ...
\end{tabular}

\section{Soft Skills}

\begin{itemize}
  \item Leadership
  \item Communication
  \item Problem Solving
  ...
\end{itemize}
```

### Typst Resource (`resources/personal-info.typ`)

```typst
#let technical_skills = (
  (
    name: "Python",
    proficiency: 5,
    category: "programming",
    tags: ("backend", "data-science", "ml"),
  ),
  (
    name: "R",
    proficiency: 4,
    category: "programming",
    tags: ("data-analysis", "statistics"),
  ),
  (
    name: "SQL",
    proficiency: 4,
    category: "databases",
    tags: ("data-engineering", "backend"),
  ),
  (
    name: "TensorFlow",
    proficiency: 4,
    category: "frameworks",
    tags: ("ml", "deep-learning"),
  ),
  // ... more skills
)

#let soft_skills = (
  (
    name: "Leadership",
    proficiency: 4,
    tags: ("management", "teamwork"),
  ),
  (
    name: "Communication",
    proficiency: 5,
    tags: ("presentation", "stakeholder-management"),
  ),
  (
    name: "Problem Solving",
    proficiency: 5,
    tags: ("analytical-thinking", "critical-thinking"),
  ),
  // ... more skills
)

#let languages = (
  (
    name: "Danish",
    level: "Native",
    proficiency: 5,
  ),
  (
    name: "English",
    level: "Fluent",
    proficiency: 5,
  ),
  (
    name: "Faroese",
    level: "Native",
    proficiency: 5,
  ),
  // ... more languages
)
```

**Transformation Steps:**
1. Extract skill name and proficiency from `\skillbar{filled}{empty}`
2. Calculate proficiency: filled / (filled + empty) * 5
3. Categorize skills (programming, frameworks, tools, databases)
4. Assign tags based on skill domain
5. Soft skills: convert bullet points to structured format
6. Assign proficiency levels to soft skills (based on emphasis in CV)

---

## 6. Summary/Profile Mapping

### LaTeX Source

Often implicit or in cover letter. If present:

```latex
\section{Professional Summary}
Experienced data scientist with 5+ years building production ML systems...
```

### Typst Resource (`resources/personal-info.typ`)

```typst
#let personal = (
  // ... other fields
  
  summary_short: "Data scientist with 5+ years building ML solutions",
  
  summary_long: "Experienced data scientist and ML engineer specializing in production ML systems, deep learning, and business analytics. Proven track record of delivering measurable business impact through data-driven solutions in transportation, finance, and healthcare sectors.",
)
```

**Transformation Steps:**
1. Extract existing summary if present
2. Write short version (50-100 chars) for compact layouts
3. Write long version (200-400 chars) for full layouts
4. Focus on: years of experience, key specialties, industries

---

## 7. Complete Transformation Workflow

### Step 1: Inventory Content
Use the existing `001-content-inventory.md` as reference.

### Step 2: Create Personal Info
1. Extract name, title, contact info
2. Write summary (short & long versions)
3. Map skills (technical, soft, languages)
4. Create `resources/personal-info.typ`

### Step 3: Create Work Experience Resources
For each job in the LaTeX CV:
1. Create file: `resources/work/[YYYY-MM]-[company-slug]-[position-slug].typ`
2. Extract basic info (position, company, dates)
3. Extract description
4. Convert bullet points to accomplishments with metadata:
   - Analyze impact (high/medium/low)
   - Mark quantifiable (true/false)
   - Assign tags
5. Infer technology list
6. Assign relevance scores for 5-8 job types

### Step 4: Create Education Resources
For each degree:
1. Create file: `resources/education/degree-[YYYY]-[institution-slug]-[type]-[field].typ`
2. Extract basic info
3. Extract thesis/courses if mentioned
4. Assign tags and relevance scores

For each certificate:
1. Create file: `resources/education/cert-[YYYY]-[provider-slug]-[cert-slug].typ`
2. Extract basic info
3. Infer skills from description
4. Assign tags and relevance scores

### Step 5: Validate Resources
1. Check all required fields present
2. Verify tag taxonomy compliance
3. Validate relevance scores (differentiation, coverage)
4. Ensure date formats consistent

---

## 8. Handling Differences Between CV.tex and ATS_CV.tex

### Common Scenarios

**Scenario 1: Different wording for same accomplishment**

`CV.tex`:
```latex
\item Reduced forecast error by 20% using advanced ensemble techniques
```

`ATS_CV.tex`:
```latex
\item Reduced RMSE by 20% in demand forecasting model
```

**Solution:** Store both versions in resource:

```typst
accomplishments: (
  (
    text: "Reduced RMSE by 20% in demand forecasting model using ensemble methods",
    text_ats: "Reduced RMSE by 20% in demand forecasting model",  // ATS-optimized version
    impact: "high",
    quantifiable: true,
    tags: ("ml", "forecasting"),
    ats_friendly: true,
  ),
)
```

---

**Scenario 2: Different accomplishments included**

`CV.tex` includes detailed technical accomplishment:
```latex
\item Implemented custom feature engineering pipeline with 50+ derived features
```

`ATS_CV.tex` excludes this (too technical/detailed).

**Solution:** Mark appropriately:

```typst
accomplishments: (
  (
    text: "Implemented custom feature engineering pipeline with 50+ derived features",
    impact: "medium",
    quantifiable: true,
    tags: ("ml", "feature-engineering", "python"),
    ats_friendly: false,  // Mark as not ATS-friendly
  ),
)
```

In config, filter by `ats_friendly` flag:

```typst
filters: (
  ats_mode: true,  // Only include ats_friendly: true items
)
```

---

**Scenario 3: Different formatting (visual vs. text-heavy)**

`CV.tex` uses competency boxes, skill bars, etc.
`ATS_CV.tex` uses simple lists.

**Solution:** Handle in template files, not resources. Resources stay the same; templates (`CV.typ` vs. `ATS_CV.typ`) render differently.

---

## 9. Validation Checklist

After transformation, verify:

**Personal Info:**
- [ ] All contact fields populated
- [ ] Both summary versions written
- [ ] All skills have proficiency scores
- [ ] Skills categorized correctly
- [ ] Languages included

**Work Experiences:**
- [ ] One file per job
- [ ] All jobs from LaTeX included
- [ ] Each job has 3+ accomplishments
- [ ] All accomplishments have impact levels
- [ ] All accomplishments have tags
- [ ] Technologies list extracted
- [ ] Relevance scores for 5+ job types

**Education:**
- [ ] Degrees and certificates separated
- [ ] Each has own file
- [ ] Tags assigned
- [ ] Relevance scores assigned
- [ ] Thesis/coursework captured

**Metadata:**
- [ ] All tags from taxonomy
- [ ] No typos in tag names
- [ ] Relevance scores 1-10 only
- [ ] Impact levels: high/medium/low only
- [ ] Date formats consistent

---

## 10. Example: Complete Transformation

### Before (LaTeX)

```latex
\textline{Owner \& Founder}{Arge Innovations}{Dec. 2018 - Present}
\textit{\small Providing data science and ML consulting services to Danish enterprises}

\begin{itemize}
  \item Led 10+ ML projects generating €2M+ in client value
  \item Specialized in deep learning, NLP, and computer vision
  \item Managed end-to-end project delivery from scoping to deployment
\end{itemize}
```

### After (Typst Resource)

**File:** `resources/work/2018-12-arge-innovations-owner.typ`

```typst
#let job = (
  position: "Owner & Founder",
  company: "Arge Innovations",
  start_date: "Dec. 2018",
  end_date: "Present",
  
  description: "Data science and ML consulting services for Danish enterprises",
  description_long: "Founded consulting company providing end-to-end data science and machine learning solutions to Danish enterprises. Specialized in deep learning, NLP, and computer vision applications across multiple industries.",
  
  accomplishments: (
    (
      text: "Led 10+ ML projects generating €2M+ in client value across transportation, finance, and healthcare sectors",
      impact: "high",
      quantifiable: true,
      tags: ("ml", "consulting", "leadership", "project-management"),
      ats_friendly: true,
    ),
    (
      text: "Specialized in deep learning, NLP, and computer vision solutions for complex business problems",
      impact: "high",
      quantifiable: false,
      tags: ("deep-learning", "nlp", "computer-vision", "ml"),
      ats_friendly: true,
    ),
    (
      text: "Managed end-to-end project delivery from scoping to deployment, ensuring technical and business success",
      impact: "medium",
      quantifiable: false,
      tags: ("project-management", "consulting", "deployment", "stakeholder-management"),
      ats_friendly: true,
    ),
  ),
  
  technologies: ("Python", "TensorFlow", "PyTorch", "Scikit-learn", "Docker", "AWS"),
  tags: ("consulting", "ml", "deep-learning", "nlp", "computer-vision", "entrepreneurship", "leadership"),
  
  relevance: (
    "consulting": 10,
    "data-science": 10,
    "ml-engineering": 10,
    "applied-scientist": 9,
    "ml-researcher": 7,
    "software-engineering": 8,
    "data-engineering": 6,
  ),
  
  location: "Copenhagen, Denmark",
  employment_type: "self-employed",
)
```

---

## Completion Checklist

- [x] Personal info mapping defined
- [x] Work experience mapping defined
- [x] Education mapping defined
- [x] Certification mapping defined
- [x] Skills mapping defined
- [x] Summary mapping defined
- [x] Complete transformation workflow documented
- [x] Differences handling strategy defined
- [x] Validation checklist provided
- [x] Complete example provided

**Status:** COMPLETE
**Next Step:** Create filter logic specification (001-filter-logic-spec.md)
