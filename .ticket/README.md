# .ticket/ - Resource-Based CV System Tracking

This folder contains detailed tickets for building a modern, resource-based Typst CV system with job-specific tailoring capabilities.

## System Overview

**What we're building:**
A CV system where content (resources) is separated from presentation (templates), enabling:
- Easy updates (change once, update everywhere)
- Job-specific tailoring (select relevant content)
- AI-powered optimization (match job requirements)
- Version control (track what config was used when)

## Ticket List

### 📋 Planning & Setup (Phase 1)

**000 - Master Overview** 🎯  
**Status**: OPEN | **Priority**: HIGH  
Complete project plan with architecture, timeline (14-20 hours), and success criteria.

**001 - Extract Content and Design Resource Schema**  
**Status**: OPEN | **Priority**: HIGH | **Depends on**: None  
Extract all CV content from LaTeX and design comprehensive resource file schema with metadata for filtering.

**002 - Create Directory Structure and Resource Files**  
**Status**: OPEN | **Priority**: HIGH | **Depends on**: 001  
Create folder structure and migrate all content to individual resource files (work, education, personal info).

**003 - Build Common Components Module**  
**Status**: OPEN | **Priority**: MEDIUM | **Depends on**: 002 (updated - will need to modify)  
Create `cv-common.typ` with shared functions for loading resources, rendering sections, and filtering content.

### 🎨 Templates & Configuration (Phase 2)

**004 - Create CV Template with Resource Loading**  
**Status**: OPEN | **Priority**: HIGH | **Depends on**: 001, 002, 003 (updated)  
Build standard CV template that loads resources dynamically based on configuration.

**005 - Create ATS CV Template**  
**Status**: OPEN | **Priority**: HIGH | **Depends on**: 001, 002, 003, 004 (updated)  
Build ATS-optimized single-column template with competency tags and simple formatting.

**006 - Implement Configuration System**  
**Status**: OPEN | **Priority**: HIGH | **Depends on**: 004, 005 (NEW TICKET)  
Create configuration system for selecting resources, filtering accomplishments, and highlighting skills.

### 🚀 Build System & Polish (Phase 3)

**007 - Create Build Scripts**  
**Status**: OPEN | **Priority**: HIGH | **Depends on**: 006 (NEW TICKET)  
Implement `build-cv.sh` for compiling CVs with different configurations.

**008 - Implement Modern Styling** (formerly 006)  
**Status**: OPEN | **Priority**: MEDIUM | **Depends on**: 004, 005  
Apply modern design enhancements: colors, typography, spacing, visual hierarchy.

**009 - Testing, Validation, and Documentation** (formerly 007)  
**Status**: OPEN | **Priority**: HIGH | **Depends on**: 007, 008  
Comprehensive testing, ATS validation, and complete documentation.

### 🤖 Optional Enhancement (Phase 4)

**010 - Implement AI-Powered CV Tailoring**  
**Status**: OPEN | **Priority**: MEDIUM (Optional) | **Depends on**: 002, 007  
Build AI system to analyze job descriptions, rank resources, and generate optimized configurations.

## Ticket Dependencies

```
001 Extract & Design Schema
  ↓
002 Create Resources
  ↓
003 Common Components
  ↓ ↓
004 CV Template    005 ATS Template
  ↓               ↓
  └─────┬─────────┘
        ↓
006 Configuration System
        ↓
007 Build Scripts
        ↓
008 Modern Styling
        ↓
009 Testing & Docs
        
(Optional: 010 AI Tailoring - depends on 002, 007)
```

## New Architecture

### Directory Structure

```
resources/
  ├── personal-info.typ          # Contact, skills, summary
  ├── work/                      # One file per job
  │   ├── 2018-12-arge-innovations-owner.typ
  │   ├── 2018-12-dfds-data-science-consultant.typ
  │   └── 2017-02-atp-data-scientist.typ
  └── education/                 # Degrees, certificates
      ├── degree-2012-ku-msc-physics.typ
      └── certificate-2017-coursera-deep-learning.typ

templates/
  ├── cv-common.typ              # Shared components
  ├── CV.typ                     # Standard template
  └── ATS_CV.typ                 # ATS template

config/
  ├── cv-config.typ              # Full CV config
  └── tailored/                  # Job-specific
      ├── senior-ds-config.typ
      └── ml-engineer-config.typ

builds/                          # Output PDFs (gitignored)
  ├── full-cv/
  ├── senior-data-scientist/
  └── ml-engineer/

scripts/
  ├── build-cv.sh                # Bash build script
  ├── tailor-cv.py               # AI tailoring (optional)
  └── README.md                  # Scripts documentation
```

### Resource File Format

**Work experience**:
```typst
#let job = (
  position: "Data Science Consultant",
  company: "DFDS A/S",
  start_date: "Dec. 2018",
  end_date: "May 2019",
  description: "Short summary",
  description_long: "Detailed version...",
  
  accomplishments: (
    (
      text: "Reduced RMSE by 20%...",
      impact: "high",           // high, medium, low
      quantifiable: true,
      tags: ("ml", "python"),
    ),
  ),
  
  technologies: ("Python", "Docker"),
  tags: ("data-science", "ml"),
  
  relevance: (
    "data-science": 10,
    "ml-engineering": 9,
  ),
)
```

## How to Use These Tickets

### 1. Read the Master Overview
Start with `000-master-overview.md` for complete context.

### 2. Work Sequentially
Follow tickets in order: 001 → 002 → 003 → 004 → 005 → 006 → 007 → 008 → 009

(010 is optional and can be done after 009)

### 3. Check Dependencies
Each ticket lists what it depends on. Don't start until dependencies are complete.

### 4. Complete Tasks
Each ticket has a checklist. Mark items complete as you finish:
```markdown
- [x] Completed task
- [ ] Pending task
```

### 5. Create Deliverables
Each ticket specifies files to create. Ensure all deliverables are produced.

### 6. Update Status
Change ticket status in the markdown:
```markdown
**Status**: OPEN        # Not started
**Status**: IN PROGRESS # Currently working  
**Status**: DONE        # Completed
```

## Timeline

### Phase 1: Foundation (5-6 hours)
- Ticket 001: Extract content & design schema (2-3 hours)
- Ticket 002: Create resource files (1.5-2 hours)
- Ticket 003: Common components (1.5 hours)

### Phase 2: Templates (5-6 hours)
- Ticket 004: CV template (2 hours)
- Ticket 005: ATS template (1.5 hours)
- Ticket 006: Configuration system (1 hour)

### Phase 3: Build & Polish (3-4 hours)
- Ticket 007: Build scripts (1 hour)
- Ticket 008: Modern styling (2 hours)
- Ticket 009: Testing & docs (2 hours)

### Phase 4: Optional (3-4 hours)
- Ticket 010: AI tailoring system (3-4 hours)

**Total Core**: 13-16 hours  
**Total with AI**: 16-20 hours

## Key Concepts

### Resources
Individual files containing job, education, or certification data with rich metadata.

### Templates
Typst files that load resources and render them into PDFs.

### Configurations
Files that specify which resources to include and how to filter/present them.

### Tailoring
Process of selecting optimal subset of resources for a specific job application.

## Benefits Over Traditional CV

| Traditional | Resource-Based |
|------------|----------------|
| Single file | Modular files |
| Duplicate content | Reusable resources |
| Manual updates | Update once |
| Hard to customize | Easy tailoring |
| No metadata | Rich filtering |
| Static | Dynamic |

## Example Workflows

### Build Full CV
```bash
./scripts/build-cv.sh full-cv
# Uses config/cv-config.typ (all resources)
# Output: builds/full-cv/{CV.pdf, ATS_CV.pdf}
```

### Build Tailored CV (Manual)
```bash
# 1. Create config
vim config/tailored/senior-ml-engineer-config.typ

# 2. Select resources, set filters
# 3. Build
./scripts/build-cv.sh senior-ml-engineer config/tailored/senior-ml-engineer-config.typ
```

### Build Tailored CV (AI)
```bash
# Analyze job description and auto-generate
./scripts/tailor-cv.py senior-ml-engineer job-description.txt

# Output: Auto-selected resources, built CV
```

### Update Existing Job
```bash
# Edit resource
vim resources/work/2018-12-dfds-data-science-consultant.typ

# Rebuild all CVs using this resource
./scripts/build-cv.sh full-cv
./scripts/build-cv.sh senior-ml-engineer config/tailored/...
```

## Success Metrics

- ✅ Build time: < 1 second per CV
- ✅ Flexibility: Generate 5+ tailored CVs from same resources
- ✅ Maintainability: Add new job in < 5 minutes
- ✅ Quality: Professional output matching/exceeding LaTeX
- ✅ ATS Score: > 80% on compatibility tests
- ✅ Ease of use: Non-technical user can tailor CV

## Common Questions

**Q: Why separate resources from templates?**  
A: Reusability, maintainability, and tailoring. Update content once, use everywhere.

**Q: How is this better than a single CV file?**  
A: You can easily create job-specific versions by selecting relevant experiences and filtering accomplishments.

**Q: Do I need to use AI tailoring?**  
A: No, it's optional. Manual configuration works great too.

**Q: What if I want to add a new job?**  
A: Create one resource file, add to relevant configs, rebuild. That's it!

**Q: How do I track which config I used for which application?**  
A: Keep an `applications.md` log or use Git commits to track configs.

## Tips for AI Agents

- **Read tickets completely** before starting work
- **Follow task checklists** in order
- **Create all deliverables** specified
- **Test incrementally** - don't wait until the end
- **Document decisions** in ticket files
- **Update status** as you progress
- **Cross-reference** related tickets
- **Ask for clarification** if unclear

## Additional Resources

- **AGENTS.md** - Complete technical guide with examples
- **QUICKSTART.md** - Quick overview for fast start
- **Original LaTeX files** - Reference for content

## Getting Started

1. Open `.ticket/000-master-overview.md`
2. Review `.ticket/QUICKSTART.md`
3. Read `AGENTS.md` for technical details
4. Start with Ticket 001

---

**Project Goal**: Modern, maintainable, resource-based CV system with job-specific tailoring

**Start Date**: 2026-01-08  
**Status**: In Planning
