# Tailor CV Skill

This skill tailors both the One-Page CV (OP_CV) and ATS CV based on a job description.

## Inputs

- `job_description`: Either a URL to a job posting or a file path to a text file containing the job description
- `job_name`: (Optional) Name/slug for the output folder. If not provided, will be extracted from job title

## Process

1. **Extract Job Description**
   - If URL: Fetch the job posting content
   - If file path: Read the file content
   - Parse and extract key information:
     - Job title
     - Company name
     - Required skills/technologies
     - Key responsibilities
     - Required experience level
     - Keywords for ATS optimization

2. **Analyze Job Requirements**
   - Identify must-have vs nice-to-have skills
   - Extract industry/domain keywords
   - Identify relevant technologies
   - Determine experience level expectations
   - List key responsibilities and match to user's experience

3. **Select Relevant Work Experience**
   - Scan all work resources in `resources/work/`
   - Match job tags/keywords to work experience tags
   - Use relevance scores to rank experiences
   - Select top 3-5 most relevant positions
   - Prioritize recent and high-impact roles

4. **Filter Accomplishments**
   - For each selected job, filter accomplishments by:
     - Tag overlap with job requirements
     - Impact level (prioritize high)
     - Quantifiable achievements
     - Relevance to target role
   - Select 2-3 top accomplishments per job for OP_CV
   - Select 3-4 accomplishments per job for ATS_CV

5. **Select Education & Certifications**
   - Match education to job requirements
   - Prioritize relevant certifications
   - Include degree(s) most relevant to role
   - Select 1-2 most relevant certificates

6. **Generate Tailored Configuration**
   - Create a new config file: `config/tailored/{job-slug}-config.typ`
   - Include selected work experiences in priority order
   - Include filtered education/certifications
   - Set accomplishment filtering criteria
   - Add job-specific keywords for ATS

7. **Create Custom Template Instances**
   - Generate `templates/tailored/{job-slug}-OP_CV.typ` for one-page CV
   - Generate `templates/tailored/{job-slug}-ATS_CV.typ` for ATS version
   - Both templates import the tailored config
   - OP_CV: Concise, 1-page format with selected content
   - ATS_CV: More detailed, keyword-optimized format

8. **Compile CVs**
   - Compile OP_CV: `typst compile templates/tailored/{job-slug}-OP_CV.typ builds/{job-slug}/OP_CV.pdf`
   - Compile ATS_CV: `typst compile templates/tailored/{job-slug}-ATS_CV.typ builds/{job-slug}/ATS_CV.pdf`
   - Generate PNG previews for review
   - Save job description to `builds/{job-slug}/job-description.txt` for reference

9. **Summary Report**
   - Output summary of tailoring decisions:
     - Which jobs were selected and why
     - Which accomplishments were highlighted
     - Key skills/keywords matched
     - Suggestions for manual review
   - Location of generated files

## Output Structure

```
builds/{job-slug}/
├── OP_CV.pdf                    # One-page tailored CV
├── ATS_CV.pdf                   # ATS-optimized CV
├── OP_CV-preview.png            # Preview of one-page CV
├── ATS_CV-page-1.png            # Preview of ATS CV page 1
├── ATS_CV-page-2.png            # Preview of ATS CV page 2
├── job-description.txt          # Original job description
└── tailoring-report.md          # Summary of tailoring decisions

config/tailored/{job-slug}-config.typ       # Generated config
templates/tailored/{job-slug}-OP_CV.typ     # OP_CV template instance
templates/tailored/{job-slug}-ATS_CV.typ    # ATS_CV template instance
```

## Usage Examples

```bash
# Using a URL
/tailor-cv https://www.linkedin.com/jobs/view/12345

# Using a file
/tailor-cv job-descriptions/senior-ml-engineer.txt

# With custom job name
/tailor-cv job-descriptions/data-scientist.txt --name "google-data-scientist"
```

## Expected Behavior

The skill should:
- Be intelligent about matching experience to job requirements
- Prioritize quantifiable achievements
- Optimize keyword placement for ATS
- Keep OP_CV to exactly 1 page
- Provide clear summary of what was selected and why
- Save all artifacts for future reference

## Notes

- The skill should read all resource files to understand available content
- It should use the existing `render-job`, `render-education`, etc. functions from cv-common.typ
- The OP_CV should be more selective (fewer jobs, fewer bullets) than ATS_CV
- Both should be tailored but ATS_CV can be 2 pages if needed
