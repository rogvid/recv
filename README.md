# Typst CV System

A resource-based CV generation system built with Typst that allows creating tailored CVs for specific job applications.

## Features

- **Resource-based**: All work experience, education, courses, and certificates stored as individual files
- **Tailorable**: Generate customized CVs based on job descriptions
- **Two variants**: Standard CV and ATS-optimized CV
- **Reusable**: Share common styling and components

## Quick Start

### Prerequisites

Install Typst:
```bash
# macOS
brew install typst

# Linux
cargo install --git https://github.com/typst/typst --locked typst-cli

# Or download from https://github.com/typst/typst/releases
```

### Building Your CV

**Option 1: Using the build script (recommended)**

```bash
# Build standard CV
./build-cv.sh CV builds/my-cv

# Build tailored CV for ML engineer role
./build-cv.sh CV_tailored builds/ml-engineer

# Build with PNG preview
./build-cv.sh CV builds/my-cv --preview

# Build ATS-optimized CV
./build-cv.sh ATS_CV builds/ats-cv
```

**Option 2: Direct Typst compilation**

```bash
# Compile standard CV
typst compile --root . templates/CV.typ builds/CV.pdf

# Compile tailored CV
typst compile --root . templates/CV_tailored.typ builds/CV_tailored.pdf

# Compile ATS CV
typst compile --root . templates/ATS_CV.typ builds/ATS_CV.pdf

# Watch mode (auto-rebuild on changes)
typst watch --root . templates/CV.typ builds/CV.pdf
```

## Project Structure

```
.
├── resources/
│   ├── personal-info.typ        # Your personal information
│   ├── work/                    # Individual job files
│   │   ├── 2018-12-company-role.typ
│   │   └── ...
│   └── education/               # Degrees, courses, certificates
│       ├── degree-2012-ku-msc-physics.typ
│       ├── cert-2017-deeplearning-ai.typ
│       └── ...
├── config/
│   ├── cv-config.typ            # Full CV configuration
│   └── tailored/                # Job-specific configurations
│       └── ml-engineer-config.typ
├── templates/
│   ├── CV.typ                   # Standard CV template
│   ├── CV_tailored.typ          # Tailored CV template
│   ├── ATS_CV.typ               # ATS-optimized template
│   └── cv-common.typ            # Shared components
├── builds/                      # Generated PDFs
└── build-cv.sh                  # Build script

```

## Customization

### Adding Work Experience

Create a new file in `resources/work/` following the naming convention:
`YYYY-MM-company-slug-position-slug.typ`

Example: `2018-12-dfds-data-science-consultant.typ`

```typst
#let job = (
  position: "Data Science Consultant",
  company: "DFDS A/S",
  location: "Copenhagen, Denmark",
  start_date: "Dec. 2018",
  end_date: "May 2019",
  current: false,
  
  description: "Brief description for standard CV",
  description_long: "Detailed description...",
  
  accomplishments: (
    (
      text: "Achievement with metrics",
      impact: "high",
      quantifiable: true,
      tags: ("machine-learning", "python"),
    ),
    // ... more accomplishments
  ),
  
  technologies: ("Python", "TensorFlow", "Docker"),
  tags: ("data-science", "ml"),
  
  relevance: (
    "data-science": 10,
    "ml-engineering": 9,
  ),
)
```

### Creating a Tailored CV

1. Create a new config file in `config/tailored/`:

```typst
#let cv_config = (
  target: (
    position: "Senior Data Scientist",
    keywords: ("machine-learning", "python", "deep-learning"),
  ),
  
  work: (
    "2018-12-company1-role.typ",
    "2017-02-company2-role.typ",
  ),
  
  education: (
    degrees: ("degree-2012-ku-msc-physics.typ",),
    certificates: ("cert-2017-deeplearning-ai.typ",),
  ),
  
  accomplishments: (
    max_per_job: 3,
    min_impact: "high",
  ),
)
```

2. Update `templates/CV_tailored.typ` to import your new config
3. Build: `./build-cv.sh CV_tailored builds/job-name`

### Updating Personal Information

Edit `resources/personal-info.typ` with your contact details, skills, and summary.

## Templates

- **CV.typ**: Standard professional CV with all experience
- **CV_tailored.typ**: Manually tailored CV for specific roles
- **ATS_CV.typ**: ATS-optimized single-column layout

## Development

Watch mode for live updates:
```bash
typst watch --root . templates/CV.typ builds/CV.pdf
```

Check for errors:
```bash
typst compile --diagnostic-format=short templates/CV.typ
```

## Tips

1. **Quantify achievements**: Use metrics and percentages
2. **Use keywords**: Match job descriptions for ATS compatibility
3. **Prioritize relevance**: Put most relevant experience first
4. **Keep it concise**: 2 pages maximum for most roles
5. **Test ATS compatibility**: Use online ATS scanners

## License

Feel free to use this as a template for your own CV.

