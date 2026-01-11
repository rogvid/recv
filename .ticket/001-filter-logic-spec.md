# Ticket 001 - Filter Logic Specification

## Overview

This document defines the filtering and selection logic for tailoring CVs based on job types, tags, impact levels, and other criteria. This logic will be implemented in Typst templates and potentially in AI tailoring scripts.

---

## 1. Core Filtering Concepts

### Filter Types

**1. Inclusion Filters** - Select which resources to include
- By job type relevance score
- By required tags
- By impact level
- By quantifiability

**2. Exclusion Filters** - Remove resources that shouldn't appear
- ATS mode (exclude non-ATS-friendly items)
- Exclude legacy/outdated items
- Exclude low-relevance items

**3. Ranking Filters** - Order resources by priority
- Sort by relevance score
- Sort by recency
- Sort by impact level
- Custom prioritization

**4. Limit Filters** - Control quantity
- Maximum number of jobs
- Maximum accomplishments per job
- Maximum certificates

---

## 2. Configuration Schema (Recap)

From `001-resource-schema-spec.md`, the filter configuration:

```typst
#let cv_config = (
  // ... resource paths ...
  
  filters: (
    // INCLUSION
    min_relevance_score: 7,             // Only include resources with score >= 7 for target job
    required_tags: ("ml", "python"),    // Only include resources with ALL these tags
    min_accomplishment_impact: "medium", // "high", "medium", "low"
    
    // EXCLUSION
    ats_mode: false,                    // If true, exclude non-ATS-friendly items
    exclude_tags: ("legacy",),          // Exclude resources with these tags
    
    // LIMITS
    max_work_experiences: 5,
    max_accomplishments_per_job: 5,
    max_certificates: 3,
    max_education: 2,
    
    // RANKING
    sort_by: "relevance",               // "relevance", "recency", "impact"
    
    // TARGET
    target_job_type: "data-science",    // Which relevance score to use
  ),
)
```

---

## 3. Filter Logic Algorithms

### Algorithm 1: Work Experience Selection

**Purpose:** Select and order work experiences for a CV based on target job type.

**Inputs:**
- List of all work experience resources
- Target job type (e.g., "data-science")
- Configuration filters

**Pseudocode:**

```python
def filter_work_experiences(all_jobs, target_job_type, config):
    filtered_jobs = []
    
    # Step 1: Filter by relevance score
    min_score = config.filters.min_relevance_score
    for job in all_jobs:
        if job.relevance[target_job_type] >= min_score:
            filtered_jobs.append(job)
    
    # Step 2: Filter by required tags (if specified)
    if config.filters.required_tags:
        filtered_jobs = [
            job for job in filtered_jobs
            if all(tag in job.tags for tag in config.filters.required_tags)
        ]
    
    # Step 3: Exclude by tags (if specified)
    if config.filters.exclude_tags:
        filtered_jobs = [
            job for job in filtered_jobs
            if not any(tag in job.tags for tag in config.filters.exclude_tags)
        ]
    
    # Step 4: Sort jobs
    if config.filters.sort_by == "relevance":
        filtered_jobs.sort(
            key=lambda job: job.relevance[target_job_type],
            reverse=True
        )
    elif config.filters.sort_by == "recency":
        filtered_jobs.sort(
            key=lambda job: parse_date(job.start_date),
            reverse=True
        )
    
    # Step 5: Apply limit
    max_jobs = config.filters.max_work_experiences
    filtered_jobs = filtered_jobs[:max_jobs]
    
    return filtered_jobs
```

**Typst Implementation Concept:**

```typst
#let filter_work_experiences(all_jobs, target_job, config) = {
  let filtered = all_jobs.filter(job => 
    job.relevance.at(target_job, default: 0) >= config.filters.min_relevance_score
  )
  
  // Additional filtering logic here...
  
  filtered.slice(0, config.filters.max_work_experiences)
}
```

---

### Algorithm 2: Accomplishment Filtering per Job

**Purpose:** For each job, select the most relevant accomplishments.

**Inputs:**
- Job resource with accomplishments
- Target job type
- Configuration filters

**Pseudocode:**

```python
def filter_accomplishments(job, target_job_type, config):
    accomplishments = job.accomplishments
    
    # Step 1: Filter by impact level
    min_impact = config.filters.min_accomplishment_impact
    impact_order = {"high": 3, "medium": 2, "low": 1}
    
    filtered = [
        acc for acc in accomplishments
        if impact_order[acc.impact] >= impact_order[min_impact]
    ]
    
    # Step 2: Filter by ATS mode
    if config.filters.ats_mode:
        filtered = [acc for acc in filtered if acc.ats_friendly]
    
    # Step 3: Filter by required tags (intersection)
    if config.filters.required_tags:
        filtered = [
            acc for acc in filtered
            if any(tag in acc.tags for tag in config.filters.required_tags)
        ]
    
    # Step 4: Prioritize quantifiable accomplishments
    filtered.sort(
        key=lambda acc: (
            impact_order[acc.impact],      # Primary: impact level
            acc.quantifiable,              # Secondary: has metrics
            len(acc.tags)                  # Tertiary: tag richness
        ),
        reverse=True
    )
    
    # Step 5: Apply limit
    max_accs = config.filters.max_accomplishments_per_job
    filtered = filtered[:max_accs]
    
    return filtered
```

**Ranking Priority:**
1. Impact level (high > medium > low)
2. Quantifiable (metrics/numbers)
3. Tag relevance (more tags = more specific/relevant)

---

### Algorithm 3: Education & Certificate Selection

**Purpose:** Select most relevant degrees and certificates.

**Pseudocode:**

```python
def filter_education(all_education, target_job_type, config):
    # For degrees: usually include all (M.Sc., B.Sc.)
    # Filter certificates by relevance
    
    degrees = [e for e in all_education if e.type == "degree"]
    certificates = [e for e in all_education if e.type == "certificate"]
    
    # Filter certificates by relevance
    min_score = config.filters.min_relevance_score
    filtered_certs = [
        cert for cert in certificates
        if cert.relevance.get(target_job_type, 0) >= min_score
    ]
    
    # Sort certificates by relevance
    filtered_certs.sort(
        key=lambda cert: cert.relevance[target_job_type],
        reverse=True
    )
    
    # Apply limits
    filtered_certs = filtered_certs[:config.filters.max_certificates]
    degrees = degrees[:config.filters.max_education]
    
    return degrees, filtered_certs
```

---

### Algorithm 4: Skills Selection

**Purpose:** Select most relevant skills for target job type.

**Note:** Skills are typically filtered by:
- Category relevance (e.g., for ML role, prioritize ML frameworks)
- Proficiency level (only show 3-5 rated skills)
- Tag matching

**Pseudocode:**

```python
def filter_skills(all_skills, target_job_type, config):
    # Define skill categories relevant to each job type
    relevant_categories = {
        "data-science": ["programming", "ml", "statistics", "visualization"],
        "ml-engineering": ["programming", "ml", "frameworks", "deployment"],
        "data-engineering": ["programming", "databases", "etl", "cloud"],
        # ... more mappings
    }
    
    categories = relevant_categories.get(target_job_type, [])
    
    # Filter by proficiency (only show skilled items)
    filtered = [s for s in all_skills if s.proficiency >= 3]
    
    # Filter by category relevance
    filtered = [
        s for s in filtered
        if any(cat in s.tags for cat in categories)
    ]
    
    # Sort by proficiency
    filtered.sort(key=lambda s: s.proficiency, reverse=True)
    
    # Limit to top 10-15 skills
    return filtered[:15]
```

---

## 4. Advanced Filtering Scenarios

### Scenario 1: Multi-Tag Requirements (AND logic)

**Use Case:** "Only show experiences with BOTH 'ml' AND 'consulting' tags"

```typst
filters: (
  required_tags: ("ml", "consulting"),  // Must have ALL tags
)
```

**Implementation:**
```python
all(tag in resource.tags for tag in required_tags)
```

---

### Scenario 2: Any-Tag Requirements (OR logic)

**Use Case:** "Show experiences with 'python' OR 'r' OR 'sql'"

```typst
filters: (
  any_tags: ("python", "r", "sql"),  // Must have AT LEAST ONE
)
```

**Implementation:**
```python
any(tag in resource.tags for tag in any_tags)
```

---

### Scenario 3: Excluding Specific Experiences

**Use Case:** "Don't show old internships"

```typst
filters: (
  exclude_tags: ("internship", "legacy"),
)
```

**Implementation:**
```python
not any(tag in resource.tags for tag in exclude_tags)
```

---

### Scenario 4: Recency-Based Filtering

**Use Case:** "Only show last 5 years of experience"

```typst
filters: (
  max_years_back: 5,
)
```

**Implementation:**
```python
current_year = 2026
job_start_year = parse_year(job.start_date)
if current_year - job_start_year <= max_years_back:
    include_job()
```

---

### Scenario 5: Weighted Scoring

**Use Case:** "Prioritize recent, high-impact, highly-relevant experiences"

```python
def calculate_score(job, target_job_type, current_year):
    relevance = job.relevance[target_job_type]  # 1-10
    
    # Recency bonus (exponential decay)
    years_ago = current_year - parse_year(job.start_date)
    recency_multiplier = 0.95 ** years_ago  # 5% decay per year
    
    # Impact bonus (count high-impact accomplishments)
    high_impact_count = sum(
        1 for acc in job.accomplishments if acc.impact == "high"
    )
    impact_bonus = high_impact_count * 0.5
    
    # Final score
    score = (relevance * recency_multiplier) + impact_bonus
    return score

# Sort by weighted score
jobs.sort(key=lambda j: calculate_score(j, target, 2026), reverse=True)
```

---

## 5. Filtering for Different CV Variants

### Full CV (Comprehensive)

```typst
filters: (
  min_relevance_score: 5,              // Include most things
  min_accomplishment_impact: "low",    // Show all accomplishments
  max_work_experiences: 10,            // Show many jobs
  max_accomplishments_per_job: 6,
  ats_mode: false,
)
```

**Characteristics:**
- Comprehensive, shows breadth
- 2-3 pages
- All relevant experiences

---

### Tailored CV (Job-Specific)

```typst
filters: (
  min_relevance_score: 8,              // Only highly relevant
  required_tags: ("ml", "python"),     // Must match job tags
  min_accomplishment_impact: "medium", // Only impactful items
  max_work_experiences: 5,
  max_accomplishments_per_job: 4,
  ats_mode: false,
)
```

**Characteristics:**
- Focused, targeted
- 1-2 pages
- Only most relevant content

---

### ATS-Optimized CV

```typst
filters: (
  min_relevance_score: 7,
  min_accomplishment_impact: "medium",
  max_work_experiences: 5,
  max_accomplishments_per_job: 5,
  ats_mode: true,                      // KEY: Only ATS-friendly items
)
```

**Characteristics:**
- Simple formatting
- Keyword-rich
- Parseable by ATS systems
- Only `ats_friendly: true` accomplishments

---

### One-Page CV (Compact)

```typst
filters: (
  min_relevance_score: 9,              // Only perfect matches
  min_accomplishment_impact: "high",   // Only high-impact
  max_work_experiences: 3,             // Very limited
  max_accomplishments_per_job: 3,
  max_certificates: 2,
  ats_mode: false,
)
```

**Characteristics:**
- Single page
- Only highlights
- For quick screening

---

## 6. Typst Implementation Pattern

### Template Structure

```typst
// CV.typ - Main template file

// Import configuration
#import "config/cv-config.typ": cv_config

// Import resources
#let all_jobs = (
  #import "resources/work/2018-12-dfds-data-science-consultant.typ": job,
  // ... more imports
)

// Apply filters
#let filtered_jobs = filter_work_experiences(
  all_jobs,
  cv_config.filters.target_job_type,
  cv_config
)

// Render
#for job in filtered_jobs {
  render_job_section(job, cv_config)
}
```

---

### Helper Functions

**Filter function:**
```typst
#let filter_by_relevance(resources, target_job, min_score) = {
  resources.filter(res => 
    res.relevance.at(target_job, default: 0) >= min_score
  )
}
```

**Sort function:**
```typst
#let sort_by_relevance(resources, target_job) = {
  resources.sorted(key: res => -res.relevance.at(target_job, default: 0))
}
```

**Limit function:**
```typst
#let limit_items(items, max_count) = {
  items.slice(0, calc.min(items.len(), max_count))
}
```

---

## 7. AI-Powered Tailoring Logic

### Workflow

**Input:** Job description text

**Steps:**

1. **Parse job description**
   - Extract required skills
   - Identify job type (data-science, ml-engineering, etc.)
   - Extract key technologies
   - Identify domain/industry

2. **Generate filter configuration**
   ```python
   def generate_config_from_job_desc(job_desc):
       # Use NLP/LLM to extract:
       job_type = extract_job_type(job_desc)
       required_skills = extract_skills(job_desc)
       domain = extract_domain(job_desc)
       
       # Map skills to tags
       required_tags = map_skills_to_tags(required_skills)
       
       # Create config
       config = {
           "filters": {
               "target_job_type": job_type,
               "required_tags": required_tags,
               "min_relevance_score": 8,
               "min_accomplishment_impact": "medium",
               # ... more
           }
       }
       return config
   ```

3. **Apply filters** (using algorithms above)

4. **Generate CV** using filtered resources

---

### AI Scoring Enhancement

**Use LLM to score accomplishments against job description:**

```python
def ai_score_accomplishment(accomplishment_text, job_description):
    prompt = f"""
    Score the relevance of this accomplishment to the job description.
    
    Job Description: {job_description}
    
    Accomplishment: {accomplishment_text}
    
    Return a score 1-10.
    """
    
    score = llm_call(prompt)
    return int(score)

# Re-rank accomplishments using AI scores
for job in jobs:
    for acc in job.accomplishments:
        acc.ai_score = ai_score_accomplishment(acc.text, job_desc)
    
    job.accomplishments.sort(key=lambda a: a.ai_score, reverse=True)
```

---

## 8. Validation & Testing

### Test Cases

**Test 1: Basic Relevance Filtering**
```
Input: 10 jobs, target "data-science", min_score 7
Expected: Only jobs with data-science score >= 7
```

**Test 2: Tag Filtering**
```
Input: Jobs with various tags, required_tags = ["ml", "python"]
Expected: Only jobs containing BOTH tags
```

**Test 3: Impact Filtering**
```
Input: Job with 10 accomplishments (mix of high/medium/low impact)
Config: min_impact = "high"
Expected: Only high-impact accomplishments
```

**Test 4: ATS Mode**
```
Input: Accomplishments with ats_friendly = true/false
Config: ats_mode = true
Expected: Only ats_friendly accomplishments
```

**Test 5: Limits**
```
Input: 10 jobs, max_work_experiences = 5
Expected: Exactly 5 jobs (top 5 by relevance)
```

---

### Validation Checklist

After implementing filters:

- [ ] Relevance filtering works correctly
- [ ] Tag filtering (AND logic) works
- [ ] Exclusion filtering works
- [ ] Sorting by relevance works
- [ ] Sorting by recency works
- [ ] Limits are enforced
- [ ] ATS mode filters correctly
- [ ] Impact level filtering works
- [ ] Edge cases handled (no matches, empty lists)
- [ ] Performance acceptable (< 1s for filtering)

---

## 9. Example: Complete Filtering Pipeline

### Input

- **Target job type:** "ml-engineering"
- **Job description:** "Looking for ML Engineer with Python, TensorFlow, model deployment experience"

### Step 1: Extract from job description

```python
required_tags = ["ml", "python", "tensorflow", "model-deployment"]
target_job_type = "ml-engineering"
```

### Step 2: Configure filters

```typst
filters: (
  target_job_type: "ml-engineering",
  required_tags: ("ml", "python"),
  any_tags: ("tensorflow", "pytorch", "deployment"),
  min_relevance_score: 8,
  min_accomplishment_impact: "medium",
  max_work_experiences: 5,
  max_accomplishments_per_job: 4,
  ats_mode: false,
)
```

### Step 3: Filter jobs

```
All jobs (5):
1. Arge Innovations (Owner) - relevance[ml-engineering] = 10, tags: [ml, consulting, ...]
2. DFDS (Data Science Consultant) - relevance[ml-engineering] = 9, tags: [ml, python, ...]
3. SDU (Research Assistant) - relevance[ml-engineering] = 4, tags: [research, physics, ...]
4. ... (other jobs)

After filtering:
1. Arge Innovations (score 10, has ml+python tags)
2. DFDS (score 9, has ml+python tags)

Jobs 3+ excluded (low relevance or missing required tags)
```

### Step 4: Filter accomplishments per job

```
Arge Innovations accomplishments (10 total):
- Filter by impact: 6 remaining (medium+)
- Filter by tags: 4 remaining (have ml/python)
- Limit to 4: Keep top 4

Result: 4 best accomplishments
```

### Step 5: Generate CV

Render CV with:
- 2 jobs (Arge Innovations, DFDS)
- 4 accomplishments each
- M.Sc. Physics degree
- Deep Learning certificate
- Top 15 skills

---

## Completion Checklist

- [x] Core filtering concepts defined
- [x] Configuration schema recapped
- [x] Work experience selection algorithm
- [x] Accomplishment filtering algorithm
- [x] Education/certificate selection algorithm
- [x] Skills selection algorithm
- [x] Advanced filtering scenarios documented
- [x] CV variant filtering strategies defined
- [x] Typst implementation patterns provided
- [x] AI-powered tailoring logic outlined
- [x] Validation & testing approach defined
- [x] Complete example provided

**Status:** COMPLETE
**All Ticket 001 specification documents complete!**

---

## Next Steps

**Ticket 001 Complete:** All specification documents created.

**Next Ticket (002):** Create actual resource files:
1. `resources/personal-info.typ`
2. `resources/work/*.typ` (5 files)
3. `resources/education/*.typ` (5 files)
4. `config/cv-config.typ`
