# Quick Start Guide - Resource-Based Typst CV System

## For AI Agents

Start here for a quick overview of the resource-based CV migration project.

## What We're Building

A modern, **resource-based CV system** in Typst that enables:

✨ **Separation of Content & Presentation**
- Each job, degree, certificate stored as individual file
- Comprehensive metadata for filtering and ranking
- Reusable across multiple CV variants

🎯 **Job-Specific Tailoring**
- Generate customized CVs for specific applications
- Select most relevant experiences automatically
- Match keywords from job descriptions

⚡ **Fast & Maintainable**
- Typst compilation < 1 second
- Update once, affects all CVs using it
- Easy to add new jobs/education

🤖 **Optional AI Enhancement**
- Auto-analyze job descriptions
- Rank resources by relevance
- Generate optimized configurations

## Architecture

```
resources/
  ├── personal-info.typ                    # Your info, skills, languages
  ├── work/                               # One file per job
  │   ├── 2018-12-arge-innovations-owner.typ
  │   ├── 2018-12-dfds-consultant.typ
  │   └── ...
  └── education/                          # Degrees, certificates
      ├── degree-2012-ku-msc-physics.typ
      ├── certificate-2017-coursera-dl.typ
      └── ...

templates/
  ├── cv-common.typ                       # Shared components
  ├── CV.typ                             # Standard CV template
  └── ATS_CV.typ                         # ATS-optimized template

config/
  ├── cv-config.typ                      # Full CV config
  └── tailored/                          # Job-specific configs
      └── senior-ds-config.typ

builds/                                   # Generated PDFs
  ├── full-cv/
  └── senior-data-scientist/

scripts/
  ├── build-cv.sh                        # Build script
  └── tailor-cv.py                       # AI tailoring (optional)
```

## Quick Commands

```bash
# Build full CV with all content
./scripts/build-cv.sh full-cv

# Build tailored CV (manual config)
./scripts/build-cv.sh job-name config/tailored/job-config.typ

# Build tailored CV (AI-powered)
./scripts/tailor-cv.py job-name job-description.txt
```

## Resource File Example

**Work experience** (`resources/work/2018-12-dfds-consultant.typ`):

```typst
#let job = (
  position: "Data Science Consultant",
  company: "DFDS A/S",
  start_date: "Dec. 2018",
  end_date: "May 2019",
  
  description: "Short summary for CV",
  description_long: "Detailed version with context...",
  
  accomplishments: (
    (
      text: "Reduced RMSE by 20%...",
      impact: "high",
      quantifiable: true,
      tags: ("machine-learning", "python"),
    ),
    // More accomplishments...
  ),
  
  technologies: ("Python", "Scikit-learn", "Docker"),
  tags: ("data-science", "ml", "optimization"),
  
  relevance: (
    "data-science": 10,
    "ml-engineering": 9,
  ),
)
```

## Workflow

### 1. Create Resources (One Time)

Extract content from LaTeX and create resource files:
- One file per job
- One file per degree/certificate
- Personal info file

### 2. Build Full CV

```bash
./scripts/build-cv.sh full-cv
# Output: builds/full-cv/CV.pdf
#         builds/full-cv/ATS_CV.pdf
```

### 3. Tailor for Specific Job

**Option A: Manual**
1. Copy `config/cv-config.typ` to `config/tailored/job-name-config.typ`
2. Edit to select relevant resources
3. Build: `./scripts/build-cv.sh job-name config/tailored/job-name-config.typ`

**Option B: AI-Assisted**
```bash
./scripts/tailor-cv.py senior-ml-engineer job-description.txt
# Analyzes job, ranks resources, generates config, builds CV
```

### 4. Update Content

Add new job:
```bash
vim resources/work/2026-01-newco-engineer.typ
# Fill in comprehensive data
# Add to relevant configs
./scripts/build-cv.sh full-cv
```

## Project Tickets

Read tickets in order:

1. **000-master-overview.md** ⭐ Start here - Full project plan
2. **001-extract-content.md** - Design resource schema
3. **002-create-resources.md** - Create all resource files
4. **003-common-functions.md** - Build shared components
5. **004-convert-cv-typ.md** - Create standard CV template
6. **005-convert-ats-cv-typ.md** - Create ATS template
7. **006-styling-refresh.md** - Apply modern design
8. **007-testing-validation.md** - Test and document
9. **008-build-scripts.md** - Create build system
10. **010-ai-tailoring.md** - AI-powered tailoring (optional)

## Timeline

- **Phase 1** (Foundation): Tickets 001-003 = 5-6 hours
- **Phase 2** (Templates): Tickets 004-006 = 5-6 hours
- **Phase 3** (Build & Test): Tickets 007-009 = 3-4 hours
- **Phase 4** (AI - Optional): Ticket 010 = 3-4 hours

**Total (Core)**: 13-16 hours  
**Total (with AI)**: 16-20 hours

## Key Benefits

### vs. Single CV File:

**Maintainability** ✅
- Update one job → affects all CVs
- No duplication
- Easy version control

**Tailoring** ✅
- Filter by tags/relevance
- Match job requirements
- Optimize for ATS

**Organization** ✅
- Clear structure
- Easy to find content
- Scalable

**Data Richness** ✅
- Store everything
- Filter later
- Long & short versions

## Example: Tailoring Workflow

```bash
# 1. Get job description
curl https://company.com/job/123 > job-desc.txt

# 2. Generate tailored CV with AI
./scripts/tailor-cv.py senior-ds-techcorp job-desc.txt

# Output:
# 📄 Parsing job description...
# 🤖 Analyzing with AI...
#    Position: Senior Data Scientist
#    Required skills: Python, ML, Deep Learning...
# 📊 Ranking resources...
#    Top: DFDS - Data Science Consultant
# ⚙️  Generating config...
# 🔨 Building CV...
# ✅ Success!
#    CV: builds/senior-ds-techcorp/CV.pdf
#    ATS: builds/senior-ds-techcorp/ATS_CV.pdf

# 3. Review and customize
vim config/tailored/senior-ds-techcorp-config.typ

# 4. Rebuild if needed
./scripts/build-cv.sh senior-ds-techcorp config/tailored/senior-ds-techcorp-config.typ
```

## Resource Schema Design

Each resource file has:
- **Basic info**: Position, company, dates, location
- **Descriptions**: Short & long versions
- **Accomplishments**: With impact levels, tags, metrics
- **Technologies**: Skills/tools used
- **Tags**: For filtering (e.g., "machine-learning", "python")
- **Relevance scores**: Ratings for different job types (1-10)

This metadata enables smart filtering and ranking!

## Success Criteria

✅ All content migrated to resources  
✅ Both CV templates compile  
✅ Can build full CV  
✅ Can build tailored CV  
✅ Modern professional design  
✅ ATS compatible (>80%)  
✅ Build time < 1 second  
✅ Easy to maintain  

## Need Help?

1. **Read the master overview**: `.ticket/000-master-overview.md`
2. **Check AGENTS.md**: Technical guidelines and examples
3. **Follow tickets sequentially**: Don't skip ahead
4. **Test frequently**: Compile often to catch errors
5. **Document decisions**: Update ticket files

## Tips for Success

- **Start simple**: Core system first, AI later
- **Test early**: Compile resources as you create them
- **Be comprehensive**: Include all accomplishments in resources
- **Use metadata**: Rich tags and scores enable better tailoring
- **Iterate**: Build full CV first, then try tailoring

## Next Steps

1. **Read** `.ticket/000-master-overview.md` for complete context
2. **Review** `AGENTS.md` for technical specifications
3. **Start** with Ticket 001 (content extraction & schema design)
4. **Work** through tickets sequentially
5. **Build** incrementally and test often

---

**Ready to begin?** → Open `.ticket/000-master-overview.md`

**Quick reference?** → See `AGENTS.md` for code examples

**Implementation details?** → Read individual ticket files
