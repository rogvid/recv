# Ticket 001 - Resource Schema Specification

## Overview

This document defines the exact Typst dictionary format for all resource types in the CV system. All resource files MUST conform to these schemas.

## 1. Work Experience Resource Schema

**File naming:** `resources/work/[YYYY-MM]-[company-slug]-[position-slug].typ`

**Example:** `resources/work/2018-12-dfds-data-science-consultant.typ`

**Schema:**

```typst
#let job = (
  // REQUIRED FIELDS
  position: "Job Title",              // String - Official job title
  company: "Company Name",            // String - Company/organization name
  start_date: "Month Year",           // String - Format: "Dec. 2018" or "December 2018"
  end_date: "Month Year",             // String - Format: "May 2019" or "Present"
  
  // DESCRIPTION FIELDS
  description: "Brief description",   // String - 1-2 sentences for compact layouts
  description_long: "Detailed description", // String - 2-4 sentences for full layouts
  
  // ACCOMPLISHMENTS
  accomplishments: (                  // Array of dictionaries
    (
      text: "Achievement description with metrics", // String - The accomplishment text
      impact: "high",                 // String - "high", "medium", "low"
      quantifiable: true,             // Boolean - Does it include metrics/numbers?
      tags: ("ml", "python", "optimization"), // Array of strings - Technology/skill tags
      ats_friendly: true,             // Boolean - Is this parseable by ATS systems?
    ),
    // ... more accomplishments
  ),
  
  // METADATA
  technologies: ("Python", "Scikit-learn", "TensorFlow"), // Array of strings
  tags: ("data-science", "ml", "consulting", "transportation"), // Array of strings - Domain/activity tags
  
  // RELEVANCE SCORING
  relevance: (                        // Dictionary - Job type → score (1-10)
    "data-science": 10,
    "ml-engineering": 9,
    "software-engineering": 7,
    "consulting": 10,
    "research": 6,
  ),
  
  // OPTIONAL FIELDS
  location: "Copenhagen, Denmark",    // String - Office location (optional)
  employment_type: "contract",        // String - "full-time", "contract", "part-time", "internship"
  team_size: 3,                       // Integer - Team size if relevant (optional)
  reporting_to: "CTO",                // String - Reporting structure (optional)
)
```

**Field Constraints:**

- `position`: Max 60 characters
- `company`: Max 60 characters
- `description`: 50-150 characters (for compact display)
- `description_long`: 150-400 characters
- `accomplishments`: Minimum 2, recommended 3-6 per job
- `accomplishments[].text`: Max 200 characters
- `accomplishments[].impact`: MUST be one of "high", "medium", "low"
- `tags`: Minimum 2, maximum 10
- `technologies`: Minimum 1, maximum 15
- `relevance`: Must include at least 3 job type scores

---

## 2. Education Resource Schema

**File naming:** `resources/education/degree-[YYYY]-[institution-slug].typ`

**Example:** `resources/education/degree-2017-university-of-southern-denmark-msc-physics.typ`

**Schema:**

```typst
#let degree = (
  // REQUIRED FIELDS
  degree_type: "M.Sc.",               // String - "Ph.D.", "M.Sc.", "B.Sc.", "M.A.", "B.A.", etc.
  field: "Physics",                   // String - Field of study
  institution: "University of Southern Denmark", // String - Institution name
  graduation_date: "June 2017",       // String - Month Year format
  
  // OPTIONAL FIELDS
  gpa: "3.8/4.0",                     // String - GPA if impressive (optional)
  honors: "Magna Cum Laude",          // String - Academic honors (optional)
  thesis_title: "Machine Learning Applications in Quantum Systems", // String (optional)
  
  // DESCRIPTION
  description: "Brief description of specialization", // String - 1-2 sentences
  
  // COURSEWORK (optional)
  relevant_courses: (                 // Array of strings (optional)
    "Machine Learning",
    "Statistical Methods",
    "Computational Physics",
  ),
  
  // METADATA
  tags: ("physics", "research", "ml", "statistics"), // Array of strings
  
  // RELEVANCE SCORING
  relevance: (
    "data-science": 9,
    "ml-engineering": 8,
    "research": 10,
    "software-engineering": 6,
  ),
  
  // ACCOMPLISHMENTS (optional)
  accomplishments: (                  // Array - For significant academic achievements
    (
      text: "Published 2 papers in peer-reviewed journals",
      impact: "high",
      quantifiable: true,
      tags: ("research", "publishing"),
      ats_friendly: true,
    ),
  ),
)
```

---

## 3. Certificate Resource Schema

**File naming:** `resources/education/cert-[YYYY]-[provider-slug]-[cert-slug].typ`

**Example:** `resources/education/cert-2017-deeplearning-ai-deep-learning-specialization.typ`

**Schema:**

```typst
#let certificate = (
  // REQUIRED FIELDS
  name: "Deep Learning Specialization",    // String - Certificate name
  provider: "deeplearning.ai",            // String - Issuing organization
  completion_date: "Oct. 2017",           // String - Month Year format
  
  // OPTIONAL FIELDS
  credential_id: "ABC123XYZ",             // String - Verification ID (optional)
  credential_url: "https://coursera.org/verify/ABC123XYZ", // String - Verification link (optional)
  expiry_date: none,                      // String - "Month Year" or none
  
  // DESCRIPTION
  description: "5-course specialization covering neural networks, CNNs, RNNs, etc.", // String
  
  // SKILLS ACQUIRED
  skills: ("Deep Learning", "TensorFlow", "CNNs", "RNNs"), // Array of strings
  
  // METADATA
  tags: ("ml", "deep-learning", "certification", "coursera"), // Array of strings
  
  // RELEVANCE SCORING
  relevance: (
    "data-science": 9,
    "ml-engineering": 10,
    "research": 7,
    "software-engineering": 5,
  ),
  
  // DURATION (optional)
  duration_hours: 120,                    // Integer - Total course hours (optional)
)
```

---

## 4. Personal Information Schema

**File:** `resources/personal-info.typ`

**Schema:**

```typst
#let personal = (
  // BASIC INFO
  name: "Rogvid Arge",
  title: "Data Scientist & Machine Learning Engineer", // Professional title
  
  // CONTACT
  email: "argeinnovations@gmail.com",
  phone: "+45 5042 5002",
  location: "Copenhagen, Denmark",        // Optional
  
  // ONLINE PRESENCE
  linkedin: "https://linkedin.com/in/rogvidarge/en",
  github: "https://github.com/rogvid",
  website: none,                          // String or none
  
  // SUMMARY
  summary_short: "Brief 1-sentence elevator pitch", // 50-100 chars
  summary_long: "Detailed 2-3 sentence professional summary", // 200-400 chars
  
  // PROFILE PHOTO (optional)
  photo_path: "workpicture.png",          // String - Relative path or none
  photo_width: "70%",                     // String - Display width
)

#let technical_skills = (
  (
    name: "Python",
    proficiency: 5,                       // Integer 1-5 (5 = expert)
    category: "programming",              // String - "programming", "tools", "frameworks", "databases"
    tags: ("backend", "data-science", "ml"),
  ),
  // ... more skills
)

#let soft_skills = (
  (
    name: "Leadership",
    proficiency: 4,                       // Integer 1-5
    tags: ("management", "teamwork"),
  ),
  // ... more skills
)

#let languages = (
  (
    name: "Danish",
    level: "Native",                      // String - "Native", "Fluent", "Professional", "Limited"
    proficiency: 5,                       // Integer 1-5
  ),
  // ... more languages
)
```

---

## 5. Configuration Schema

**File:** `config/cv-config.typ`

**Schema:**

```typst
#let cv_config = (
  // PERSONAL DATA
  personal_info: "resources/personal-info.typ",
  
  // WORK EXPERIENCE SELECTION
  work_experiences: (
    "resources/work/2018-12-dfds-data-science-consultant.typ",
    "resources/work/2016-09-university-of-southern-denmark-research-assistant.typ",
    // ... ordered list of work files to include
  ),
  
  // EDUCATION SELECTION
  education: (
    "resources/education/degree-2017-university-of-southern-denmark-msc-physics.typ",
    "resources/education/degree-2013-university-of-southern-denmark-bsc-physics.typ",
  ),
  
  // CERTIFICATES SELECTION
  certificates: (
    "resources/education/cert-2017-deeplearning-ai-deep-learning-specialization.typ",
    // ... ordered list
  ),
  
  // FILTERING RULES
  filters: (
    // Filter accomplishments by impact level
    min_accomplishment_impact: "medium", // "high", "medium", "low"
    
    // Filter by tags (if specified, only include items with these tags)
    required_tags: none,                // Array of strings or none
    
    // Maximum items to include
    max_work_experiences: 5,
    max_accomplishments_per_job: 5,
    max_certificates: 3,
    
    // ATS mode
    ats_mode: false,                    // Boolean - If true, only include ats_friendly accomplishments
  ),
  
  // LAYOUT PREFERENCES
  layout: (
    include_photo: true,
    two_column: true,                   // false for ATS version
    color_scheme: "blue",               // "blue", "red", "gray", "minimal"
  ),
)
```

---

## 6. Tailored Configuration Schema

**File:** `config/tailored/[job-name]-config.typ`

**Schema:** Same as `cv-config.typ` but with job-specific filtering:

```typst
#let cv_config = (
  personal_info: "resources/personal-info.typ",
  
  // WORK SELECTION - Filtered and ordered by relevance to target role
  work_experiences: (
    "resources/work/2018-12-dfds-data-science-consultant.typ",
    // ... only most relevant jobs
  ),
  
  education: (...),
  certificates: (...),
  
  filters: (
    min_accomplishment_impact: "high",  // Higher bar for tailored CVs
    required_tags: ("ml", "python"),    // Only include items with ML focus
    max_work_experiences: 4,            // Fewer items, more focused
    max_accomplishments_per_job: 4,
    ats_mode: false,
  ),
  
  layout: (
    include_photo: false,               // Often disabled for applications
    two_column: true,
    color_scheme: "blue",
  ),
  
  // TARGETING INFO (metadata, not rendered)
  target_role: "Senior Data Scientist",
  target_company: "Google",
  tailored_for_tags: ("ml", "python", "deep-learning"),
)
```

---

## 7. Data Type Conventions

**Strings:**
- All text fields use double quotes: `"text"`
- Empty strings allowed: `""`
- Use `none` for truly optional/missing fields

**Arrays:**
- Use parentheses: `("item1", "item2", "item3")`
- Trailing comma allowed: `("item1", "item2",)`
- Empty arrays: `()`

**Dictionaries:**
- Use parentheses with key-value pairs: `(key1: "value1", key2: "value2")`
- Trailing comma allowed
- Nested dictionaries allowed

**Booleans:**
- `true` or `false` (lowercase)

**Numbers:**
- Integers: `5`, `10`, `120`
- No floats in this schema

**None:**
- Use `none` for missing/null values

---

## 8. Validation Rules

**REQUIRED validations for all resources:**

1. All required fields MUST be present
2. Dates MUST use format "Month Year" (abbreviated month OK: "Dec. 2018")
3. Impact levels MUST be one of: "high", "medium", "low"
4. Proficiency scores MUST be integers 1-5
5. Relevance scores MUST be integers 1-10
6. All arrays MUST contain at least 1 item (unless marked optional)
7. Tags MUST be lowercase with hyphens: "machine-learning" not "Machine Learning"
8. File paths MUST use forward slashes: "resources/work/file.typ"

**RECOMMENDED validations:**

1. Accomplishment text should include quantifiable metrics when possible
2. Each work experience should have 3-6 accomplishments
3. Tags should come from standardized taxonomy (see `001-tag-taxonomy.md`)
4. Relevance scores should cover at least 5 common job types

---

## 9. Example Complete Work Resource

**File:** `resources/work/2018-12-dfds-data-science-consultant.typ`

```typst
#let job = (
  position: "Data Science Consultant",
  company: "DFDS A/S",
  start_date: "Dec. 2018",
  end_date: "May 2019",
  
  description: "Developed ML models to optimize fleet operations for Scandinavian logistics.",
  description_long: "Contracted to develop machine learning solutions for optimizing maritime fleet operations. Led data pipeline development and model deployment for route optimization and demand forecasting systems.",
  
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
  
  technologies: ("Python", "Scikit-learn", "Pandas", "SQL", "Docker"),
  tags: ("data-science", "ml", "consulting", "transportation", "logistics"),
  
  relevance: (
    "data-science": 10,
    "ml-engineering": 9,
    "software-engineering": 7,
    "consulting": 10,
    "research": 6,
  ),
  
  location: "Copenhagen, Denmark",
  employment_type: "contract",
)
```

---

## 10. Schema Versioning

**Current Version:** 1.0

**Version History:**
- 1.0 (2026-01-11): Initial schema specification

**Breaking Changes Policy:**
- Major version bump (1.x → 2.x) for incompatible schema changes
- Minor version bump (1.0 → 1.1) for backward-compatible additions
- All resource files should include schema version in comments

**Future Considerations:**
- Add `schema_version: "1.0"` field to all resources
- Create migration scripts for schema upgrades
- Validation tool to check schema compliance

---

## Completion Checklist

- [x] Work experience schema defined
- [x] Education schema defined
- [x] Certificate schema defined
- [x] Personal info schema defined
- [x] Configuration schema defined
- [x] Tailored config schema defined
- [x] Data type conventions documented
- [x] Validation rules specified
- [x] Complete examples provided
- [x] Versioning strategy defined

**Status:** COMPLETE
**Next Step:** Create tag taxonomy (001-tag-taxonomy.md)
