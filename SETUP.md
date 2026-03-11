# Tracking Control Network -- First-Time Setup

## Prerequisites

| Tool | Version | Purpose |
|------|---------|---------|
| CMake | >= 3.15 | C++ build system |
| C++ compiler | C++17 support | Compiling simulations |
| Qt | 5 or 6 | Required by cxxplot plotting library |
| MATLAB | R2019a+ (R2025b recommended) | Reference simulations |
| LuaLaTeX | Any recent TeX distribution | Paper compilation |
| Inkscape | Any recent version | SVG-to-PDF conversion for paper figures |
| mise | Latest | Task runner (optional but recommended) |

### macOS (Homebrew)

```
brew install cmake qt inkscape mise
```

For LaTeX, install [MacTeX](https://www.tug.org/mactex/) or via Homebrew:

```
brew install --cask mactex
```

## Project Structure

```
src/simulations/
  C++/              C++ simulation code (CMake project)
  matlab/Fig2/      MATLAB CSTR simulation scripts
  matlab/Fig5/      MATLAB mechanical system scripts

research-vault/Research Journal/Paper/
  Main.tex          Research paper entry point
  references.bib    Bibliography
  chapters/         Paper sections
  figures/images/   SVG diagrams and PNG screenshots

docs/plans/         Design and implementation documents
```

## C++ Simulations

### Build

```
cd src/simulations/C++
cmake . -B ./build -DCMAKE_BUILD_TYPE=Release
cmake --build ./build
```

The first configure downloads Eigen and cxxplot via `FetchContent` -- internet is required.

### Run

Individual executables:

```
./build/fig2a              # State trajectories (x1, x2 vs references)
./build/fig2b              # Control input u (full + zoomed)
./build/fig2c              # Tracking errors (e1, e2)
./build/fig2a_attacked     # State trajectories under adversarial noise
```

Each executable opens interactive Qt plot windows.

### Validate Against MATLAB

```
./build/validate_output \
  ../matlab/Fig2/fig2a_reference.csv \
  ./fig2a_cpp_output.csv
```

Note: `fig2a` must be run first to generate `fig2a_cpp_output.csv`, and MATLAB reference CSVs must already exist (see MATLAB section below).

### Using mise (recommended)

```
cd src/simulations/C++
mise run debug      # Debug build + run all figures + validation
mise run test       # Release build + run all figures + validation
mise run attacked   # Release build + run attacked simulation only
```

### Tests

```
cd src/simulations/C++/build
ctest
```

## MATLAB Simulations

Open MATLAB and navigate to `src/simulations/matlab/Fig2/`. Run each script individually:

| Script | Output |
|--------|--------|
| `Fig2a.m` | State trajectories + `fig2a_reference.csv` |
| `Fig2b.m` | Control input + `fig2b_reference.csv` |
| `Fig2c.m` | Tracking errors + `fig2c_reference.csv` |
| `Fig2a_attacked.m` | Attacked trajectories (Gaussian noise, sigma=2) |

The CSV files are used by the C++ `validate_output` tool for cross-platform validation. Generate them before running validation.

No special toolboxes are required -- only base MATLAB.

## Research Paper

### Compile

```
cd "research-vault/Research Journal/Paper"
lualatex -interaction=nonstopmode -shell-escape Main.tex
bibtex Main
lualatex -interaction=nonstopmode -shell-escape Main.tex
lualatex -interaction=nonstopmode -shell-escape Main.tex
```

Or with latexmk:

```
latexmk -lualatex -shell-escape Main.tex
```

The `-shell-escape` flag is required -- the `svg` package calls Inkscape at compile time to convert SVG figures to PDF.

## Troubleshooting

**CMake can't find Qt**: Set `CMAKE_PREFIX_PATH` to your Qt installation:
```
cmake . -B ./build -DCMAKE_PREFIX_PATH=$(brew --prefix qt)
```

**Plot windows don't appear**: The executables require a display. On headless systems, try:
```
QT_QPA_PLATFORM=offscreen ./build/fig2a
```

**LaTeX compilation fails on SVG figures**: Ensure Inkscape is installed and on your PATH:
```
inkscape --version
```

**MATLAB `writematrix` not found**: Upgrade to MATLAB R2019a or later.
