# Ticket 010: Implement AI-Powered CV Tailoring System

**Status**: OPEN  
**Priority**: MEDIUM (Optional Enhancement)  
**Created**: 2026-01-08  
**Depends On**: 002, 007  
**Blocks**: None  

## Objective

Create an AI-powered system that automatically generates tailored CVs by analyzing job descriptions, extracting requirements, ranking resources by relevance, and generating optimized configurations.

## Overview

This system will:
1. Parse job descriptions to extract requirements
2. Match requirements against resource metadata
3. Rank resources by relevance
4. Select best accomplishments to highlight
5. Generate Typst configuration file
6. Build tailored CV automatically

## Tasks

### 1. Setup Python Environment

- [ ] Create `requirements.txt`
- [ ] Set up virtual environment structure
- [ ] Install dependencies

```txt
# requirements.txt
openai>=1.0.0  # or anthropic
beautifulsoup4>=4.12.0
requests>=2.31.0
python-dotenv>=1.0.0
pyyaml>=6.0
```

### 2. Implement Job Description Parser

**File**: `scripts/job_parser.py`

- [ ] Create JobDescription class
- [ ] Implement text extraction from various sources
- [ ] Clean and normalize job description text

```python
# scripts/job_parser.py

class JobDescriptionParser:
    def __init__(self, source):
        """
        source: file path, URL, or raw text
        """
        self.source = source
        self.raw_text = None
        self.parsed_data = None
    
    def load(self):
        """Load job description from source"""
        if self.source.startswith('http'):
            self._load_from_url()
        elif os.path.isfile(self.source):
            self._load_from_file()
        else:
            self.raw_text = self.source
    
    def _load_from_url(self):
        """Scrape job posting from URL"""
        # Implementation
        pass
    
    def _load_from_file(self):
        """Load from text file"""
        with open(self.source, 'r') as f:
            self.raw_text = f.read()
    
    def clean_text(self):
        """Remove HTML, extra whitespace, etc."""
        # Implementation
        pass
```

### 3. Implement AI-Powered Analysis

**File**: `scripts/job_analyzer.py`

- [ ] Create JobAnalyzer class
- [ ] Use LLM to extract structured information
- [ ] Extract keywords, skills, requirements

```python
# scripts/job_analyzer.py

class JobAnalyzer:
    def __init__(self, api_key=None, model="gpt-4"):
        """Initialize with API credentials"""
        self.api_key = api_key or os.getenv('OPENAI_API_KEY')
        self.model = model
        self.client = OpenAI(api_key=self.api_key)
    
    def analyze(self, job_description_text):
        """
        Extract structured data from job description
        
        Returns:
            dict: {
                'position': str,
                'company': str,
                'required_skills': list[str],
                'preferred_skills': list[str],
                'required_experience_years': int,
                'keywords': list[str],
                'domain': str,
                'responsibilities': list[str],
                'education_requirements': list[str],
            }
        """
        
        prompt = f"""
        Analyze this job description and extract structured information.
        
        Job Description:
        {job_description_text}
        
        Extract and return JSON with:
        - position: Job title
        - company: Company name
        - required_skills: List of must-have technical skills
        - preferred_skills: List of nice-to-have skills
        - required_experience_years: Minimum years experience
        - keywords: Important keywords/buzzwords
        - domain: Industry/domain (e.g., finance, healthcare, tech)
        - responsibilities: Key responsibilities
        - education_requirements: Degree requirements
        
        Return ONLY valid JSON, no other text.
        """
        
        response = self.client.chat.completions.create(
            model=self.model,
            messages=[
                {"role": "system", "content": "You are a helpful assistant that extracts structured data from job descriptions. Always respond with valid JSON."},
                {"role": "user", "content": prompt}
            ],
            temperature=0.3,
        )
        
        import json
        result = json.loads(response.choices[0].message.content)
        return result
```

### 4. Implement Resource Ranking System

**File**: `scripts/resource_ranker.py`

- [ ] Create ResourceRanker class
- [ ] Implement tag-based scoring
- [ ] Implement keyword matching
- [ ] Rank work experiences and education

```python
# scripts/resource_ranker.py

class ResourceRanker:
    def __init__(self, resources_dir="resources"):
        self.resources_dir = Path(resources_dir)
        self.work_resources = []
        self.edu_resources = []
    
    def load_resources(self):
        """Load all resource files and parse metadata"""
        # Parse all .typ files in resources/work/
        # Extract metadata: tags, relevance, technologies, etc.
        pass
    
    def rank_work_experiences(self, job_analysis):
        """
        Rank work experiences by relevance to job
        
        Scoring factors:
        - Tag overlap with required_skills
        - Technology overlap
        - Domain match
        - Relevance scores
        - Experience recency
        """
        
        scores = []
        for work in self.work_resources:
            score = self._calculate_work_score(work, job_analysis)
            scores.append((work, score))
        
        # Sort by score descending
        scores.sort(key=lambda x: x[1], reverse=True)
        return [work for work, score in scores]
    
    def _calculate_work_score(self, work, job_analysis):
        """Calculate relevance score for a work experience"""
        score = 0
        
        # Tag matching (40%)
        work_tags = set(work['tags'])
        required_tags = set(job_analysis['required_skills'])
        tag_overlap = len(work_tags & required_tags)
        score += tag_overlap * 4
        
        # Technology matching (30%)
        work_tech = set(work['technologies'])
        required_tech = set(job_analysis['required_skills'])
        tech_overlap = len(work_tech & required_tech)
        score += tech_overlap * 3
        
        # Relevance score (20%)
        if job_analysis.get('domain') in work.get('relevance', {}):
            score += work['relevance'][job_analysis['domain']] * 2
        
        # Recency bonus (10%)
        # More recent jobs get slight bonus
        # Implementation...
        
        return score
    
    def rank_accomplishments(self, job, job_analysis):
        """Rank accomplishments within a job"""
        accomplishments = job['accomplishments']
        
        scores = []
        for acc in accomplishments:
            score = 0
            
            # Tag matching
            acc_tags = set(acc['tags'])
            required_tags = set(job_analysis['required_skills'])
            score += len(acc_tags & required_tags) * 10
            
            # Impact level
            impact_scores = {'high': 15, 'medium': 10, 'low': 5}
            score += impact_scores.get(acc['impact'], 0)
            
            # Quantifiable bonus
            if acc.get('quantifiable') and job_analysis.get('prefers_quantifiable', True):
                score += 5
            
            scores.append((acc, score))
        
        scores.sort(key=lambda x: x[1], reverse=True)
        return [acc for acc, score in scores]
```

### 5. Implement Configuration Generator

**File**: `scripts/config_generator.py`

- [ ] Create ConfigGenerator class
- [ ] Generate Typst configuration from rankings
- [ ] Format output as valid Typst code

```python
# scripts/config_generator.py

class ConfigGenerator:
    def __init__(self, job_analysis, ranked_resources):
        self.job_analysis = job_analysis
        self.ranked_resources = ranked_resources
    
    def generate(self, max_work=4, max_certs=2):
        """
        Generate Typst configuration file
        
        Returns:
            str: Valid Typst configuration code
        """
        
        config = {
            'target': {
                'position': self.job_analysis['position'],
                'company': self.job_analysis.get('company', 'Unknown'),
                'keywords': self.job_analysis['keywords'][:15],
            },
            'work': self._format_work_list(max_work),
            'education': self._format_education(),
            'accomplishments': self._format_accomplishment_config(),
            'skills': self._format_skills_config(),
        }
        
        return self._to_typst(config)
    
    def _format_work_list(self, max_work):
        """Select top N work experiences"""
        return [
            work['filename'] 
            for work in self.ranked_resources['work'][:max_work]
        ]
    
    def _format_accomplishment_config(self):
        """Create accomplishment selection rules"""
        return {
            'max_per_job': 2,
            'min_impact': 'high',
            'required_tags': self.job_analysis['required_skills'][:10],
            'prioritize_quantifiable': True,
        }
    
    def _format_skills_config(self):
        """Select skills to highlight"""
        required = self.job_analysis['required_skills']
        preferred = self.job_analysis.get('preferred_skills', [])
        
        return {
            'highlight': required[:8],
            'show': required + preferred[:5],
        }
    
    def _to_typst(self, config):
        """Convert Python dict to Typst syntax"""
        # Convert to Typst dictionary format
        typst_code = f"""// Auto-generated configuration
// Job: {config['target']['position']} at {config['target']['company']}
// Generated: {datetime.now().isoformat()}

#let config = (
  target: (
    position: "{config['target']['position']}",
    company: "{config['target']['company']}",
    keywords: ({self._format_array(config['target']['keywords'])}),
  ),
  
  work: (
    {self._format_array(config['work'])}
  ),
  
  education: (
    degrees: ({self._format_array(config['education']['degrees'])}),
    certificates: ({self._format_array(config['education']['certificates'])}),
  ),
  
  accomplishments: (
    max_per_job: {config['accomplishments']['max_per_job']},
    min_impact: "{config['accomplishments']['min_impact']}",
    required_tags: ({self._format_array(config['accomplishments']['required_tags'])}),
    prioritize_quantifiable: {str(config['accomplishments']['prioritize_quantifiable']).lower()},
  ),
  
  skills: (
    highlight: ({self._format_array(config['skills']['highlight'])}),
  ),
)
"""
        return typst_code
    
    def _format_array(self, items):
        """Format Python list as Typst array"""
        return ", ".join(f'"{item}"' for item in items)
```

### 6. Create Main CLI Script

**File**: `scripts/tailor-cv.py`

- [ ] Implement command-line interface
- [ ] Orchestrate all components
- [ ] Generate config and build CV

```python
#!/usr/bin/env python3
"""
AI-powered CV tailoring system

Usage:
    ./scripts/tailor-cv.py <job-name> <job-description-source>
    
Examples:
    ./scripts/tailor-cv.py senior-ml-engineer job-desc.txt
    ./scripts/tailor-cv.py data-scientist https://company.com/job/123
"""

import sys
import argparse
from pathlib import Path
from job_parser import JobDescriptionParser
from job_analyzer import JobAnalyzer
from resource_ranker import ResourceRanker
from config_generator import ConfigGenerator
import subprocess

def main():
    parser = argparse.ArgumentParser(description='Generate tailored CV from job description')
    parser.add_argument('job_name', help='Name for this job application')
    parser.add_argument('job_source', help='Job description file, URL, or text')
    parser.add_argument('--max-work', type=int, default=4, help='Max work experiences to include')
    parser.add_argument('--max-certs', type=int, default=2, help='Max certificates to include')
    parser.add_argument('--model', default='gpt-4', help='LLM model to use')
    parser.add_argument('--no-build', action='store_true', help='Generate config only, don\'t build PDF')
    
    args = parser.parse_args()
    
    print(f"🎯 Tailoring CV for: {args.job_name}")
    
    # 1. Parse job description
    print("📄 Parsing job description...")
    parser = JobDescriptionParser(args.job_source)
    parser.load()
    parser.clean_text()
    
    # 2. Analyze with AI
    print("🤖 Analyzing requirements with AI...")
    analyzer = JobAnalyzer(model=args.model)
    job_analysis = analyzer.analyze(parser.raw_text)
    
    print(f"   Position: {job_analysis['position']}")
    print(f"   Required skills: {', '.join(job_analysis['required_skills'][:5])}...")
    
    # 3. Rank resources
    print("📊 Ranking resources by relevance...")
    ranker = ResourceRanker()
    ranker.load_resources()
    
    ranked = {
        'work': ranker.rank_work_experiences(job_analysis),
        'education': ranker.rank_education(job_analysis),
    }
    
    print(f"   Top work: {ranked['work'][0]['company']} - {ranked['work'][0]['position']}")
    
    # 4. Generate configuration
    print("⚙️  Generating Typst configuration...")
    generator = ConfigGenerator(job_analysis, ranked)
    config_code = generator.generate(
        max_work=args.max_work,
        max_certs=args.max_certs
    )
    
    # Save config
    config_dir = Path("config/tailored")
    config_dir.mkdir(parents=True, exist_ok=True)
    config_file = config_dir / f"{args.job_name}-config.typ"
    
    with open(config_file, 'w') as f:
        f.write(config_code)
    
    print(f"   Saved: {config_file}")
    
    # 5. Build CV
    if not args.no_build:
        print("🔨 Building CV...")
        result = subprocess.run(
            ['./scripts/build-cv.sh', args.job_name, str(config_file)],
            capture_output=True,
            text=True
        )
        
        if result.returncode == 0:
            print(f"✅ Success!")
            print(f"   CV: builds/{args.job_name}/CV.pdf")
            print(f"   ATS: builds/{args.job_name}/ATS_CV.pdf")
        else:
            print(f"❌ Build failed:")
            print(result.stderr)
            sys.exit(1)
    
    print("\n📝 Review and customize the configuration at:")
    print(f"   {config_file}")
    print("\n💡 Tip: Edit the config file to fine-tune, then rebuild:")
    print(f"   ./scripts/build-cv.sh {args.job_name} {config_file}")

if __name__ == '__main__':
    main()
```

### 7. Create Resource Parser

**File**: `scripts/resource_parser.py`

- [ ] Parse Typst resource files
- [ ] Extract metadata
- [ ] Handle Typst syntax

```python
# scripts/resource_parser.py
import re
from pathlib import Path

class ResourceParser:
    """Parse Typst resource files to extract metadata"""
    
    def parse_work_file(self, filepath):
        """Parse a work resource file"""
        with open(filepath, 'r') as f:
            content = f.read()
        
        # Extract dictionary content
        # This is a simplified parser - could use proper Typst parsing
        job = {
            'filename': Path(filepath).name,
            'filepath': filepath,
        }
        
        # Extract fields using regex
        job['position'] = self._extract_string_field(content, 'position')
        job['company'] = self._extract_string_field(content, 'company')
        job['tags'] = self._extract_array_field(content, 'tags')
        job['technologies'] = self._extract_array_field(content, 'technologies')
        job['accomplishments'] = self._extract_accomplishments(content)
        job['relevance'] = self._extract_relevance(content)
        
        return job
    
    def _extract_string_field(self, content, field_name):
        """Extract string field value"""
        pattern = f'{field_name}:\\s*"([^"]*)"'
        match = re.search(pattern, content)
        return match.group(1) if match else None
    
    def _extract_array_field(self, content, field_name):
        """Extract array field values"""
        pattern = f'{field_name}:\\s*\\(([^)]+)\\)'
        match = re.search(pattern, content)
        if match:
            items = match.group(1)
            # Extract quoted strings
            return re.findall(r'"([^"]*)"', items)
        return []
    
    def _extract_accomplishments(self, content):
        """Extract accomplishment metadata"""
        # Implementation to parse accomplishments array
        # Return list of dicts with text, impact, tags, etc.
        pass
    
    def _extract_relevance(self, content):
        """Extract relevance scores"""
        # Parse relevance dictionary
        # Return dict of {job_type: score}
        pass
```

### 8. Create README and Documentation

**File**: `scripts/README.md`

- [ ] Document installation
- [ ] Document usage
- [ ] Provide examples
- [ ] Troubleshooting guide

### 9. Create Configuration Template

**File**: `.env.example`

```bash
# OpenAI API Key (for GPT-4)
OPENAI_API_KEY=your-api-key-here

# Alternative: Anthropic API Key (for Claude)
# ANTHROPIC_API_KEY=your-api-key-here

# Model selection
AI_MODEL=gpt-4
```

### 10. Testing

- [ ] Test with sample job descriptions
- [ ] Verify config generation
- [ ] Test resource ranking
- [ ] Validate Typst syntax in generated configs
- [ ] Test full pipeline end-to-end

## Deliverables

- [ ] `scripts/job_parser.py` - Job description parser
- [ ] `scripts/job_analyzer.py` - AI-powered analyzer
- [ ] `scripts/resource_ranker.py` - Resource ranking system
- [ ] `scripts/config_generator.py` - Config file generator
- [ ] `scripts/resource_parser.py` - Typst file parser
- [ ] `scripts/tailor-cv.py` - Main CLI script
- [ ] `scripts/README.md` - Documentation
- [ ] `requirements.txt` - Python dependencies
- [ ] `.env.example` - Configuration template
- [ ] Test suite and example job descriptions

## Acceptance Criteria

- CLI script works end-to-end
- Can parse job descriptions from file or URL
- AI extracts meaningful requirements
- Resources are ranked sensibly
- Generated config is valid Typst
- Built CVs are tailored appropriately
- Documentation is clear and complete
- Error handling is robust

## Nice-to-Have Features

- [ ] Support multiple LLM providers (OpenAI, Anthropic, local)
- [ ] Cache parsed resources for speed
- [ ] Interactive mode for reviewing/editing selections
- [ ] Scoring explanation (why each resource was ranked)
- [ ] Comparison tool (compare multiple configs)
- [ ] A/B testing framework
- [ ] Integration with job boards (auto-scrape)

## Example Usage

```bash
# Install dependencies
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Set up API key
cp .env.example .env
# Edit .env with your API key

# Tailor CV for a job
./scripts/tailor-cv.py senior-ml-engineer job-posting.txt

# Or from URL
./scripts/tailor-cv.py data-scientist https://company.com/careers/123

# Generate config only (no build)
./scripts/tailor-cv.py backend-engineer job.txt --no-build

# Customize and rebuild
vim config/tailored/senior-ml-engineer-config.typ
./scripts/build-cv.sh senior-ml-engineer config/tailored/senior-ml-engineer-config.typ
```

## Notes

- This is an optional enhancement
- Requires OpenAI/Anthropic API key
- Can use local LLMs as alternative
- Manual config creation always works as fallback
- AI suggestions should be reviewed/edited
- Start with simple implementation, iterate

## Related Files

- Ticket 002 (resource files needed)
- Ticket 007 (build scripts)
- `AGENTS.md` (resource schema reference)

## Estimated Time

3-4 hours

## Future Enhancements

- Web UI for job description input
- LinkedIn job scraping
- Cover letter generation
- Keyword optimization suggestions
- ATS score prediction
- Version comparison
