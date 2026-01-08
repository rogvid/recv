# Ticket 001: Extract CV Content and Structure

**Status**: OPEN  
**Priority**: HIGH  
**Created**: 2026-01-08  
**Depends On**: None  
**Blocks**: 002, 004, 005  

## Objective

Extract and document all content, structure, and data from the existing LaTeX CV files to create a clear content inventory for the Typst conversion.

## Tasks

### 1. Content Extraction

- [ ] Parse CV.tex and extract all text content
- [ ] Parse ATS_CV.tex and extract all text content
- [ ] Identify differences between the two versions
- [ ] Extract all personal information (name, contact, etc.)
- [ ] List all job positions with dates and descriptions
- [ ] List all education entries
- [ ] List all certifications
- [ ] List all technical skills with proficiency levels
- [ ] List all soft skills with proficiency levels
- [ ] List all languages with proficiency levels
- [ ] Extract summary/objective text

### 2. Visual Elements Inventory

- [ ] Document color scheme (myblue, carmine, coralred, etc.)
- [ ] List all custom commands and their purposes
- [ ] Identify layout patterns (two-column, grids, etc.)
- [ ] Document spacing and margin conventions
- [ ] Note font sizes used for different elements
- [ ] Catalog image assets and their usage

### 3. Structure Analysis

- [ ] Document section order in CV.tex
- [ ] Document section order in ATS_CV.tex
- [ ] Identify common patterns between both versions
- [ ] Note unique elements in each version
- [ ] Map LaTeX commands to required Typst equivalents

### 4. Create Content Inventory Document

Create `.ticket/001-content-inventory.md` with:

```markdown
## Personal Information
- Name: [extract]
- Title: [extract]
- Phone: [extract]
- Email: [extract]
- LinkedIn: [extract]
- GitHub: [extract]

## Professional Summary
[extracted text]

## Experience (in chronological order)
### Position 1
- Title: [extract]
- Company: [extract]
- Dates: [extract]
- Description: [extract]
- Accomplishments:
  - [bullet 1]
  - [bullet 2]

[... continue for all positions]

## Education
[extract all degrees]

## Certifications
[extract all certifications]

## Skills
### Technical Skills
[skill]: [proficiency level 1-5]

### Soft Skills
[skill]: [proficiency level 1-5]

## Languages
[language]: [proficiency description]

## Visual Elements
- Primary color (myblue): #006C96
- [other colors]

## Layout Notes
- Two-column layout ratio: 66/28
- Margins: top=1.5cm, bottom=1.2cm, left=2cm, right=2cm
- [other layout specs]
```

## Deliverables

- [ ] `.ticket/001-content-inventory.md` - Complete content listing
- [ ] `.ticket/001-latex-to-typst-mapping.md` - Command equivalency map
- [ ] `.ticket/001-differences-cv-vs-ats.md` - Document variant differences

## Acceptance Criteria

- All text content is extracted accurately
- All proficiency levels are documented
- Color values are recorded in both RGB and hex
- Layout specifications are precise (measurements)
- All custom LaTeX commands are cataloged
- Differences between CV.tex and ATS_CV.tex are clearly documented

## Notes

- Use automated extraction where possible (grep, sed)
- Double-check manual transcription for accuracy
- Pay attention to special characters (Danish: ø, æ, å)
- Note any conditional content or commented-out sections
- Document any hardcoded styling that should be parameterized

## Related Files

- `CV.tex`
- `ATS_CV.tex`
- `workpicture.png`

## Estimated Time

1-2 hours

## Testing

- [ ] Verify all job dates are captured
- [ ] Confirm skill proficiency numbers are correct
- [ ] Check that no content is missed
- [ ] Validate color codes against LaTeX source
