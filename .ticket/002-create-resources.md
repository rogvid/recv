# Ticket 002: Create Directory Structure and Resource Files

**Status**: COMPLETE  
**Priority**: HIGH  
**Created**: 2026-01-08  
**Completed**: 2026-01-11  
**Depends On**: 001  
**Blocks**: 003, 004, 005  

## Objective

Create the complete directory structure for the resource-based CV system and migrate all content from LaTeX to individual resource files following the schema designed in Ticket 001.

## Tasks

### 1. Create Directory Structure

```bash
mkdir -p resources/work
mkdir -p resources/education
mkdir -p templates
mkdir -p config/tailored
mkdir -p builds
mkdir -p scripts
```

- [ ] Create `resources/` directory
- [ ] Create `resources/work/` subdirectory
- [ ] Create `resources/education/` subdirectory
- [ ] Create `templates/` directory
- [ ] Create `config/` directory
- [ ] Create `config/tailored/` subdirectory
- [ ] Create `builds/` directory (add to .gitignore)
- [ ] Create `scripts/` directory

### 2. Create Personal Info Resource

**File**: `resources/personal-info.typ`

- [ ] Create file with personal dictionary
- [ ] Add contact information
- [ ] Add professional summary
- [ ] Add technical skills with proficiency levels
- [ ] Add soft skills with proficiency levels
- [ ] Add languages with proficiency levels
- [ ] Add optional summary variations for different targets

```typst
#let personal = (
  // Contact Information
  name: "Rogvi David Arge",
  title: "Data Science & Optimization Consultant",
  phone: "+45 5042 5002",
  email: "argeinnovations@gmail.com",
  linkedin: "linkedin.com/in/rogvidarge/en",
  github: "github.com/rogvid",
  location: "Copenhagen, Denmark",
  
  // Professional Summary
  summary: [Data Scientist with more than 4 years of experience in agile project development and a passion for deep learning, predictive analytics and optimization. Vast experience in data wrangling, exploratory data analysis, machine learning and data visualization and applying these skills to generate corporate wide improvements.],
  
  // Technical Skills (from CV.tex sidebar)
  technical_skills: (
    (name: "Python", level: 5),
    (name: "Machine Learning", level: 5),
    (name: "Optimization", level: 5),
    (name: "OR", level: 5),
    (name: "Data Visualization", level: 5),
    (name: "Data Analysis", level: 5),
    (name: "Modeling", level: 5),
    (name: "Statistics", level: 5),
    (name: "Git", level: 5),
    (name: "SQL", level: 5),
    (name: "Deep Learning", level: 4),
    (name: "Flask", level: 4),
    (name: "API", level: 4),
    (name: "D3", level: 4),
    (name: "HTML", level: 4),
    (name: "CSS", level: 4),
    (name: "JavaScript", level: 3),
    (name: "C#", level: 3),
    (name: "Docker", level: 3),
    (name: "AWS", level: 3),
    (name: "Azure", level: 3),
    (name: "MongoDB", level: 3),
    (name: "R", level: 3),
  ),
  
  // Soft Skills
  soft_skills: (
    (name: "Problem Solving", level: 5),
    (name: "Critical Thinking", level: 5),
    (name: "Communication", level: 5),
    (name: "Adaptability", level: 5),
    (name: "Project Planning", level: 5),
    (name: "Decision Making", level: 5),
    (name: "Scrum", level: 4),
  ),
  
  // Languages
  languages: (
    (name: "Faroese", level: 5, proficiency: "Native"),
    (name: "Danish", level: 5, proficiency: "Native"),
    (name: "English", level: 5, proficiency: "Professional"),
    (name: "Norwegian", level: 3, proficiency: "Elementary"),
    (name: "Swedish", level: 3, proficiency: "Elementary"),
    (name: "French", level: 2, proficiency: "Elementary"),
  ),
)
```

### 3. Create Work Experience Resources

Create individual files for each job from CV.tex:

**Job 1**: `resources/work/2018-12-arge-innovations-owner.typ`
- [ ] Extract data from CV.tex
- [ ] Create comprehensive job dictionary
- [ ] Add ALL accomplishments with metadata
- [ ] Add technologies used
- [ ] Add tags and relevance scores

**Job 2**: `resources/work/2018-12-dfds-data-science-consultant.typ`
- [ ] Extract data from CV.tex
- [ ] Create job dictionary
- [ ] Include accomplishments from both CV.tex and ATS_CV.tex
- [ ] Add metadata

**Job 3**: `resources/work/2017-02-atp-data-scientist.typ`
- [ ] Extract data
- [ ] Create job dictionary
- [ ] Add accomplishments with impact levels

**Job 4**: `resources/work/2015-04-conwx-data-analyst.typ`
- [ ] Extract data
- [ ] Create job dictionary
- [ ] Add all accomplishments

**Example for DFDS**:
```typst
// resources/work/2018-12-dfds-data-science-consultant.typ

#let job = (
  // Basic Info
  position: "Data Science Consultant",
  company: "DFDS A/S",
  location: "Copenhagen, Denmark",
  start_date: "Dec. 2018",
  end_date: "May 2019",
  current: false,
  
  // Descriptions
  description: "Spearheaded a paradigm shift of the transportation & logistics industry",
  
  description_long: "Led data science initiatives to revolutionize transportation planning through predictive analytics and optimization algorithms. Collaborated with cross-functional teams to deploy machine learning models that significantly improved operational efficiency and planning capabilities.",
  
  // Accomplishments
  accomplishments: (
    (
      text: "Reduced RMSE of prediction algorithm by 20% by helping to implement a number of scalable machine learning models",
      impact: "high",
      quantifiable: true,
      tags: ("machine-learning", "python", "performance-improvement", "predictive-analytics"),
    ),
    (
      text: "Enabled a completely new transportation planning paradigm by implementing dynamic optimization tool that visualized optimal plan in real time",
      impact: "high",
      quantifiable: false,
      tags: ("optimization", "visualization", "innovation", "operations-research"),
    ),
    (
      text: "Spearheaded a paradigm shift of the transportation & logistics industry in successful data science project over a period of 5 months",
      impact: "high",
      quantifiable: true,
      tags: ("project-leadership", "transportation", "logistics"),
    ),
  ),
  
  // Technologies
  technologies: ("Python", "Scikit-learn", "Pandas", "OR-Tools", "Flask", "D3.js", "Docker", "Git"),
  
  // Tags
  tags: ("data-science", "machine-learning", "optimization", "transportation", "logistics", "consulting"),
  
  // Relevance Scores
  relevance: (
    "data-science": 10,
    "machine-learning": 10,
    "optimization": 10,
    "consulting": 10,
    "backend-engineering": 6,
    "data-engineering": 7,
  ),
)
```

### 4. Create Education Resources

**Degree 1**: `resources/education/degree-2012-ku-msc-physics.typ`
- [ ] Extract from CV.tex and ATS_CV.tex
- [ ] Include thesis information from ATS version
- [ ] Add focus areas and highlights

```typst
// resources/education/degree-2012-ku-msc-physics.typ

#let education = (
  type: "degree",
  degree: "M.Sc. in Physics",
  institution: "University of Copenhagen",
  location: "Copenhagen, Denmark",
  start_date: "Aug. 2012",
  end_date: "May 2015",
  
  description: "Focus on computational physics, machine learning and mathematical modeling.",
  
  description_long: "Focused studies on applied mathematics, computational physics, machine learning, statistics and mathematical modeling. Conducted extensive research on complex systems and pattern formation in biological systems, developing both theoretical frameworks and computational implementations.",
  
  thesis: (
    title: "Inflammation of the Central Nervous System - Modeling Multiple Sclerosis as a Motile Excitable Medium",
    advisor: "Professor Mogens Høgh Jensen",
    summary: "Developed computational models to simulate multiple sclerosis disease progression using partial differential equations and Monte Carlo methods, investigating pattern formation and wave propagation in neural tissue.",
  ),
  
  highlights: (
    "Computational Physics",
    "Machine Learning",
    "Mathematical Modeling",
    "Statistical Mechanics",
    "Numerical Methods",
  ),
  
  tags: ("physics", "machine-learning", "computational-modeling", "mathematics", "research"),
  
  relevance: (
    "data-science": 10,
    "machine-learning": 9,
    "research": 10,
    "physics": 10,
    "computational-science": 10,
  ),
)
```

**Degree 2**: `resources/education/degree-2009-ku-bsc-physics.typ`
- [ ] Extract from CV.tex
- [ ] Add focus areas

**Certificate 1**: `resources/education/certificate-2017-coursera-deep-learning.typ`
- [ ] Extract from both CV versions
- [ ] Add projects from ATS_CV.tex
- [ ] Add skills learned

**Certificate 2**: `resources/education/certificate-2015-udacity-data-analyst.typ`
- [ ] Extract from CV.tex and ATS_CV.tex
- [ ] Add notable projects from ATS version

**Certificate 3**: `resources/education/certificate-2018-coursera-social-network-analysis.typ` (from ATS_CV.tex)
- [ ] Extract data
- [ ] Create certificate dictionary

### 5. Verify File Naming Convention

Ensure all files follow standard:

**Work**: `YYYY-MM-company-slug-position-slug.typ`
- [ ] Check all work files use correct format
- [ ] Verify chronological ordering is clear
- [ ] Slugs are lowercase with hyphens

**Education**: `[type]-YYYY-institution-slug-name-slug.typ`
- [ ] Check all education files use correct format
- [ ] Types are: degree, certificate, course
- [ ] Slugs are consistent

### 6. Create Initial Config File

**File**: `config/cv-config.typ`

```typst
// config/cv-config.typ
// Configuration for full CV (all content)

#let config = (
  // Work experiences (in display order)
  work: (
    "2018-12-arge-innovations-owner.typ",
    "2018-12-dfds-data-science-consultant.typ",
    "2017-02-atp-data-scientist.typ",
    "2015-04-conwx-data-analyst.typ",
  ),
  
  // Education
  education: (
    degrees: (
      "degree-2012-ku-msc-physics.typ",
      "degree-2009-ku-bsc-physics.typ",
    ),
    certificates: (
      "certificate-2017-coursera-deep-learning.typ",
      "certificate-2015-udacity-data-analyst.typ",
    ),
  ),
  
  // Skills display
  skills: (
    technical: "all",  // Show all technical skills
    soft: "all",       // Show all soft skills
  ),
  
  // Accomplishment selection
  accomplishments: (
    max_per_job: 3,              // Max 3 per job
    min_impact: "medium",         // Include medium and high impact
    prioritize_quantifiable: true, // Prefer quantifiable achievements
  ),
  
  // No filters for full CV
  filters: none,
)
```

### 7. Update .gitignore

Add build directory to gitignore:

```gitignore
# Existing
*.aux
*.log
*.out

# Typst builds
builds/
.typst-cache/

# Keep configs and resources
!config/
!resources/
```

## Deliverables

- [ ] Complete directory structure
- [ ] `resources/personal-info.typ` with all personal data
- [ ] At least 4 work resource files
- [ ] At least 2 degree files
- [ ] At least 2 certificate files
- [ ] `config/cv-config.typ` initial configuration
- [ ] Updated `.gitignore`
- [ ] `.ticket/002-migration-notes.md` documenting any issues or decisions

## Acceptance Criteria

- All directories created correctly
- All resource files follow naming convention
- Personal info is complete and accurate
- Each work file has comprehensive data:
  - All accomplishments
  - Technologies used
  - Tags and relevance scores
  - Short and long descriptions
- Education files have complete information
- Config file references all resources correctly
- No LaTeX syntax in resource files (pure Typst)
- All Danish characters preserved (ø, æ, å)

## Quality Checks

For each resource file:
- [ ] Uses correct schema from Ticket 001
- [ ] All required fields present
- [ ] Accomplishments have metadata (impact, tags, quantifiable)
- [ ] Tags are relevant and from taxonomy
- [ ] Relevance scores make sense
- [ ] Descriptions are well-written
- [ ] No typos or formatting issues

## Notes

- Be comprehensive - include ALL accomplishments
- More data is better (can filter later)
- Ensure metadata is accurate and useful
- Keep descriptions professional
- Use consistent tone across all files
- Reference content inventory from Ticket 001

## Related Files

- `.ticket/001-content-inventory.md` (source data)
- `.ticket/001-resource-schema-spec.md` (schema to follow)
- `CV.tex` (source content)
- `ATS_CV.tex` (source content)
- `AGENTS.md` (schema examples)

## Estimated Time

1.5-2 hours

## Testing

- [ ] Can import personal-info.typ without errors
- [ ] Can import each work file without errors
- [ ] Can import each education file without errors
- [ ] All files are valid Typst syntax
- [ ] Config file is valid Typst
