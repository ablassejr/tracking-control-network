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
  C++/                          Shared headers and validation tool
    simulation_types.h          Data structures (StateConditions, SimSettings, etc.)
    plot_downsample.h           Min/max downsampling for visualization
    validate_matlab_cpp.cpp     Cross-platform output validator
    cstr/                       CSTR simulation executables and dynamics
      cstr_dynamics.cpp/h       System dynamics engine (normal + attacked)
      cstr_state_tracking.cpp   State trajectories (x1, x2 vs references)
      cstr_control_input.cpp    Control input u
      cstr_tracking_error.cpp   Tracking errors (e1, e2)
      cstr_state_tracking_attacked.cpp  Attacked state trajectories
      test_attacked_stability.cpp       Attacked simulation stability test
  matlab/
    cstr/                       MATLAB CSTR simulation scripts
    piezo_actuator/             MATLAB piezoelectric actuator scripts

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
./build/cstr/cstr_state_tracking              # State trajectories (x1, x2 vs references)
./build/cstr/cstr_control_input               # Control input u (full + zoomed)
./build/cstr/cstr_tracking_error              # Tracking errors (e1, e2)
./build/cstr/cstr_state_tracking_attacked     # State trajectories under adversarial noise
```

Each executable opens interactive Qt plot windows.

### Validate Against MATLAB

```
./build/validate_matlab_cpp \
  ../matlab/cstr/cstr_state_tracking_reference.csv \
  ./cstr/cstr_state_tracking_cpp_output.csv
```

Note: `cstr_state_tracking` must be run first to generate the CSV, and MATLAB reference CSVs must already exist (see MATLAB section below).

### Using mise (recommended)

```
cd src/simulations/C++
mise run debug      # Debug build + run all CSTR sims + validation
mise run test       # Release build + run all CSTR sims + validation
mise run attacked   # Release build + run attacked simulation only
```

### Tests

```
cd src/simulations/C++/build
ctest
```

## MATLAB Simulations

### CSTR System

Open MATLAB and navigate to `src/simulations/matlab/cstr/`. Run each script individually:

| Script | Output |
|--------|--------|
| `cstr_state_tracking.m` | State trajectories + `cstr_state_tracking_reference.csv` |
| `cstr_control_input.m` | Control input + `cstr_control_input_reference.csv` |
| `cstr_tracking_error.m` | Tracking errors + `cstr_tracking_error_reference.csv` |
| `cstr_state_tracking_attacked.m` | Attacked trajectories (Gaussian noise, sigma=2) |

The CSV files are used by the C++ `validate_matlab_cpp` tool for cross-platform validation. Generate them before running validation.

### Piezoelectric Actuator

Open MATLAB and navigate to `src/simulations/matlab/piezo_actuator/`. Run each script individually:

| Script | Output |
|--------|--------|
| `piezo_position_tracking.m` | Position tracking and error plots |
| `piezo_control_signal.m` | Control voltage signal |
| `piezo_combined_output.m` | Combined 4-subplot view (position, error, control, control zoomed) |
| `piezo_position_velocity.m` | Position, error, and velocity derivative (displaced initial state) |

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
QT_QPA_PLATFORM=offscreen ./build/cstr/cstr_state_tracking
```

**LaTeX compilation fails on SVG figures**: Ensure Inkscape is installed and on your PATH:
```
inkscape --version
```

**MATLAB `writematrix` not found**: Upgrade to MATLAB R2019a or later.
