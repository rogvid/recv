# AGENTS.md - Typst CV Repository Guidelines

This document provides guidelines for AI coding agents working in this Typst CV repository.

## Task Workflow Requirements

**CRITICAL: All tasks must follow the Plan → Execute → Test → Review loop.**

Every task, especially those involving visual output (PDFs, layouts, styling), MUST include:

1. **Plan**: Break down the task into clear steps with expected outcomes
2. **Execute**: Implement the changes
3. **Test**: Compile/run the code and verify it works
4. **Review**: Actually examine the output to confirm it matches requirements

### For PDF/Visual Tasks:

When working on templates, styling, or any visual output:

```bash
# After making changes, ALWAYS:

# 0. Clean builds folder before testing
rm -rf builds/*

# 1. Compile to PDF
typst compile --root . templates/CV.typ builds/CV.pdf

# 2. Export to PNG for review (can view images directly)
typst compile --root . templates/CV.typ 'builds/CV-page-{p}.png' --ppi 150

# 3. Review the actual output
# Read the PNG files to visually verify the changes worked

# 4. Compare against reference images if available
# Check .ai/refs/ for reference screenshots
```

**Never state that something is "done" or "complete" without:**
- ✅ Compiling successfully
- ✅ Actually reviewing the output (PNG/PDF)
- ✅ Confirming it matches the requirements/reference
- ✅ Documenting what was verified

### Example of INCORRECT workflow:

```
❌ "I've updated the skill-bar function. The PDF should now look correct!"
   (No testing, no review, just assumption)
```

### Example of CORRECT workflow:

```
✅ "I've updated the skill-bar function. Let me test it:
   1. Compiling PDF... ✓ No errors
   2. Exporting to PNG... ✓ 
   3. Reviewing page 1... 
   4. Comparing to reference... 
   Issue found: dots are vertical instead of horizontal.
   Investigating..."
```

This prevents premature completion and ensures quality.

## Repository Overview

This is a resource-based Typst CV system that allows generating tailored CVs for specific job applications. The system separates content (resources) from presentation (templates).

**Key Features:**
- **Resource-based**: All work experience, education, courses, and certificates stored as individual files
- **Tailorable**: Generate customized CVs based on job descriptions
- **Two variants**: Standard CV and ATS-optimized CV
- **Reusable**: Share common styling and components

**Structure:**
```
resources/
  work/           # Individual job files
  education/      # Degrees, courses, certificates
templates/
  CV.typ          # Standard CV template
  ATS_CV.typ      # ATS-optimized CV template
  cv-common.typ   # Shared components
builds/
  [job-name]/     # Generated CVs for specific applications
```

## Build Commands

### Compiling CVs

**Build with all content:**
```bash
typst compile templates/CV.typ builds/full-cv.pdf
typst compile templates/ATS_CV.typ builds/full-ats-cv.pdf
```

**Build tailored CV:**
```bash
# Using custom build script (to be created)
./build-cv.sh "Senior Data Scientist" job-description.txt
# Output: builds/senior-data-scientist/CV.pdf
#         builds/senior-data-scientist/ATS_CV.pdf
```

**Watch mode (auto-rebuild on changes):**
```bash
typst watch templates/CV.typ builds/test.pdf
typst watch templates/ATS_CV.typ builds/test-ats.pdf
```

**Check for errors:**
```bash
typst compile --diagnostic-format=short templates/CV.typ
```

## Resource File Structure

### Work Experience Files

**Location**: `resources/work/YYYY-MM-company-position.typ`

**Naming convention**: `[start-year]-[start-month]-[company-slug]-[position-slug].typ`

Examples:
- `2018-12-arge-innovations-owner.typ`
- `2018-12-dfds-data-science-consultant.typ`
- `2017-02-atp-data-scientist.typ`

**File format:**
```typst
// resources/work/2018-12-dfds-data-science-consultant.typ

#let job = (
  position: "Data Science Consultant",
  company: "DFDS A/S",
  location: "Copenhagen, Denmark",
  start_date: "Dec. 2018",
  end_date: "May 2019",
  current: false,
  
  // Short description for standard CV
  description: "Spearheaded a paradigm shift of the transportation & logistics industry",
  
  // Detailed description
  description_long: "Led data science initiatives to revolutionize transportation planning through predictive analytics and optimization algorithms. Worked in an agile team of 5 data scientists and engineers.",
  
  // Keywords/tags for matching
  tags: ("machine-learning", "optimization", "transportation", "logistics", "python", "scikit-learn", "predictive-analytics"),
  
  // Accomplishments - can be filtered/selected
  accomplishments: (
    (
      text: "Reduced RMSE of prediction algorithm by 20% by helping to implement scalable machine learning models",
      impact: "high",
      quantifiable: true,
      tags: ("machine-learning", "python", "performance-improvement")
    ),
    (
      text: "Enabled completely new transportation planning paradigm by implementing dynamic optimization tool that visualized optimal plan in real time",
      impact: "high",
      quantifiable: false,
      tags: ("optimization", "visualization", "innovation")
    ),
    (
      text: "Mentored junior data scientists in best practices for model development and deployment",
      impact: "medium",
      quantifiable: false,
      tags: ("mentoring", "leadership")
    ),
  ),
  
  // Technologies used
  technologies: ("Python", "Scikit-learn", "Pandas", "OR-Tools", "Flask", "D3.js", "Docker"),
  
  // Relevance weight for different job types
  relevance: (
    "data-science": 10,
    "machine-learning": 10,
    "optimization": 10,
    "backend-engineering": 6,
    "data-engineering": 7,
  )
)
```

### Education Files

**Location**: `resources/education/[type]-YYYY-institution-degree.typ`

**Types**: `degree`, `course`, `certificate`

Examples:
- `degree-2012-ku-msc-physics.typ`
- `certificate-2017-coursera-deep-learning.typ`
- `course-2018-coursera-social-network-analysis.typ`

**File format:**
```typst
// resources/education/degree-2012-ku-msc-physics.typ

#let education = (
  type: "degree",  // degree, course, certificate
  degree: "M.Sc. in Physics",
  institution: "University of Copenhagen",
  location: "Copenhagen, Denmark",
  start_date: "Aug. 2012",
  end_date: "May 2015",
  
  description: "Focus on computational physics, machine learning and mathematical modeling.",
  
  description_long: "Focused studies on applied mathematics, computational physics, machine learning, statistics and mathematical modeling. Conducted research on complex systems and pattern formation in biological systems.",
  
  thesis: (
    title: "Inflammation of the Central Nervous System - Modeling Multiple Sclerosis as a Motile Excitable Medium",
    advisor: "Professor Mogens Høgh Jensen",
    summary: "Developed computational models to simulate MS disease progression using partial differential equations and Monte Carlo methods."
  ),
  
  // Key courses or areas
  highlights: (
    "Computational Physics",
    "Machine Learning",
    "Statistical Mechanics",
    "Mathematical Modeling",
    "Numerical Methods"
  ),
  
  tags: ("physics", "machine-learning", "computational-modeling", "mathematics", "research"),
  
  relevance: (
    "data-science": 10,
    "machine-learning": 9,
    "research": 10,
    "physics": 10,
  )
)
```

**Certificate format:**
```typst
// resources/education/certificate-2017-coursera-deep-learning.typ

#let education = (
  type: "certificate",
  name: "Deep Learning Specialization",
  provider: "Coursera",
  instructor: "Andrew Ng",
  date: "Sep. 2017 - Feb. 2018",
  
  description: "Development of deep learning models in Tensorflow & Keras.",
  
  description_long: "Comprehensive specialization covering neural networks, CNNs, RNNs, and GANs. Implemented projects in image recognition, speech detection, and NLP.",
  
  projects: (
    "Image Recognition with CNNs",
    "Speech Detection and Recognition",
    "Trigger Word Detection",
    "Neural Style Transfer",
    "Generative Adversarial Networks"
  ),
  
  skills: ("TensorFlow", "Keras", "Deep Learning", "CNNs", "RNNs", "GANs", "Transfer Learning"),
  
  tags: ("deep-learning", "tensorflow", "keras", "neural-networks", "ai"),
  
  relevance: (
    "machine-learning": 10,
    "deep-learning": 10,
    "ai-engineering": 10,
    "data-science": 8,
  )
)
```

## CV Template Structure

### Standard CV Template (templates/CV.typ)

```typst
#import "cv-common.typ": *

// Import personal info
#import "../resources/personal-info.typ": personal

// Load configuration (which items to include)
#import "../config/cv-config.typ": config

// Set up document
#set document(
  title: "CV - " + personal.name,
  author: personal.name,
)

#setup-cv-page(ats-mode: false)

// Header
#cv-header(personal)

// Summary
#section-header("Summary")
#personal.summary
#v(0.4cm)

// Two-column layout
#grid(
  columns: (2fr, 1fr),
  column-gutter: 1.5em,
  [
    // LEFT COLUMN
    #section-header("Experience")
    
    // Load and filter work experiences
    #for job_file in config.work {
      let job_data = include-job(job_file)
      if should-include(job_data, config) {
        render-job(job_data, config)
      }
    }
    
    #section-header("Education")
    
    // Load degrees
    #for edu_file in config.education.degrees {
      let edu = include-education(edu_file)
      render-education(edu, config)
    }
    
    #section-header("Certifications")
    
    // Load certificates
    #for cert_file in config.education.certificates {
      let cert = include-education(cert_file)
      render-certificate(cert, config)
    }
  ],
  [
    // RIGHT COLUMN (Sidebar)
    #render-skills-section(config.skills)
    #render-languages-section(personal.languages)
  ]
)
```

## Configuration System

### Personal Info

**File**: `resources/personal-info.typ`

```typst
#let personal = (
  name: "Rogvi David Arge",
  title: "Data Science & Optimization Consultant",
  phone: "+45 5042 5002",
  email: "argeinnovations@gmail.com",
  linkedin: "linkedin.com/in/rogvidarge/en",
  github: "github.com/rogvid",
  location: "Copenhagen, Denmark",
  
  summary: [Data Scientist with more than 4 years of experience in agile project development and a passion for deep learning, predictive analytics and optimization. Vast experience in data wrangling, exploratory data analysis, machine learning and data visualization and applying these skills to generate corporate wide improvements.],
  
  // Skills with proficiency levels
  technical_skills: (
    (name: "Python", level: 5),
    (name: "Machine Learning", level: 5),
    (name: "Optimization", level: 5),
    (name: "Data Visualization", level: 5),
    (name: "Deep Learning", level: 4),
    (name: "SQL", level: 5),
    // ... more skills
  ),
  
  soft_skills: (
    (name: "Problem Solving", level: 5),
    (name: "Critical Thinking", level: 5),
    (name: "Communication", level: 5),
    // ... more skills
  ),
  
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

### CV Configuration

**File**: `config/cv-config.typ` (for full CV)

```typst
#let config = (
  // Which work experiences to include (in order)
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
  
  // Skills to highlight
  skills: (
    technical: "all",  // or array of specific skills
    soft: "all",
  ),
  
  // Accomplishments selection
  accomplishments: (
    max_per_job: 3,
    min_impact: "medium",  // low, medium, high
    prioritize_quantifiable: true,
  ),
  
  // Filtering
  filters: (
    // No specific filters for full CV
  )
)
```

**File**: `config/tailored/senior-data-scientist-config.typ` (for specific job)

```typst
#let config = (
  // Target job details
  target: (
    position: "Senior Data Scientist",
    company: "Tech Company",
    keywords: ("machine-learning", "python", "deep-learning", "team-leadership", "mlops"),
  ),
  
  // Select most relevant work
  work: (
    "2018-12-dfds-data-science-consultant.typ",  // Most relevant
    "2017-02-atp-data-scientist.typ",
    "2018-12-arge-innovations-owner.typ",
    "2015-04-conwx-data-analyst.typ",
  ),
  
  education: (
    degrees: (
      "degree-2012-ku-msc-physics.typ",
    ),
    certificates: (
      "certificate-2017-coursera-deep-learning.typ",
    ),
  ),
  
  // Filter accomplishments by relevance
  accomplishments: (
    max_per_job: 2,
    min_impact: "high",
    required_tags: ("machine-learning", "python", "optimization"),
    prioritize_quantifiable: true,
  ),
  
  // Skill highlighting
  skills: (
    technical: ("Python", "Machine Learning", "Deep Learning", "TensorFlow", "Scikit-learn"),
    soft: ("Problem Solving", "Critical Thinking", "Communication", "Scrum"),
    highlight: ("Machine Learning", "Deep Learning", "Python"),  // Show prominently
  ),
)
```

## Build System

### Simple Build Script

**File**: `build-cv.sh`

```bash
#!/bin/bash
# Build tailored CV for specific job

JOB_NAME=$1
CONFIG_FILE=$2

if [ -z "$JOB_NAME" ]; then
  echo "Usage: ./build-cv.sh <job-name> [config-file]"
  exit 1
fi

# Create output directory
mkdir -p "builds/$JOB_NAME"

# Use provided config or default
if [ -z "$CONFIG_FILE" ]; then
  CONFIG_FILE="config/cv-config.typ"
fi

# Build both variants
echo "Building CV for: $JOB_NAME"
echo "Using config: $CONFIG_FILE"

typst compile \
  --input config="$CONFIG_FILE" \
  templates/CV.typ \
  "builds/$JOB_NAME/CV.pdf"

typst compile \
  --input config="$CONFIG_FILE" \
  templates/ATS_CV.typ \
  "builds/$JOB_NAME/ATS_CV.pdf"

echo "✓ Built: builds/$JOB_NAME/CV.pdf"
echo "✓ Built: builds/$JOB_NAME/ATS_CV.pdf"
```

### Advanced: AI-Powered Tailoring

**File**: `tailor-cv.py`

```python
#!/usr/bin/env python3
"""
AI-powered CV tailoring based on job description
"""

import sys
import json
from pathlib import Path

def analyze_job_description(job_desc_file):
    """Extract keywords and requirements from job description"""
    # Use NLP/LLM to extract:
    # - Required skills
    # - Nice-to-have skills
    # - Experience level
    # - Domain/industry
    # - Key responsibilities
    pass

def rank_resources(resources, job_analysis):
    """Rank work/education resources by relevance to job"""
    # Score each resource based on:
    # - Tag overlap with job keywords
    # - Relevance scores
    # - Accomplishment impact
    # - Technology match
    pass

def generate_config(job_name, job_analysis, ranked_resources):
    """Generate Typst config file for tailored CV"""
    config = {
        "target": job_analysis,
        "work": ranked_resources["work"][:4],  # Top 4 most relevant
        "education": {
            "degrees": ranked_resources["degrees"],
            "certificates": ranked_resources["certificates"][:2]
        },
        "accomplishments": {
            "required_tags": job_analysis["keywords"][:10],
            "max_per_job": 2,
            "min_impact": "high"
        },
        "skills": {
            "highlight": job_analysis["required_skills"][:8]
        }
    }
    
    # Write to config file
    config_path = Path(f"config/tailored/{job_name}-config.typ")
    # Convert to Typst format
    pass

def main():
    if len(sys.argv) < 3:
        print("Usage: ./tailor-cv.py <job-name> <job-description.txt>")
        sys.exit(1)
    
    job_name = sys.argv[1]
    job_desc_file = sys.argv[2]
    
    # Analyze job description
    job_analysis = analyze_job_description(job_desc_file)
    
    # Load all resources
    resources = load_all_resources()
    
    # Rank by relevance
    ranked = rank_resources(resources, job_analysis)
    
    # Generate config
    config_file = generate_config(job_name, job_analysis, ranked)
    
    # Build CV
    import subprocess
    subprocess.run(["./build-cv.sh", job_name, config_file])

if __name__ == "__main__":
    main()
```

## Typst Style Guidelines

### Color Scheme

```typst
#let primary-color = rgb("#1E3A8A")
#let accent-color = rgb("#3B82F6")
#let neutral-color = rgb("#64748B")
#let text-color = rgb("#1F2937")
#let light-gray = rgb("#F3F4F6")
```

### Custom Functions

**Load and render job:**
```typst
#let include-job(filename) = {
  let job_data = include("../resources/work/" + filename)
  job_data.job
}

#let should-include(job_data, config) = {
  // Check if job matches filters
  if "filters" in config and "required_tags" in config.filters {
    // Check tag overlap
  }
  true
}

#let render-job(job, config) = {
  // Select accomplishments based on config
  let accomplishments = select-accomplishments(job.accomplishments, config)
  
  job-entry(
    job.position,
    job.company,
    job.start_date + " - " + job.end_date,
    job.description,
    accomplishments.map(a => a.text)
  )
}
```

## Best Practices

### Resource Files

1. **Comprehensive data**: Include all accomplishments, even minor ones
2. **Rich tagging**: Use detailed tags for better filtering
3. **Quantify impact**: Include metrics and numbers
4. **Multiple descriptions**: Short and long versions
5. **Relevance scores**: Help automatic ranking

### Configuration

1. **Job-specific configs**: Create new config for each application
2. **Keyword matching**: Align with job description
3. **Prioritize impact**: Show highest-impact accomplishments
4. **Skill highlighting**: Match required skills

### Version Control

```gitignore
# Build outputs
builds/

# Keep configs for tracking
!config/

# Keep resources
!resources/
```

## Common Tasks

### Adding a new job

1. Create file: `resources/work/YYYY-MM-company-position.typ`
2. Fill in all fields with comprehensive data
3. Add to relevant configs

### Tailoring for a job

```bash
# Option 1: Manual config
# 1. Create config/tailored/job-name-config.typ
# 2. Select relevant resources and accomplishments
# 3. Build
./build-cv.sh job-name config/tailored/job-name-config.typ

# Option 2: AI-assisted
./tailor-cv.py job-name job-description.txt
```

### Building full CV

```bash
./build-cv.sh full-cv config/cv-config.typ
```

## File Naming Conventions

**Work**: `YYYY-MM-company-slug-position-slug.typ`  
**Degrees**: `degree-YYYY-institution-slug-degree-slug.typ`  
**Certificates**: `certificate-YYYY-provider-slug-name-slug.typ`  
**Courses**: `course-YYYY-provider-slug-name-slug.typ`

**Slugs**: lowercase, hyphens, no special characters

## Testing

```bash
# Compile all resources (check for errors)
for file in resources/work/*.typ; do
  typst compile --input test=true "$file"
done

# Build test CV
./build-cv.sh test config/cv-config.typ

# Validate ATS
./validate-ats.sh builds/test/ATS_CV.pdf
```

## Additional Notes

- Resource files are Typst dictionaries, easily parsable
- Configuration system allows fine-grained control
- Build system supports both manual and AI-assisted tailoring
- Version control tracks all applications via configs
- Reusable resources reduce duplication
- Easy to maintain and update over time
