# Ticket 000: Master Overview - LaTeX to Typst CV Migration

**Status**: OPEN  
**Priority**: HIGH  
**Created**: 2026-01-08  
**Assignee**: AI Agent  

## Objective

Migrate the existing LaTeX-based CV system to Typst with refreshed modern styling while maintaining two variants: a visually rich standard CV and an ATS-optimized version.

## Overview

This ticket tracks the complete migration from LaTeX to Typst, including:
1. Content extraction and analysis
2. Design system and styling refresh
3. Template development
4. Conversion of both CV variants
5. Testing and validation

## Sub-Tickets

- [ ] **Ticket 001**: Extract CV Content and Structure
- [ ] **Ticket 002**: Design Typst Template and Styling System
- [ ] **Ticket 003**: Create Common Helper Functions Module
- [ ] **Ticket 004**: Convert CV.tex to CV.typ
- [ ] **Ticket 005**: Convert ATS_CV.tex to ATS_CV.typ
- [ ] **Ticket 006**: Implement Modern Styling Refresh
- [ ] **Ticket 007**: Testing, Validation, and Documentation

## Success Criteria

- [ ] Both CV variants compile successfully with Typst
- [ ] PDFs maintain professional quality and readability
- [ ] Text is properly extractable for ATS systems
- [ ] Styling is modern and visually appealing
- [ ] Code is maintainable with reusable components
- [ ] All information from LaTeX versions is preserved
- [ ] Faster compilation than LaTeX (should be < 1 second)

## Dependencies

- Typst installation (v0.10.0 or higher recommended)
- PNG image assets (workpicture.png, etc.)
- Updated .gitignore for Typst artifacts

## Timeline Estimate

- **Ticket 001**: 1 hour (content extraction)
- **Ticket 002**: 2-3 hours (design system)
- **Ticket 003**: 1 hour (common functions)
- **Ticket 004**: 2-3 hours (standard CV conversion)
- **Ticket 005**: 2 hours (ATS CV conversion)
- **Ticket 006**: 2-3 hours (styling refresh)
- **Ticket 007**: 1-2 hours (testing)

**Total**: 11-15 hours

## Notes

- Original LaTeX files should be kept as reference (move to `legacy/` folder)
- Consider creating a `images/` subfolder for better organization
- Document any design decisions in ticket comments
- Ensure Danish language support (ø, æ, å characters)

## Related Files

- `CV.tex` (source)
- `ATS_CV.tex` (source)
- `AGENTS.md` (updated for Typst)
- `.gitignore` (needs update)

## Migration Strategy

1. **Phase 1**: Setup and Planning (Tickets 001-002)
2. **Phase 2**: Core Implementation (Tickets 003-005)
3. **Phase 3**: Enhancement and Polish (Tickets 006-007)

## Rollback Plan

If migration encounters issues:
- LaTeX files remain in repository
- Can revert to LaTeX compilation at any time
- Gradual cutover: complete one variant before moving to next
