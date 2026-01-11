# Ticket 001: Extract Content and Design Resource Schema

**Status**: OPEN  
**Priority**: HIGH  
**Created**: 2026-01-08  
**Depends On**: None  
**Blocks**: 002, 003  

## Objective

Extract all content from existing LaTeX CV files and design a comprehensive resource file schema that supports rich metadata, filtering, and tailoring capabilities.

## Tasks

### 1. Content Extraction

- [ ] Parse CV.tex and extract all content
- [ ] Parse ATS_CV.tex and extract all content
- [ ] Create comprehensive inventory of:
  - Personal information
  - All work experiences with accomplishments
  - All education (degrees, certificates, courses)
  - All skills (technical and soft) with proficiency levels
  - All languages with proficiency
  - Summary/objective text

### 2. Design Resource Schema

**Work Experience Schema:**

Create specification for work resource files with:
- [ ] Basic info (position, company, dates, location)
- [ ] Short and long descriptions
- [ ] Accomplishments with metadata:
  - Impact level (high/medium/low)
  - Quantifiable (yes/no)
  - Tags for filtering
- [ ] Technologies/skills used
- [ ] Relevance scores for different job types
- [ ] Keywords/tags for matching

**Example schema:**
```typst
#let job = (
  // Basic information
  position: "Data Science Consultant",
  company: "DFDS A/S",
  location: "Copenhagen, Denmark",
  start_date: "Dec. 2018",
  end_date: "May 2019",
  current: false,
  
  // Descriptions
  description: "Short summary for standard CV",
  description_long: "Detailed description with context...",
  
  // Accomplishments array
  accomplishments: (
    (
      text: "Reduced RMSE by 20%...",
      impact: "high",           // high, medium, low
      quantifiable: true,        // Has numbers/metrics
      tags: ("ml", "python", "performance"),
    ),
    // ... more accomplishments
  ),
  
  // Technologies/skills
  technologies: ("Python", "Scikit-learn", "Flask", "Docker"),
  
  // Tags for filtering
  tags: ("machine-learning", "optimization", "data-science"),
  
  // Relevance scoring for job types
  relevance: (
    "data-science": 10,
    "machine-learning": 10,
    "backend-engineering": 6,
  )
)
```

**Education Schema:**

Design specification for:
- [ ] Degrees (M.Sc., B.Sc.)
- [ ] Certificates (Coursera, Udacity, etc.)
- [ ] Courses

```typst
// Degree example
#let education = (
  type: "degree",  // degree, certificate, course
  degree: "M.Sc. in Physics",
  institution: "University of Copenhagen",
  location: "Copenhagen, Denmark",
  start_date: "Aug. 2012",
  end_date: "May 2015",
  
  description: "Short description",
  description_long: "Detailed description...",
  
  thesis: (
    title: "...",
    advisor: "Professor Name",
    summary: "Brief summary"
  ),
  
  highlights: ("Key topic 1", "Key topic 2", ...),
  
  tags: ("physics", "ml", "research"),
  
  relevance: (
    "data-science": 10,
    "research": 10,
  )
)

// Certificate example  
#let education = (
  type: "certificate",
  name: "Deep Learning Specialization",
  provider: "Coursera",
  instructor: "Andrew Ng",
  date: "Sep. 2017 - Feb. 2018",
  
  description: "Short description",
  description_long: "Detailed with projects...",
  
  projects: ("Project 1", "Project 2", ...),
  skills: ("TensorFlow", "Keras", "CNNs"),
  
  tags: ("deep-learning", "ai", "tensorflow"),
  
  relevance: (
    "ml": 10,
    "deep-learning": 10,
  )
)
```

**Personal Info Schema:**

```typst
#let personal = (
  // Contact
  name: "Rogvi David Arge",
  title: "Data Science & Optimization Consultant",
  phone: "+45 5042 5002",
  email: "argeinnovations@gmail.com",
  linkedin: "linkedin.com/in/rogvidarge/en",
  github: "github.com/rogvid",
  location: "Copenhagen, Denmark",
  
  // Summary
  summary: [...],
  summary_variations: (
    data-science: [...],
    ml-engineer: [...],
  ),
  
  // Skills with proficiency
  technical_skills: (
    (name: "Python", level: 5),
    (name: "Machine Learning", level: 5),
    // ...
  ),
  
  soft_skills: (
    (name: "Problem Solving", level: 5),
    // ...
  ),
  
  languages: (
    (name: "Danish", level: 5, proficiency: "Native"),
    // ...
  ),
)
```

### 3. Create Content Inventory Document

Create `.ticket/001-content-inventory.md` with complete listing:

```markdown
## Work Experience (Chronological)

### Arge Innovations - Owner (Dec. 2018 - Present)
**Description**: [extract]

**Accomplishments**:
1. [accomplishment with metrics]
   - Impact: high
   - Tags: ml, optimization
   - Quantifiable: yes

2. [accomplishment]
   - Impact: medium
   - Tags: consulting, business
   - Quantifiable: no

**Technologies**: Python, TensorFlow, Flask, AWS
**Tags**: data-science, consulting, ml, optimization
**Relevance**:
- Data Science: 10/10
- ML Engineering: 9/10
- Consulting: 10/10

[Continue for all jobs...]

## Education

### M.Sc. in Physics - University of Copenhagen (2012-2015)
[Full details...]

[Continue for all education...]

## Skills

### Technical Skills
- Python: 5/5
- Machine Learning: 5/5
[...]

### Soft Skills
- Problem Solving: 5/5
[...]

## Languages
- Faroese: Native
- Danish: Native
[...]
```

### 4. Design Tag Taxonomy

Create comprehensive tag system for filtering:

- [ ] Define primary tag categories:
  - Technical skills (python, ml, deep-learning, optimization)
  - Domains (transportation, finance, healthcare)
  - Activities (research, development, consulting, leadership)
  - Impact types (performance, revenue, cost-reduction, innovation)
  
- [ ] Create tag list in `.ticket/001-tag-taxonomy.md`

```markdown
## Tag Taxonomy

### Technical Skills
- python, scikit-learn, tensorflow, keras, pytorch
- sql, nosql, mongodb, postgresql
- flask, fastapi, django
- docker, kubernetes, aws, azure
- git, ci-cd

### Methodologies
- machine-learning, deep-learning, optimization
- data-visualization, data-analysis
- agile, scrum, kanban
- mlops, devops

### Domains
- transportation, logistics, finance, healthcare
- fraud-detection, predictive-analytics
- optimization, operations-research

### Activities
- research, development, consulting
- mentoring, leadership, team-management
- architecture, design, implementation

### Impact
- performance-improvement, cost-reduction
- revenue-growth, innovation
- process-improvement, automation
```

### 5. Design Relevance Scoring System

Define how to score resources for different job types:

- [ ] Create job type categories
- [ ] Define 1-10 scoring scale
- [ ] Document scoring guidelines

```markdown
## Relevance Scoring Guidelines

Score 1-10 based on:
- 10: Perfect match, highly relevant
- 7-9: Very relevant, good match
- 4-6: Somewhat relevant
- 1-3: Marginally relevant
- 0: Not relevant

### Job Type Categories
- data-science
- machine-learning
- deep-learning
- backend-engineering
- data-engineering
- ml-ops
- research
- consulting
- management

### Scoring Criteria
- Technology overlap
- Domain similarity
- Skill requirements
- Experience level
- Responsibilities match
```

### 6. Map LaTeX to Resource Structure

Document how LaTeX content maps to resource schema:

- [ ] Create `.ticket/001-latex-to-resource-mapping.md`

```markdown
## LaTeX to Resource Mapping

### Work Experience

**LaTeX**: 
```latex
\textline{Position}{Company}{Dates}
\accomplishment{Achievement}
```

**Resource**:
```typst
#let job = (
  position: "Position",
  company: "Company",
  start_date: "...", end_date: "...",
  accomplishments: (
    (text: "Achievement", impact: "high", tags: (...)),
  ),
)
```

[Document all mappings...]
```

### 7. Design Filter/Selection Logic

Specify how resources will be filtered:

- [ ] Tag-based filtering
- [ ] Impact-based filtering
- [ ] Relevance-based ranking
- [ ] Keyword matching

```typst
// Example filter logic
#let filter-accomplishments(accomplishments, config) = {
  accomplishments.filter(a => (
    // Must have high impact
    a.impact == "high" and
    // Must have at least one required tag
    a.tags.any(t => config.required_tags.contains(t)) and
    // Prefer quantifiable if configured
    (not config.prioritize_quantifiable or a.quantifiable)
  ))
}
```

## Deliverables

- [ ] `.ticket/001-content-inventory.md` - Complete content listing with metadata
- [ ] `.ticket/001-resource-schema-spec.md` - Detailed schema specification
- [ ] `.ticket/001-tag-taxonomy.md` - Comprehensive tag system
- [ ] `.ticket/001-relevance-scoring.md` - Scoring guidelines
- [ ] `.ticket/001-latex-to-resource-mapping.md` - Conversion guide
- [ ] `.ticket/001-filter-logic-spec.md` - Filtering specification

## Acceptance Criteria

- All content from LaTeX files is inventoried
- Resource schema supports all required metadata
- Tag taxonomy is comprehensive and organized
- Relevance scoring system is well-defined
- All accomplishments are categorized by impact
- Technologies/skills are listed for each job
- Filter logic is specified
- Schema supports both standard and ATS CVs

## Schema Requirements

The resource schema must support:

- [ ] Multiple description lengths (short, long)
- [ ] Flexible accomplishment selection
- [ ] Rich metadata for filtering
- [ ] Tag-based categorization
- [ ] Relevance scoring by job type
- [ ] Quantifiable vs. qualitative achievements
- [ ] Technology/skill tracking
- [ ] Date information
- [ ] Location information
- [ ] Current vs. past positions/education

## Notes

- Schema should be extensible for future needs
- Keep Typst syntax simple and readable
- Balance between richness and maintainability
- Consider how data will be filtered and displayed
- Think about AI-powered analysis (future)
- Ensure schema works for both CV variants

## Related Files

- `CV.tex` - Source content
- `ATS_CV.tex` - Source content
- `AGENTS.md` - Resource schema examples

## Estimated Time

2-3 hours

## Testing Criteria

- [ ] Schema can represent all LaTeX content
- [ ] Schema is not over-complicated
- [ ] Tag system is usable and comprehensive
- [ ] Relevance scoring makes sense
- [ ] Filter logic is implementable
- [ ] All metadata fields have clear purpose
