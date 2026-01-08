# Quick Start Guide - LaTeX to Typst Migration

## For AI Agents

Start here for a quick overview of the migration project.

## What We're Doing

Converting a professional CV from LaTeX to Typst with:
- ✨ Modern, refreshed styling
- 🚀 Faster compilation (< 1 second vs 3-5 seconds)
- 📝 Two variants: Standard CV + ATS-optimized CV
- 🧩 Modular, maintainable code structure

## Quick Commands

```bash
# Compile CVs
typst compile CV.typ
typst compile ATS_CV.typ

# Watch mode (auto-rebuild)
typst watch CV.typ

# View ticket status
cat .ticket/000-master-overview.md
```

## Project Structure

```
.ticket/
├── README.md                 # Ticket system overview
├── 000-master-overview.md    # START HERE - Project plan
├── 001-extract-content.md    # Content extraction
├── 002-design-template.md    # Design system
├── 003-common-functions.md   # Shared components
├── 004-convert-cv-typ.md     # Standard CV
├── 005-convert-ats-cv-typ.md # ATS CV
├── 006-styling-refresh.md    # Modern enhancements
└── 007-testing-validation.md # Testing & docs
```

## Workflow

1. **Read** `000-master-overview.md` for context
2. **Start** with ticket 001 (content extraction)
3. **Follow** tickets sequentially 001 → 007
4. **Check off** tasks as you complete them
5. **Create** deliverables specified in each ticket
6. **Test** thoroughly at each stage

## Key Files

- `AGENTS.md` - Typst coding standards and guidelines
- `CV.tex` - Original LaTeX CV (reference)
- `ATS_CV.tex` - Original ATS CV (reference)

## Dependencies Flow

```
001 Extract Content
  ↓
002 Design System
  ↓
003 Common Functions
  ↓ ↓
004 CV.typ    005 ATS_CV.typ
  ↓             ↓
  └─────┬───────┘
        ↓
006 Styling Refresh
        ↓
007 Testing & Validation
```

## Timeline

- **Tickets 001-002**: 3-4 hours (Planning)
- **Tickets 003-005**: 5-6 hours (Implementation)
- **Tickets 006-007**: 3-5 hours (Polish)
- **Total**: ~11-15 hours

## Success Criteria

✅ Both CVs compile without errors  
✅ Modern, professional design  
✅ ATS compatibility verified (>80% score)  
✅ All content preserved from LaTeX  
✅ Faster compilation (< 1 second)  
✅ Complete documentation  

## Need Help?

1. Check the relevant ticket for detailed instructions
2. Review `AGENTS.md` for Typst coding guidelines
3. Look at the original LaTeX files for reference
4. Document any issues in the ticket files

## Tips

- Work through tickets in order (don't skip ahead)
- Check dependencies before starting a ticket
- Test frequently as you build
- Document all design decisions
- Create all specified deliverables
- Update ticket status as you progress

---

**Ready to start?** → Open `.ticket/000-master-overview.md`
