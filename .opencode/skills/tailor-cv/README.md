# Tailor CV Skill

Automatically tailor your CV for specific job applications using AI analysis.

## Overview

This skill analyzes job descriptions and generates two tailored CVs:
1. **OP_CV** (One-Page CV): Concise, single-page CV highlighting most relevant experience
2. **ATS_CV**: ATS-optimized version with more details, keyword-rich (1-2 pages)

## Usage

### From a job description file:

```bash
/tailor-cv test-jobs/senior-ml-engineer.txt
```

### From a URL:

```bash
/tailor-cv https://www.linkedin.com/jobs/view/12345678
```

### With a custom job name:

```bash
/tailor-cv test-jobs/data-scientist.txt google-ds
```

## What It Does

The skill will:

1. **Analyze the job description** to extract:
   - Job title and company
   - Required and preferred skills
   - Key responsibilities
   - Technologies mentioned
   - ATS keywords

2. **Match your experience** by:
   - Reading all work resources in `resources/work/`
   - Calculating relevance scores based on tags, technologies, and accomplishments
   - Selecting top 3-4 most relevant positions

3. **Filter accomplishments** by:
   - Tag overlap with job requirements
   - Impact level (high priority)
   - Quantifiability (prefer metrics)
   - Relevance to target role

4. **Generate tailored templates**:
   - `config/tailored/{job-slug}-config.typ` - Configuration
   - `templates/tailored/{job-slug}-OP_CV.typ` - One-page CV template
   - `templates/tailored/{job-slug}-ATS_CV.typ` - ATS CV template

5. **Compile both CVs** to PDF with previews

6. **Create a report** explaining tailoring decisions

## Output Structure

After running the skill, you'll find:

```
builds/{job-slug}/
├── OP_CV.pdf                    # One-page tailored CV ⭐
├── ATS_CV.pdf                   # ATS-optimized CV ⭐
├── OP_CV-preview.png            # Preview image
├── ATS_CV-page-1.png            # Preview page 1
├── ATS_CV-page-2.png            # Preview page 2 (if 2 pages)
├── job-description.txt          # Original job posting
└── tailoring-report.md          # Detailed report ⭐

config/tailored/{job-slug}-config.typ       # Generated config
templates/tailored/{job-slug}-OP_CV.typ     # OP_CV template
templates/tailored/{job-slug}-ATS_CV.typ    # ATS_CV template
```

## Key Features

### Intelligent Matching
- Uses tag overlap, relevance scores, and keyword matching
- Prioritizes recent and high-impact experience
- Considers both required and preferred skills

### One-Page Optimization
- OP_CV is guaranteed to fit on exactly 1 page
- Ruthlessly selects only most relevant content
- Compact formatting without losing readability

### ATS Optimization
- Extracts and includes exact keywords from job posting
- Uses ATS-friendly formatting
- Optimizes section headers and structure
- More detailed than OP_CV (can be 2 pages)

### Comprehensive Reporting
- Explains why each job was selected/excluded
- Shows matching tags and relevance scores
- Provides recommendations for manual review
- Documents all tailoring decisions

## Examples

### Example 1: ML Engineer Role

```bash
/tailor-cv test-jobs/senior-ml-engineer.txt
```

**Expected output:**
- Selects: DFDS (ML models), ATP (predictive analytics), Arge Innovations (ML consulting)
- Highlights: Python, Machine Learning, TensorFlow, Optimization
- Accomplishments: Focus on model performance improvements, deployment, quantifiable metrics
- Education: M.Sc. Physics (computational ML focus)
- Certificates: Deep Learning Specialization

### Example 2: Data Science Consultant

```bash
/tailor-cv https://company.com/jobs/data-scientist consulting-role
```

**Expected output:**
- Selects: Consulting-heavy roles (DFDS, ATP, Arge Innovations)
- Highlights: Project delivery, stakeholder management, business impact
- Accomplishments: Client-facing results, business value, team collaboration
- Skills: Communication, problem-solving alongside technical skills

## Tips

1. **Review the report first**: Check `tailoring-report.md` to understand the AI's decisions
2. **Verify accomplishments**: Make sure selected accomplishments accurately represent your work
3. **Check keywords**: Ensure ATS_CV includes exact keyword matches from job posting
4. **Customize further**: You can manually edit the generated config and re-compile
5. **Test both versions**: Some companies prefer concise (OP_CV), others prefer detailed (ATS_CV)

## Customization

### Manual adjustments

After generation, you can edit:

```typst
// config/tailored/{job-slug}-config.typ

// Change which jobs to include
work: (
  "2018-12-company1.typ",  // Keep
  "2017-02-company2.typ",  // Keep
  // "2016-09-company3.typ",  // Commented out - excluded
),

// Adjust accomplishment filters
op_cv: (
  max_accomplishments_per_job: 3,  // Increase to 3 if you want more bullets
),
```

Then re-compile:

```bash
./build-cv.sh tailored/{job-slug}-OP_CV builds/{job-slug}
./build-cv.sh tailored/{job-slug}-ATS_CV builds/{job-slug}
```

## Requirements

- Typst installed (`brew install typst` or from https://typst.app)
- All work resources in `resources/work/` properly formatted
- Personal info in `resources/personal-info.typ` up to date
- Education/certs in `resources/education/` properly tagged

## Troubleshooting

**"OP_CV is 2 pages"**
- Edit config to reduce `max_jobs` or `max_accomplishments_per_job`
- The skill should prevent this, but you can manually adjust

**"Selected jobs don't seem relevant"**
- Check if your work resource files have proper tags
- Review relevance scores in work resources
- Manually edit the config to include/exclude specific jobs

**"Missing keywords in ATS_CV"**
- Check `tailoring-report.md` for identified keywords
- Keywords are automatically extracted, but you can add more in the config

**"Compilation errors"**
- Ensure all referenced work/education files exist
- Check for typos in filenames in the config
- Run `typst compile --diagnostic-format=short <template>` for details

## Advanced Usage

### Tailor for multiple similar roles

```bash
/tailor-cv job1.txt company1-ml-engineer
/tailor-cv job2.txt company2-ml-engineer
/tailor-cv job3.txt company3-ml-engineer
```

Each gets its own configuration and outputs.

### Compare tailoring decisions

```bash
diff builds/company1-ml-engineer/tailoring-report.md \
     builds/company2-ml-engineer/tailoring-report.md
```

See how different job postings led to different selections.

### Batch process multiple jobs

Create a script:

```bash
#!/bin/bash
for job in test-jobs/*.txt; do
  name=$(basename "$job" .txt)
  /tailor-cv "$job" "$name"
done
```

## Future Enhancements

Planned features:
- [ ] Interactive mode to approve/reject AI decisions
- [ ] A/B testing of different configurations
- [ ] Skills gap analysis (what you're missing vs job requirements)
- [ ] Cover letter generation based on tailored CV
- [ ] LinkedIn profile optimization matching CV
- [ ] Automatic application tracking

## Contributing

If you want to improve the skill:
1. The core logic is in `prompt.md` (agent instructions)
2. Helper scripts in `tailor_cv.py` and `handler.sh`
3. Test with `test-jobs/` examples
4. Share your improvements!

## License

Free to use and modify for your personal CV tailoring needs.
