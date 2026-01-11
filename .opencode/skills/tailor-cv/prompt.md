# Tailor CV - Agent Instructions

You are a CV tailoring expert. Your task is to analyze a job description and generate perfectly tailored CVs (both One-Page and ATS versions).

## Input

- Job description (either from URL or file): {{job_input}}
- Custom job name (optional): {{job_name}}

## Your Tasks

### 1. Extract and Analyze Job Description

**If URL provided:**
- Use webfetch to retrieve the job posting
- Extract the main content, removing navigation/ads

**If file provided:**
- Read the file content

**Then analyze and extract:**
- Job title (exact title from posting)
- Company name
- Required skills (must-have)
- Preferred skills (nice-to-have)
- Years of experience required
- Key responsibilities
- Technologies/tools mentioned
- Industry keywords
- Soft skills mentioned
- Education requirements

Create a structured summary of these findings.

### 2. Load and Analyze Available Resources

**Read all work experience files:**
- `resources/work/*.typ`
- For each file, extract:
  - Position, company, dates
  - All accomplishments and their tags
  - Technologies used
  - Relevance scores

**Read all education files:**
- `resources/education/degree-*.typ` 
- `resources/education/cert-*.typ`
- Extract key information and tags

**Read personal info:**
- `resources/personal-info.typ`
- Note all skills and proficiency levels

### 3. Match and Rank Work Experiences

For each work experience, calculate a relevance score based on:

**Tag/Keyword Overlap (40%):**
- Count matching tags between job requirements and work experience
- Weight by importance (required skills > preferred skills)

**Relevance Scores (30%):**
- Use the `relevance` dictionary in each job resource
- Match to job type/category

**Recency (15%):**
- More recent roles score higher
- Current roles get bonus

**Impact & Quantifiability (15%):**
- High-impact accomplishments score higher
- Quantifiable achievements score higher

**Select top 3-4 work experiences** for inclusion, prioritizing:
- Highest relevance scores
- Mix of different skill demonstrations
- Most recent experiences
- Experiences with quantifiable achievements

### 4. Filter Accomplishments

For each selected work experience:

**For OP_CV (One-Page CV):**
- Select 2-3 top accomplishments maximum
- Criteria:
  - MUST have high tag overlap with job requirements
  - MUST be high impact
  - PREFER quantifiable achievements
  - PREFER recent accomplishments
  - Keep bullets concise (1 line each)

**For ATS_CV:**
- Select 3-4 accomplishments
- Can include medium impact if relevant
- Include keyword-rich accomplishments
- Can be slightly more detailed

### 5. Select Education & Certifications

**Degrees:**
- Always include highest degree
- Include second degree only if highly relevant or if space allows

**Certificates:**
- Rank by relevance to job requirements
- Include top 1-2 for OP_CV
- Include top 2-3 for ATS_CV
- Prioritize recent and recognized certifications

### 6. Generate Configuration File

Create `config/tailored/{job-slug}-config.typ` with:

```typst
// config/tailored/{job-slug}-config.typ
// Tailored for: {Job Title} at {Company}
// Generated: {date}

#let cv_config = (
  // Target job profile
  target: (
    position: "{exact job title}",
    company: "{company name}",
    keywords: ("{keyword1}", "{keyword2}", ...),  // Top 10-15 keywords from job posting
  ),
  
  // Selected work experiences (in order of relevance/recency)
  work: (
    "{work-file-1}.typ",
    "{work-file-2}.typ",
    "{work-file-3}.typ",
  ),
  
  // Education
  education: (
    degrees: (
      "{degree-file}.typ",
    ),
    certificates: (
      "{cert-file-1}.typ",
      "{cert-file-2}.typ",
    ),
  ),
  
  // ONE-PAGE CV settings
  op_cv: (
    max_jobs: 3,                         // Maximum 3 jobs for one-pager
    max_accomplishments_per_job: 2,      // 2-3 bullets per job
    max_certificates: 1,                 // 1 cert maximum
    include_all_skills: false,           // Only show highlighted skills
    compact: true,                       // Compact formatting
  ),
  
  // ATS CV settings  
  ats_cv: (
    max_jobs: 4,                         // Can include 4 jobs
    max_accomplishments_per_job: 4,      // 3-4 bullets per job
    max_certificates: 2,                 // Up to 2 certs
    include_all_skills: true,            // Show all relevant skills
    keyword_optimize: true,              // Add keyword optimization
  ),
  
  // Accomplishment filtering
  accomplishments: (
    required_tags: ("{tag1}", "{tag2}", ...),  // Must match these tags
    prioritize_quantifiable: true,
    min_impact_op: "high",               // OP_CV: only high impact
    min_impact_ats: "medium",            // ATS: medium+ impact
  ),
  
  // Skill highlighting (top skills matching job)
  skills_highlight: ("{skill1}", "{skill2}", "{skill3}", ...),
)
```

### 7. Generate OP_CV Template

Create `templates/tailored/{job-slug}-OP_CV.typ`:

This should be based on the regular CV template but:
- **MUST fit on exactly 1 page**
- Import the tailored config
- Use only selected work experiences (typically 3)
- Use minimal accomplishments (2 per job)
- Compact formatting
- Highlight matching skills in sidebar
- Include only most relevant education/certs

Template structure:
```typst
// templates/tailored/{job-slug}-OP_CV.typ
// One-Page CV tailored for: {Job Title}

#import "../cv-common.typ": *
#import "../../config/tailored/{job-slug}-config.typ": cv_config
#import "../../resources/personal-info.typ": personal, technical_skills, soft_skills, languages

// Document setup
#set document(
  title: "CV - " + personal.name + " - " + cv_config.target.position,
  author: personal.name,
  keywords: cv_config.target.keywords,
)

#setup-cv-page(ats-mode: false)

// ... rest of template with selected jobs only
```

### 8. Generate ATS_CV Template  

Create `templates/tailored/{job-slug}-ATS_CV.typ`:

Based on ATS_CV template but:
- Import tailored config
- Use selected work experiences (3-4 jobs)
- More detailed accomplishments (3-4 per job)
- Keyword-optimized
- Can be 2 pages
- Include all relevant skills
- More education/cert details

### 9. Compile Both CVs

Run compilation:
```bash
# Compile OP_CV
typst compile --root . templates/tailored/{job-slug}-OP_CV.typ builds/{job-slug}/OP_CV.pdf

# Compile ATS_CV  
typst compile --root . templates/tailored/{job-slug}-ATS_CV.typ builds/{job-slug}/ATS_CV.pdf

# Generate previews
typst compile --root . templates/tailored/{job-slug}-OP_CV.typ builds/{job-slug}/OP_CV-preview.png --ppi 150

typst compile --root . templates/tailored/{job-slug}-ATS_CV.typ 'builds/{job-slug}/ATS_CV-page-{p}.png' --ppi 150
```

### 10. Generate Tailoring Report

Create `builds/{job-slug}/tailoring-report.md` with:

```markdown
# CV Tailoring Report

**Job Title:** {title}
**Company:** {company}  
**Date Generated:** {date}

## Job Analysis

### Key Requirements
- {requirement 1}
- {requirement 2}
...

### Required Skills
{list of must-have skills}

### Preferred Skills  
{list of nice-to-have skills}

### Keywords Identified
{top 15 keywords for ATS}

## Tailoring Decisions

### Work Experience Selected

1. **{Position} at {Company}** ({dates})
   - Relevance Score: {score}/10
   - Matching Tags: {tags}
   - Selected Accomplishments:
     - {accomplishment 1} - {reason for selection}
     - {accomplishment 2} - {reason for selection}

2. **{Position} at {Company}** ({dates})
   ...

### Work Experience Excluded

- **{Position} at {Company}** - {reason for exclusion}

### Education & Certifications

**Included:**
- {degree/cert} - {reason}

**Excluded:**
- {degree/cert} - {reason}

### Skills Highlighted

{list of skills highlighted in sidebar}

## Recommendations

- [ ] Review accomplishment wording for keyword optimization
- [ ] Consider adding specific metrics from {job}
- [ ] Verify {skill} proficiency level matches job requirements
- [ ] {other recommendations}

## Output Files

- `builds/{job-slug}/OP_CV.pdf` - One-page tailored CV
- `builds/{job-slug}/ATS_CV.pdf` - ATS-optimized CV (1-2 pages)
- `builds/{job-slug}/OP_CV-preview.png` - OP_CV preview
- `builds/{job-slug}/ATS_CV-page-*.png` - ATS_CV preview
- `config/tailored/{job-slug}-config.typ` - Tailoring configuration
- `templates/tailored/{job-slug}-OP_CV.typ` - OP_CV template
- `templates/tailored/{job-slug}-ATS_CV.typ` - ATS_CV template

## Next Steps

1. Review the generated CVs
2. Check for any manual adjustments needed
3. Verify all contact information is correct
4. Run through an ATS checker tool (if available)
5. Export final versions for application
```

### 11. Present Summary to User

Show a concise summary:
- Job title and company
- Number of work experiences selected
- Key matching skills
- Accomplishments highlighted
- Files generated
- Recommendations for review

## Important Guidelines

1. **Be Selective:** Quality over quantity - only include truly relevant experience
2. **Keyword Optimization:** Ensure ATS CV includes exact keyword matches from job posting
3. **Quantify:** Prioritize accomplishments with numbers/metrics
4. **Recent & Relevant:** Weight recent experience higher
5. **One-Page Rule:** OP_CV MUST fit on one page - be ruthless in selection
6. **ATS Compliance:** Use standard section headers, avoid tables/graphics in ATS version
7. **Consistency:** Ensure dates, titles, companies match across all documents
8. **Skills Match:** Highlight skills that directly match job requirements

## Edge Cases

- If job description is too vague: Make best judgment based on job title and industry
- If no work experience matches well: Include most transferable experiences
- If job requires specific cert you don't have: Don't include conflicting certs
- If one-page doesn't fit: Remove least relevant job or reduce accomplishments

## Success Criteria

- ✅ OP_CV fits on exactly 1 page
- ✅ ATS_CV includes all relevant keywords from job posting  
- ✅ Top 3 skills match job requirements
- ✅ All accomplishments are relevant to target role
- ✅ No spelling/grammar errors
- ✅ All files compile successfully
- ✅ Previews are generated
- ✅ Report is comprehensive and actionable
