# Repository Initialization Design

**Date:** 2026-02-04
**Goal:** Organize repository for personal research workflow and Claude Code optimization

## Context

CAHSI REU research repository for defending tracking control neural networks against adversarial attacks. Current state has:
- MATLAB simulation code in fig2/ and fig5/
- Deleted C++ implementations (MATLAB is primary language)
- Extensive Obsidian notes in unwieldy long directory name
- Minimal git history and empty README
- Mixed organizational structure

## Design Approach: Minimal Disruption Hybrid

Keep experiment-based organization (fig2/, fig5/) while adding proper supporting structure for research workflow.

## Directory Structure

```
tracking-control-network/
├── fig2/                    # MATLAB simulation code (CSTR sliding mode control)
├── fig5/                    # MATLAB simulation code (sinusoidal reference tracking)
├── docs/                    # Theory, methodology, background documents
├── notes/                   # Research journal, meeting notes, daily logs
│   ├── research-journal/
│   ├── meetings/
│   ├── tasks/
│   └── questions.md
├── templates/               # Obsidian templates for research workflow
├── results/                 # Simulation outputs, plots (tracked in git)
├── .gitignore              # Exclude MATLAB artifacts, system files, personal context
├── README.md               # Minimal: title, description, run instructions
├── CLAUDE.md               # Project-specific instructions
├── TASKS.md                # Active task tracking
└── Makefile                # Existing build configuration
```

## Content Migration

### From "An Analysis and Simulation..." directory:

| Source | Destination |
|--------|-------------|
| Templates/ | /templates/ |
| Research Journal/ | /notes/research-journal/ |
| Meetings/ | /notes/meetings/ |
| Tasks/ | /notes/tasks/ |
| Main research docs (*.md) | /docs/ |
| "Things I don't understand.md" | /notes/questions.md |
| Progress Reports/ | **Remove** |

### Removals:

- Original long directory (after extraction)
- `dashboard.html` (generated file)
- `~` directory (artifact)
- `Research Journal/Progress Reports/` (not migrated)
- `.gemini/` → .gitignore
- `.smart-env/` → .gitignore (AI cache files)
- `memory/` → .gitignore (personal context)

## Git Cleanup

### C++ Files
Stage all deletions and commit: "Remove C++ implementation, MATLAB is primary language"

### MATLAB Modifications
Review and commit fig2/*.m changes: "Refactor MATLAB simulations for clarity"

### .gitignore

```gitignore
# MATLAB artifacts
*.asv              # MATLAB autosave files
*.m~               # MATLAB backup files
octave-workspace   # Octave workspace
*.mex*             # MEX binaries

# System files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# IDE and editor configs
.gemini/
.opencode/
.vscode/
*.swp
*.swo
*~

# AI assistant artifacts
.smart-env/

# Personal tracking
memory/
~

# Build artifacts (keep results/ tracked)
*.o
*.out
```

**Note:** `results/` is deliberately tracked for research reproducibility.

## README.md

Minimal approach - title, description, simulation list, run instructions:

```markdown
# Tracking Control Neural Network Defense

Research on defending tracking control neural networks against adversarial
attacks for known affine discrete-time nonlinear systems.

**CAHSI Local REU** | Texas A&M University – Victoria | Spring 2026

## Simulations

### Figure 2: CSTR Sliding Mode Control
- `fig2/fig2a.m` - State tracking visualization
- `fig2/fig2b.m` - Control input visualization
- `fig2/fig2c.m` - Tracking error visualization

### Figure 5: Sinusoidal Reference Tracking
- `fig5/fig5.m` - Main tracking simulation
- `fig5/fig5a.m` - Variant A
- `fig5/fig5b.m` - Control input visualization

## Running Simulations

Open MATLAB and run the desired script:
```matlab
cd fig2
fig2a  % State tracking
```

## Structure

- `fig2/`, `fig5/` - MATLAB simulation code
- `docs/` - Theory and methodology
- `notes/` - Research journal and meeting notes
- `results/` - Simulation outputs
- `templates/` - Research note templates
```

## Claude Code Setup

### Indexing Strategy
Index everything for comprehensive context:
- All MATLAB code (fig2/, fig5/)
- All documentation (docs/)
- All research notes (notes/)
- Templates (templates/)
- Root files (README.md, CLAUDE.md, TASKS.md, Makefile)

Excluded automatically via .gitignore:
- memory/ (personal context)
- System files and IDE configs
- AI cache directories

### Verification
After reorganization, verify indexing coverage:
```bash
claude-context index --verify
```

## Implementation Steps

1. **Create .gitignore** - Prevent accidental commits during reorganization
2. **Create directory structure** - Make docs/, notes/, templates/, results/
3. **Move content** - Extract from long directory into new structure
4. **Update README.md** - Write minimal documentation
5. **Clean up** - Remove empty directories and artifacts
6. **Git commits** - Stage and commit in logical groups:
   - Add .gitignore
   - Remove C++ files
   - Commit MATLAB modifications
   - Add reorganized structure
   - Update README
7. **Verify indexing** - Confirm claude-context has full coverage
8. **Update CLAUDE.md** (optional) - Add project structure reference

## Verification Checklist

- [ ] All Obsidian content moved to appropriate locations
- [ ] No content lost from original structure
- [ ] Git status clean (no unintended deletions)
- [ ] README accurately describes current state
- [ ] Claude Code can semantically search all content
- [ ] MATLAB simulations still run from their locations

## Safety Measures

- Verify each move before deleting source
- Git allows reverting if anything goes wrong
- Indexing is non-destructive (can re-index anytime)

## Trade-offs

**Advantages:**
- Preserves figure-based experiment organization
- Minimal disruption to existing workflow
- Research results versioned for reproducibility
- Personal context stays private

**Disadvantages:**
- Less conventional than pure software repo structure
- Mixing research notes with code repo
- Not organized for publication (acceptable for research phase)

## Future Considerations

As project evolves toward publication, consider:
- Separate paper/ directory for LaTeX manuscript
- More formal code/ organization if adding more simulations
- Separate Obsidian vault for personal notes if needed
