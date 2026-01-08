# .ticket/ - LaTeX to Typst Migration Tracking

This folder contains detailed tickets for the complete migration from LaTeX to Typst CV system.

## Ticket Overview

### 000 - Master Overview
**Status**: OPEN | **Priority**: HIGH  
Tracks the overall project with timeline, dependencies, and success criteria.

### 001 - Extract CV Content and Structure  
**Status**: OPEN | **Priority**: HIGH  
Extract all content from LaTeX files, create inventory of text, skills, experience, and visual elements.

**Deliverables:**
- Content inventory document
- LaTeX to Typst command mapping
- Documentation of differences between CV and ATS variants

### 002 - Design Typst Template and Styling System
**Status**: OPEN | **Priority**: HIGH  
**Depends on**: 001

Design modern, refreshed visual style with color schemes, typography system, layout grids, and component designs.

**Deliverables:**
- Complete design specification
- Color palette options
- Component mockups

### 003 - Create Common Helper Functions Module
**Status**: OPEN | **Priority**: MEDIUM  
**Depends on**: 002

Build `cv-common.typ` module with reusable functions, styles, and components for both CV variants.

**Deliverables:**
- `cv-common.typ` module
- API documentation
- Example usage

### 004 - Convert CV.tex to CV.typ
**Status**: OPEN | **Priority**: HIGH  
**Depends on**: 001, 002, 003

Convert standard CV with two-column layout and visual richness to Typst.

**Deliverables:**
- `CV.typ` file
- Compiled `CV.pdf`
- Conversion notes

### 005 - Convert ATS_CV.tex to ATS_CV.typ
**Status**: OPEN | **Priority**: HIGH  
**Depends on**: 001, 002, 003, 004

Convert ATS-optimized CV with single-column layout to Typst.

**Deliverables:**
- `ATS_CV.typ` file
- Compiled `ATS_CV.pdf`
- ATS testing notes

### 006 - Implement Modern Styling Refresh
**Status**: OPEN | **Priority**: MEDIUM  
**Depends on**: 004, 005

Apply modern design enhancements, refine colors, update components, and improve visual hierarchy.

**Deliverables:**
- Enhanced styling in all files
- Design decisions document
- Before/after comparison

### 007 - Testing, Validation, and Documentation
**Status**: OPEN | **Priority**: HIGH  
**Depends on**: 004, 005, 006

Comprehensive testing, ATS validation, documentation, and final quality assurance.

**Deliverables:**
- Testing report
- Updated README.md
- CHANGELOG.md
- Final production-ready files

## Workflow

```
001 (Extract) 
  ↓
002 (Design) 
  ↓
003 (Common Functions) → 004 (CV.typ) → 006 (Styling) → 007 (Testing)
                       → 005 (ATS_CV.typ) ↗
```

## How to Use These Tickets

1. **Read ticket 000** for project overview and timeline
2. **Work through tickets sequentially** (001 → 002 → 003 → 004/005 → 006 → 007)
3. **Check dependencies** before starting a ticket
4. **Mark tasks complete** as you finish them (edit the ticket markdown)
5. **Create deliverables** as specified in each ticket
6. **Document decisions** and issues in the ticket files

## Tracking Progress

Update ticket status in the markdown files:

```markdown
**Status**: OPEN       # Not started
**Status**: IN PROGRESS  # Currently working
**Status**: BLOCKED    # Waiting on dependencies
**Status**: DONE       # Completed
```

Check off tasks using markdown:
```markdown
- [ ] Incomplete task
- [x] Completed task
```

## Estimated Timeline

- **Phase 1** (Setup & Planning): Tickets 001-002 = 3-4 hours
- **Phase 2** (Core Implementation): Tickets 003-005 = 5-6 hours  
- **Phase 3** (Enhancement & Polish): Tickets 006-007 = 3-5 hours

**Total**: 11-15 hours

## Tips for AI Agents

- Read the entire ticket before starting work
- Follow the task checklist in order
- Create all specified deliverables
- Document decisions and rationale
- Update ticket status as you progress
- Cross-reference related tickets for context
- Test thoroughly before marking complete
- Ask for clarification if requirements are unclear

## File Naming Conventions

Tickets are numbered with three digits:
- `000-xxx.md` - Master/overview tickets
- `001-099.md` - Planning and analysis tickets
- `100-199.md` - Implementation tickets (if needed)
- `200-299.md` - Testing tickets (if needed)

## Additional Resources

- **AGENTS.md** - Typst coding guidelines and style guide
- **CV.tex** - Original LaTeX CV (reference)
- **ATS_CV.tex** - Original ATS CV (reference)

## Questions or Issues?

If you encounter issues:
1. Document the issue in the relevant ticket
2. Check dependencies are complete
3. Review related tickets for context
4. Consult AGENTS.md for technical guidance
5. Update the ticket with resolution notes

---

**Project Start**: 2026-01-08  
**Project Goal**: Modern, maintainable Typst CV system  
**Success Criteria**: See ticket 000
