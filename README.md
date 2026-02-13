# Defending Tracking Control NN Against Adversarial Attacks

> **Research Project** | CAHSI LREU Spring 2026 | Dr. Pavlo Tymoshchuk (UNT)
> **Author:** Ablasse Kingcaid-Ouedraogo

This repository contains the research notes, simulation code, and documentation for the project **"An Analysis and Simulation of Defending Tracking Control Neural Network for Known Affine Discrete-Time Nonlinear Systems Against Adversarial Attacks."**

---

## 📂 Repository Structure

The project is organized into two main components:

1.  **`research-vault/`**: The Obsidian Knowledge Base.
    *   **`Daily Logs/`**: Daily research logs (created via template).
    *   **`Research Journal/`**: In-depth notes on papers, concepts, and implementation details.
    *   **`templates/`**: Advanced Templater templates for automated note creation.
    *   **`Plans/`**: Project planning documents.
    *   **`Resources/`**: PDFs, presentations, and reference materials.

2.  **`src/simulations/`**: The MATLAB Simulation Code.
    *   **`fig2/`**: Code replicating Figure 2 (CSTR Sliding Mode Control).
    *   **`fig5/`**: Code replicating Figure 5 (Sinusoidal Tracking).
    *   **`scratchpad/`**: Space for quick tests and experiments.

---

## 🚀 Getting Started

### 1. Obsidian Setup
To use the advanced templates, you need the following community plugins installed and enabled in your Obsidian vault (`research-vault/`):

*   **Templater**: For dynamic template generation.
    *   *Settings*: Set `Template folder location` to `templates`. enable `Trigger Templater on new file creation` (optional but recommended).
*   **Dataview**: For dynamic dashboards and queries.
    *   *Settings*: Enable `Enable Javascript Queries`.

### 2. Workflow

**Creating a New Daily Log:**
1.  Open Obsidian.
2.  Press `Cmd + P` (Command Palette) -> `Templater: Create new note from template`.
3.  Select `Daily Research Log`.
4.  Enter the "Focus of the Day" when prompted.
5.  The file will be created in `Daily Logs/YYYY-MM-DD.md`.

**Logging an Experiment:**
1.  Create a new note (or use Templater).
2.  Apply the `Simulation Experiment` template.
3.  Enter the Experiment Name and Simulation Path when prompted.
4.  The file will be renamed to `Exp - [Name] - [Date]`.

**Analyzing a Paper:**
1.  Create a new note.
2.  Apply the `Paper Note` template.
3.  Enter the Paper Title, Author, and Year.
4.  The file will be renamed to `@[CiteKey] - [Title]`.

---

## 📊 Quick Links

*   **[[Project Dashboard]]**: Overview of milestones, tasks, and concept mastery.
*   **[[Research Journal/Daily Logs/2026-02-07|Latest Daily Log]]**: Today's research notes.
*   **[[First Principles Template]]**: Template for deep-diving into new concepts.

---

## 🛠️ Simulation (MATLAB)

To run the simulations:
1.  Open MATLAB.
2.  Navigate to `src/simulations/fig2` (or target folder).
3.  Run `fig2a.m` (or main script).

---

## 📝 License
Proprietary Research Code - CAHSI LREU Program.
