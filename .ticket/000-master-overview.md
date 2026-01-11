# Ticket 000: Master Overview - Resource-Based Typst CV System

**Status**: OPEN  
**Priority**: HIGH  
**Created**: 2026-01-08  
**Updated**: 2026-01-08  
**Assignee**: AI Agent  

## Objective

Build a modern, resource-based CV system in Typst that allows creating tailored CVs for specific job applications. The system separates content (resources) from presentation (templates), enabling easy customization and reuse.

## System Architecture

```
resources/
  ├── personal-info.typ          # Personal details, skills, languages
  ├── work/                      # Individual job files
  │   ├── 2018-12-arge-innovations-owner.typ
  │   ├── 2018-12-dfds-data-science-consultant.typ
  │   └── ...
  └── education/                 # Degrees, courses, certificates
      ├── degree-2012-ku-msc-physics.typ
      ├── certificate-2017-coursera-deep-learning.typ
      └── ...

templates/
  ├── cv-common.typ              # Shared components
  ├── CV.typ                     # Standard CV template
  └── ATS_CV.typ                 # ATS-optimized template

config/
  ├── cv-config.typ              # Full CV configuration
  └── tailored/                  # Job-specific configs
      ├── senior-ds-config.typ
      └── ...

builds/                          # Generated PDFs (gitignored)
  ├── full-cv/
  ├── senior-data-scientist/
  └── ...

scripts/
  ├── build-cv.sh                # Build script
  └── tailor-cv.py               # AI-powered tailoring (optional)
```

## Key Features

1. **Resource-Based Content**: Each job, degree, certificate as separate file
2. **Rich Metadata**: Tags, relevance scores, impact levels for filtering
3. **Configurable**: Select which resources to include via config files
4. **Tailorable**: Generate job-specific CVs automatically
5. **Two Variants**: Standard and ATS-optimized outputs
6. **Version Controlled**: Track which config was used for each application

## Sub-Tickets

### Phase 1: Foundation (4-5 hours)
- [ ] **Ticket 001**: Extract Content and Design Resource Schema
- [ ] **Ticket 002**: Create Directory Structure and Resource Files
- [ ] **Ticket 003**: Build Common Components Module

### Phase 2: Templates (4-5 hours)
- [ ] **Ticket 004**: Create CV Template with Resource Loading
- [ ] **Ticket 005**: Create ATS CV Template
- [ ] **Ticket 006**: Implement Configuration System

### Phase 3: Build System (3-4 hours)
- [ ] **Ticket 007**: Create Build Scripts
- [ ] **Ticket 008**: Design Modern Styling
- [ ] **Ticket 009**: Testing and Documentation

### Phase 4: Tailoring (Optional, 3-4 hours)
- [ ] **Ticket 010**: Implement AI-Powered CV Tailoring

## Success Criteria

- [ ] All content migrated to resource files
- [ ] Both CV templates compile successfully
- [ ] Can generate full CV with all content
- [ ] Can generate tailored CV for specific job
- [ ] Build system works smoothly (< 1 second compile)
- [ ] Modern, professional design
- [ ] ATS compatibility verified (>80% score)
- [ ] Comprehensive documentation
- [ ] Easy to add new jobs/education
- [ ] Easy to create tailored CVs

## Dependencies

- Typst v0.10.0 or higher
- Bash for build scripts
- Python 3.8+ (optional, for AI tailoring)
- Image assets (workpicture.png, etc.)

## Timeline Estimate

### Phase 1: Foundation
- Ticket 001: 2 hours (content extraction + schema design)
- Ticket 002: 1.5 hours (create all resource files)
- Ticket 003: 1.5 hours (common components)

### Phase 2: Templates  
- Ticket 004: 2 hours (CV template with loading logic)
- Ticket 005: 1.5 hours (ATS template)
- Ticket 006: 1 hour (configuration system)

### Phase 3: Build & Polish
- Ticket 007: 1 hour (build scripts)
- Ticket 008: 2 hours (modern styling)
- Ticket 009: 2 hours (testing & docs)

### Phase 4: Optional Enhancement
- Ticket 010: 3-4 hours (AI tailoring system)

**Total (without AI)**: 14-16 hours  
**Total (with AI)**: 17-20 hours

## Benefits of Resource-Based Approach

### Compared to Single CV File:

**Maintainability:**
- ✅ Update one job file affects all CVs using it
- ✅ Add new job without touching CV template
- ✅ Easy to version control changes

**Tailoring:**
- ✅ Select relevant experiences per job
- ✅ Filter accomplishments by tags/impact
- ✅ Automatically rank by relevance
- ✅ Match keywords from job description

**Reusability:**
- ✅ Same resource files for multiple CV variants
- ✅ Share common styling across all builds
- ✅ Create unlimited tailored versions

**Data Richness:**
- ✅ Store comprehensive data in resources
- ✅ Include all accomplishments (filter later)
- ✅ Metadata enables smart selection
- ✅ Long and short descriptions available

**Organization:**
- ✅ Clear file structure
- ✅ Easy to find and update content
- ✅ Logical grouping by type
- ✅ Scalable to many jobs/education items

## Workflow Examples

### Creating a Tailored CV

**Manual approach:**
```bash
# 1. Create config for specific job
vim config/tailored/senior-ml-engineer-config.typ

# 2. Select relevant resources and customize filters
# 3. Build
./build-cv.sh senior-ml-engineer config/tailored/senior-ml-engineer-config.typ
```

**AI-assisted approach:**
```bash
# 1. Get job description
curl https://job-site.com/posting > job-desc.txt

# 2. Auto-generate tailored CV
./tailor-cv.py senior-ml-engineer job-desc.txt

# Output: builds/senior-ml-engineer/{CV.pdf, ATS_CV.pdf}
```

### Adding New Job

```bash
# 1. Create resource file
vim resources/work/2026-01-company-position.typ

# 2. Fill in comprehensive data
# 3. Add to config files where relevant
# 4. Rebuild CVs
./build-cv.sh full-cv
```

### Updating Existing Content

```bash
# Edit resource file
vim resources/work/2018-12-dfds-data-science-consultant.typ

# Rebuild all CVs using this resource
./build-cv.sh full-cv
./build-cv.sh senior-ds
# All CVs automatically updated!
```

## Migration Strategy

1. **Phase 1**: Extract and structure content
   - Parse LaTeX files
   - Create resource file schema
   - Migrate all content to resources

2. **Phase 2**: Build templates
   - Create loading/filtering logic
   - Implement CV templates
   - Build configuration system

3. **Phase 3**: Styling and polish
   - Apply modern design
   - Test compilation
   - Validate ATS compatibility

4. **Phase 4** (Optional): AI enhancement
   - Implement keyword extraction
   - Build relevance ranking
   - Create auto-tailoring script

## File Naming Standards

**Work resources:**
`YYYY-MM-company-slug-position-slug.typ`

Examples:
- `2018-12-arge-innovations-owner.typ`
- `2017-02-atp-data-scientist.typ`

**Education resources:**
`[type]-YYYY-institution-slug-name-slug.typ`

Examples:
- `degree-2012-ku-msc-physics.typ`
- `certificate-2017-coursera-deep-learning.typ`
- `course-2018-coursera-social-network-analysis.typ`

**Build outputs:**
`builds/[job-name]/{CV.pdf, ATS_CV.pdf}`

## Configuration Tracking

Keep a log of which config was used for each application:

```
applications.md:
## Senior Data Scientist - Tech Corp
- Date applied: 2026-01-15
- Config: config/tailored/senior-ds-techcorp-config.typ
- Built: builds/senior-ds-techcorp/
- Status: Interview scheduled

## ML Engineer - AI Startup
- Date applied: 2026-01-20
- Config: config/tailored/ml-engineer-aistartup-config.typ
- Built: builds/ml-engineer-aistartup/
- Status: Applied
```

## Quality Gates

Before considering this project complete:

- [ ] All LaTeX content migrated to resources
- [ ] At least 4 work resources created
- [ ] At least 3 education resources created
- [ ] Both templates compile without errors
- [ ] Full CV builds successfully
- [ ] One tailored CV builds successfully
- [ ] Build time < 1 second per CV
- [ ] ATS score > 80%
- [ ] Modern, professional styling
- [ ] Complete documentation
- [ ] Build scripts work reliably

## Notes

- Start with Phase 1-3 (core functionality)
- Phase 4 (AI tailoring) is optional but valuable
- Resource schema is critical - design carefully
- Configuration system should be flexible
- Build scripts should be simple and reliable
- Test frequently during development

## Related Documentation

- `AGENTS.md` - Complete technical guidelines
- `.ticket/README.md` - Ticket system overview
- `.ticket/QUICKSTART.md` - Quick start guide

## Success Metrics

- **Build speed**: < 1 second per CV
- **Flexibility**: Can generate 5+ different tailored CVs from same resources
- **Maintainability**: Add new job in < 5 minutes
- **Quality**: Professional output matching or exceeding LaTeX version
- **ATS Score**: > 80% on automated tests
- **Ease of use**: Non-technical user can create tailored CV
