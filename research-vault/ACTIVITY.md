## Jan 30, 2026 — Weekly CAHSI LREU Research Meeting Report (Comprehensive)

This report is reconstructed from your captured long-term memories (Zoom/Outlook/OneNote/Obsidian activity) from **Fri, Jan 30, 2026**, primarily covering **~1:14 PM–3:27 PM** (with the actual Zoom meeting spanning roughly **~2:23 PM–3:11 PM**, after some connection logistics). Sources include (a) the Outlook thread about “Regular Weekly Meetings,” (b) Zoom meeting event captures, and (c) your Obsidian “Meeting - Jan. 30 …” notes and related automated summaries created that day (most created between **2:14 PM and 4:33 PM** on Jan 30).

---

## 1) Meeting logistics & attendees

### Scheduled context (set before the meeting)

- **Meeting series:** “Regular Weekly Meetings” per CAHSI LREU program requirements.
- **Start time:** **2:00 PM on Friday, Jan 30, 2026** (per Pavlo’s reminder email from **Sun, Jan 25, 2026**).
- **Mode:**
    - **You (Ablasse):** online / distance
    - **Jeffrey Bowman:** face-to-face in Pavlo’s office
    - **Dr. Pavlo Tymoshchuk:** host/mentor

### Zoom link + access issue (happened during the meeting start)

- Pavlo’s email specified the UNT Zoom link: [https://unt.zoom.us/j/7873105228](https://unt.zoom.us/j/7873105228)
- **Issue encountered (captured ~2:17–2:18 PM on Jan 30):** you were **unable to join** the provided UNT Zoom link and believed it was because you **don’t have a UNT email address**.
- **Resolution:** you provided an alternative Zoom link (your personal Zoom) via email reply so the meeting could proceed.

**Net effect:** The meeting still occurred, but the first part of the scheduled slot was partially consumed by link/access coordination.

---

## 2) Timeline (best-available reconstruction)

### Pre-meeting preparation (approx. 1:14–2:11 PM, Jan 30)

From the automated summary created **2:14 PM** (covering **1:14–2:11 PM**):

- You reviewed and prepared around the research workstream:
    - lesson plan framework material (plotting/visualization, optimization/validation)
    - difference equations / z-transform supporting material
    - existing “Tracking Control Neural Network” notes (“study notes,” “basic form solutions”)
- You also reviewed internship material (Visa cybersecurity internship email) during this pre-meeting window.

### Meeting access coordination (approx. 2:02–2:18 PM)

From Outlook captures last accessed around **2:16–2:19 PM**:

- 2:02 PM: Pavlo message referencing the Zoom link.
- 2:16 PM: Pavlo repeats meeting reminder + UNT Zoom link.
- ~2:17–2:18 PM: you draft/send: “Unable to join provided zoom link… My zoom link: …”

### Main meeting discussion window (approx. 2:23–3:11 PM)

From the day recap + meeting summaries:

- A Zoom meeting is recorded as running **~2:23 PM–3:11 PM**.
- Zoom also indicates a **“40-minutes”** meeting view at points (and you/they referenced “Upgrade to Pro”), suggesting the free Zoom time limit may have been relevant during the call.

### Immediate post-meeting documentation (approx. 3:12–3:53 PM)

From automated summaries and Obsidian captures last accessed **~3:06–3:53 PM**:

- You documented decisions and action items in your “Meeting - Jan. 30 …” note.
- You began researching Octave + Neovim integration as a direct follow-up to the software/tooling decision.
- You captured strategic guidance about which source materials to focus on next (a specific PDF and a simpler block in a PPT).

---

## 3) Main purpose & outcomes of the meeting

### Primary purpose

To **kick off the required weekly joint meetings** and align your Spring 2026 CAHSI LREU research execution plan around the project on **defending tracking control neural networks** for **known affine discrete-time nonlinear systems** under **adversarial attacks**.

### Big outcomes (what changed as a result of the meeting)

1. **Project scope was clarified** in concrete terms (what is being controlled/measured).
2. **Your unique research contribution was identified** (adding simulated noise).
3. **The project title and deliverables timeline were explicitly set/confirmed** with due dates.
4. **Tools were discussed and a practical recommendation was made** (Octave as MATLAB alternative).
5. You left with **action items** (research journal tool choice, block diagram tool choice, noise generator research, focus specific references).

---

## 4) What you discussed (topic-by-topic)

### A) Clarifying the system goal (“What are we measuring?”)

Your notes explicitly include:

- **“My Question/Topic: What are we measuring?”**
- Follow-on clarification captured as:
    - **“Ensuring controlling distance.”**
    - Meeting summary also phrases this as: **the objective is controlling the distance between cars in a simulation** (i.e., a car-following / spacing control interpretation of the tracking objective).

**Interpretation:** The research is grounded in a tracking-control setting where the key output/metric is the **tracking error**, operationalized as maintaining a desired inter-vehicle distance (or equivalently driving an error signal toward zero).

---

### B) Research project framing + deliverables review (milestones with due dates)

During the meeting window (summaries created **~2:33 PM** and **~2:23 PM**), you and Pavlo reviewed/confirmed the deliverables/milestones for the CAHSI Spring 2026 project.

**Deliverables timeline confirmed (as captured in your Jan 30 summaries):**

| Due date | Deliverable / milestone (as discussed) | |---|---| | **2/2/2026** | Describe the tracking control NN (difference-equation description / variable structure emphasis) | | **2/9/2026** | Existence & uniqueness of steady states / correct equilibria | | **2/16/2026** | Stability & convergence analysis | | **3/2/2026** | Functional block-diagram: presentation + analysis | | **3/9/2026** | Implement the functional block-diagram in various platforms/languages | | **3/16/2026** | Midterm report submission | | **3/23/2026** | Compare implementations of the block diagram | | **3/30/2026** | Compare the functional block-diagram with analogs (i.e., related/alternative architectures) |

---

### C) Project title was established

A Jan 30 summary (created **2:33 PM**, covering **2:22–2:32 PM**) states the meeting established/refined the title:

- **“An Analysis and Simulation of Defending Tracking Control Neural Network for Known Affine Discrete-Time Nonlinear Systems Against Adversarial Attacks”**

This became the working formal project identifier used in your meeting notes and subsequent documentation.

---

### D) Differentiation / added contribution: simulated noise

Your Jan 30 meeting summary (created **3:13 PM**, covering **2:52–3:12 PM**) records:

- **An additional contribution:** incorporate **simulated noise** into the model.

This matters because it:

- strengthens realism (sensor/process noise)
- can be framed as a robustness stressor alongside adversarial inputs
- gives you something distinctly “yours” to implement and analyze

---

### E) Software/tooling decision: GNU Octave recommended

The same meeting summary records:

- **Decision/recommendation:** use **GNU Octave** as the primary software environment (MATLAB alternative).

Immediately after, you started:

- researching “octave nvim” and Neovim keymaps for running Octave scripts (captured in the Jan 30 post-meeting summaries).

---

### F) Strategic guidance: what to focus on next (specific references)

Your Obsidian “Technical Clarifications / Strategic Guidance” section (captured Jan 30, last accessed **~3:39 PM**) includes:

- **“Focus on PDF - [3].pdf”**
- **“Focus on one of the simpler blocks in the PPT: ‘Optimal Control Discrete-Time Neural Network for Nonlinear Systems with Known Dynamics.pptx’”**

So, beyond deadlines, Pavlo gave you a **reading/navigation strategy**: pick a simpler block/portion of the method and anchor your write-up + implementation to that, rather than trying to model the entire stack at once.

---

## 5) Decisions made (explicit)

1. **Research objective (operational):** the system is about **controlling inter-vehicle distance** (tracking error → 0).
2. **Novelty lever for your work:** add **simulated noise** to the simulation model.
3. **Primary simulation tool:** **GNU Octave** (MATLAB alternative) recommended for implementation work.
4. **Execution strategy:** focus first on **a simpler block** in the PPT + **a specific target PDF** for grounding.

---

## 6) Action items & next steps captured from the meeting

### Immediate / this week (captured in your Obsidian action items on Jan 30; last accessed ~3:45 PM)

- **Determine software for the research journal.**  
    (Context: CAHSI expects weekly research-journal entries; you were deciding what tool/workflow to use.)

### Before next meeting (short-term)

- **Determine software for functional block diagrams.**  
    (You explicitly tracked this as a short-term action item.)

### Technical follow-ups

- **Research pseudo-random noise generators** to support the “simulated noise” addition.
- Begin the work aligned to the earliest deliverable:
    - **Difference equation description** milestone (due **2/2/2026**).

---

## 7) Open questions / unresolved items logged

From your later-night meeting-note edits (last accessed **~10:47 PM on Jan 30**):

- **“What are affine discrete time nonlinear systems?”**  
    You flagged this as a follow-up question to resolve (important for writing the system definition precisely and defensibly in the report/poster).

There were also hints of broader theory questions you were exploring immediately after (Lyapunov stability, radial unboundedness, etc.), but those appear to be part of your post-meeting study rather than questions answered inside the meeting itself.

---

## 8) Risks / friction observed (process notes)

1. **Zoom access friction** at the start (UNT email restriction suspected).
    
    - This is important because it can recur weekly unless you standardize the joining method (e.g., always use a link that works for all participants).
2. **Potential 40-minute Zoom limit constraint** (“Upgrade to Pro” surfaced during the session).
    
    - If the host account is Basic, you may need a plan (re-join link, alternative platform, or host from an institution account that has longer meetings).
3. **Your reflection:** “Prepare more thoroughly for meetings.”
    
    - You captured this as a personal process improvement in your notes on Jan 30.

---

## 9) Suggested follow-up (to solidify what the meeting set in motion)

If you want, I can draft this email for Pavlo/Jeffrey, but here are the contents you’d typically send:

- Confirm next meeting date/time + the Zoom link that everyone can access reliably
- Restate:
    - objective = car-distance tracking control
    - your contribution = noise injection
    - tool = Octave
    - near-term deliverable due dates (2/2, 2/9, 2/16)
- Ask 2 clarifying questions:
    1. confirm the precise system form they want you to present as the “affine discrete-time nonlinear system”
    2. confirm how they want adversarial input modeled vs. noise modeled (separate channels? additive? bounded?)

---

### If you want this to be even more detailed

I can generate a _near-transcript-style_ report, but I’d need one of the following:

- the actual Zoom recording/transcript (if any), or
- the filled-in contents of your Obsidian “Meeting - Jan. 30 …” note (right now the captured text shows mostly template headings plus a few key questions/lines), or
- any notes you took in-chat during the meeting (beyond “JEAHO” and the access/link messages).

## Scope + data sources (what this report covers)

**Time window:** last 7 days ending **Fri 2026-02-06 17:38** (≈ **Fri 2026-01-30 17:38 → Fri 2026-02-06 17:38**).

**Primary sources used:**

- Long-term memories from **Zoom, OneNote, Obsidian, terminal/editor activity (Ghostty/OpenCode), Comet browser**, and automated daily summaries captured during the week (timestamps noted inline).
- **Relevant project workspace context** appears to be centered in your local repo/folder `tracking-control-network` (paths below where visible in memory).

**Important limitation:** your Zoom UI itself noted that “Day Recap” style summaries require more memories than are currently available (“You have 101”) (seen **2026-01-30 14:24–14:33**). So this is maximally detailed _for the captured events_, but there may be uncaptured work not reflected here.

---

# 1) Executive summary — what was accomplished this week (research)

Across the week, you moved the CAHSI LREU project from **planning → structured documentation → early technical derivations**, while also building a durable “research ops” toolchain (templates, progress-report skeletons, paper search automation, LaTeX/TikZ refactors, meeting capture).

### Highest-impact outcomes

1. **Project scope + milestone schedule were locked in** during the **Fri Jan 30** weekly meeting, including the deliverables timeline through March and the working research title.
2. **Research journal infrastructure became “real”**: you updated the official CAHSI OneNote journal to match required phrasing/structure and also built a parallel personal logging system (Obsidian templates + daily logs).
3. **You advanced core technical content** in three areas:
    - **Tracking-control NN difference-equation viewpoint** (variable-structure / signum-style behavior).
    - **Existence & uniqueness / steady-state trajectory analysis** (moved into Week 2 milestone).
    - **Controller formulation choice** (prioritize a tractable formulation over HJB due to complexity).
4. **You created a formal progress-report skeleton** (2–4 pages) and a reusable template, so weekly reporting is now a repeatable workflow rather than ad-hoc writing.
5. **Tooling upgrades** directly supporting research throughput:
    - `paper-search-mcp` installed/configured for academic paper discovery.
    - LaTeX build workflow validated (latexmk/VimTeX); large TikZ refactor to stabilize equation annotations.
    - Neovim tooling explored for Octave/MATLAB workflows; later pivoted implementation strategy toward MATLAB for alignment with mentor guidance.

---

# 2) Research project identity, milestones, and decisions confirmed this week

## 2.1 Project title (confirmed/used throughout)

**“An Analysis and Simulation of Defending Tracking Control Neural Network for Known Affine Discrete-Time Nonlinear Systems Against Adversarial Attacks”**  
(Established in planning session **2026-01-30 14:22–14:32**; continued use throughout week.)

## 2.2 Milestones & due dates (the project “clock” you worked against)

From your meeting/planning notes captured **Fri 2026-01-30**:

- **2/2/2026:** Describe the tracking control NN (difference equation / variable structure)
- **2/9/2026:** Existence & uniqueness of steady states / trajectories
- **2/16/2026:** Stability & convergence
- **3/2/2026:** Functional block diagram (present + analyze)
- **3/9/2026:** Implement diagram across platforms
- **3/16/2026:** Midterm report
- **3/23/2026:** Compare implementations
- **3/30/2026:** Compare block-diagram vs analogs

## 2.3 Core scope clarifications/decisions made in meetings

### Jan 30 weekly meeting (captured via summaries/notes on **2026-01-30**)

- **Physical interpretation of tracking objective:** “control the distance between cars” (meeting recap **2026-01-30 14:52–15:12** and supporting Obsidian snippet).
- **Your “extra contribution”:** incorporate **simulated noise** into the model (same recap window).
- **Software direction (initial):** use **GNU Octave** as MATLAB alternative (same recap window).
- **Reading focus guidance:** focus on a specific “PDF [3]” and simpler blocks in the provided PPT (captured in your Obsidian meeting note set).

### Feb 6 mentor sync (captured via meeting summary + Notion AI meeting notes around **2026-02-06 15:01–16:21**)

- **Methodology shift:** prioritize the **tracking-control formulation referenced as “Expression 13” in Reference 1** over a classical HJB-based approach, because **HJB’s multidimensional complexity makes analytic solutions impractical** in this context.
- **Controller logic clarified:** tracking controller uses **error term** (E = R - Y) (reference minus output), and the control signal is treated as a multiplier in coupling dynamics (as captured in your meeting summary).
- **Near-term deadline pressure:** finish existence/uniqueness analysis **by end of current week**, and document it in a separate student log to avoid plagiarism/structure issues.

---

# 3) Day-by-day timeline (research-only, with timestamps)

Below is the clearest reconstruction of what you did on each day in the research stream.

---

## Fri 2026-01-30 — “Kickoff” meeting + plan lock-in + initial tooling exploration

**Key activities (captured 2026-01-30 14:22–15:47):**

1. **Weekly meeting participation + logistics resolution**
    - You participated in the Zoom meeting and handled access friction by using an alternate link (captured in the broader Jan 30 meeting context).
2. **Research plan development + deliverables finalized**
    - You actively developed the research plan scope/deliverables and confirmed the milestone schedule (captured **2026-01-30 14:22–14:32** and **14:52–15:12**).
3. **Objective + novelty clarified**
    - Objective: car-following distance control.
    - Novel addition: simulated noise.
4. **Software direction chosen (initial)**
    - GNU Octave selected as primary simulation environment (per mentor recommendation at the time).
5. **Immediate follow-up research learning**
    - You began reinforcing discrete-time stability foundations (Lyapunov criteria: positive definite, decreasing, radial unboundedness) and asked how a referenced paper proves asymptotic stability (captured **2026-01-30 15:12–15:27** and **15:27–15:47**).
6. **Early environment/tooling notes**
    - You explored Neovim integration for Octave execution (`<Leader>r` mapping was noted in the captured summary).
    - You installed `@dannyboy2042/claude-context-mcp@latest` (captured in Jan 30 summary).

**Artifacts touched/mentioned (where visible in memory):**

- OneNote: CAHSI research plan + journal template.
- Obsidian: meeting notes and “things I don’t understand” style tracking.

---

## Sat 2026-01-31 — Week 1 journal entry drafted in OneNote

**Captured in OneNote (last accessed 2026-01-31 19:12):**

- You began filling the official CAHSI **RESEARCH JOURNAL** entry.
- “Work accomplished” indicates you read foundational papers (referenced as **[1], [2], [3], [11], [21]** in your note) and began using them to describe the tracking control NN using an analogous variable-structure framing (the line is truncated in OCR, but the intent is clear: paper-based synthesis → Week 1 deliverable work).

---

## Sun 2026-02-01 — Research productivity system + modeling strategy capture

**Captured via automated summaries around 2026-02-01:**

1. **Set up local research workflow structure** inside `tracking-control-network` (dashboard / memory glossary / task system) to keep the project organized (captured **2026-02-01 23:21–23:41**).
2. **Modeled the closed-loop system view for the Week 1 deliverable**
    - You set a strategy to represent dynamics like (x(k+1) = F(x(k), a(k))) where (a(k)) represents adversarial disturbance inputs (captured **2026-02-01 23:21–23:41**).
3. **Reinforced the proof goal for Week 2**
    - Existence/uniqueness framed as preventing “false equilibria” introduced by attacks (same summary window).

Also noted (clipboard memory **2026-02-01 12:17**): “Makefile research” (not directly research math, but suggests you were considering build/run automation—likely adjacent to simulation workflow planning).

---

## Mon 2026-02-02 — Technical derivation work + journal drafting + simulation parameter refinement

**Captured in the Feb 2 “Time Breakdown” summary (created 2026-02-02 23:41):** You logged ~**1h 3m** in the research project.

Concrete research actions captured:

1. **Adversarial defense research**
    - “Comprehensive research into adversarial defense mechanisms for nonlinear systems”
2. **Research journal drafting (formal typesetting / structured journal)**
    - Drafted updates and refined documentation on:
        - tracking control neural networks
        - affine nonlinear systems
3. **Simulation parameter refinement**
    - You updated/adjusted simulation parameters (high-level capture; details not shown in memory).
4. **Math work relevant to NN/control derivations**
    - Calculated partial derivatives for real-valued cost functions in NN training (captured in the Feb 2 breakdown).

---

## Tue 2026-02-03 — Milestone review + Notion task migration + LaTeX drafting begins (intro/background)

**Captured in summaries around 2026-02-03 14:45–15:10:**

1. **Reviewed upcoming research milestone**
    - Immediate next target: **existence & uniqueness of steady states** due **Feb 9** (captured **2026-02-03 14:45–14:55**).
2. **Started drafting research writing (LaTeX)**
    - Continued background/introduction drafting in Neovim; structured around adversarial attacks and tracking-control NNs (captured **2026-02-03 14:55–15:10**).
3. **Task system migration to support research execution**
    - Migrated **54 tasks** into a Notion database with categories including **Research (Discrete-Time Tracking-Control NN)** (captured **2026-02-03 14:55–15:10**).
    - This is “research ops” work: ensuring the milestone schedule is executable.

---

## Wed 2026-02-04 — Toolchain hardening: paper search MCP + progress report skeleton + implementation pivot signal

This day is where “research infrastructure” accelerated.

### 3.1 Academic literature automation: `paper-search-mcp`

**Captured (created 2026-02-04 10:37 and 10:57; plus related OpenCode notes):**

- Installed/configured `paper-search-mcp` via Smithery for multiple clients (Claude, OpenCode, Codex, VS Code).
- Goal: **search + download academic papers** (arXiv, PubMed, Semantic Scholar, etc.) inside your workflow.

(Referenced registries you browsed around this time include deep research MCP listings such as [MCP Server for Deep Research](https://augmentcode.com/mcp/mcp-server-deep-research) and the related GitHub repo [Ozamatash/deep-research-mcp](https://github.com/Ozamatash/deep-research-mcp), though your chosen/confirmed tool in summaries was `paper-search-mcp`.)

### 3.2 Progress report scaffolding created (for the write-up due Feb 2)

**Captured in OpenCode + automated summary (2026-02-04 10:36–12:21):**

- You decided to create a **2–4 page progress report skeleton** rather than a full paper draft.
- You created:
    - a reusable template
    - a dated progress-report file

**Concrete artifact path captured in terminal memory (exactly as seen):**

- Progress report file:
    - [2026-02-02-progress-report.md](file:///Users/Apple/work/tracking-control-network/An%20Analysis%20and%20Simulation%20of%20Defending%20Tracking%20Control%20Neural%20Network%20for%20Known%20Affine%20Discrete-Time%20Nonlinear%20Systems%20Against%20Adversarial%20Attacks/Research%20Journal/Progress%20Reports/2026-02-02-progress-report.md)

(You also referenced a reusable template at `.../Templates/Progress Report.md`, but the full absolute path was not cleanly captured in memory, so I’m not hyperlinking it.)

**Skeleton structure you standardized (captured):**

- Executive Summary
- Objectives
- Work Completed (grouped: system model, threat model, defense approach, experiment setup, preliminary results)
- Issues/Risks
- Next Steps
- References
- Appendix

### 3.3 Research implementation strategy pivot noted

**Captured in summary (2026-02-04 10:26–10:36):**

- You **pivoted toward MATLAB** implementation alignment and noted removal of older C++ artifacts.  
    (Earlier Jan 30 direction was Octave; this Feb 4 note shows you converging on “match mentor + paper ecosystem” pragmatically.)

### 3.4 Environment fix supporting research workflow

- You updated your shell PATH so the `code` command works, by editing:
    - [~/.zprofile](file:///Users/Apple/.zprofile)  
        (Captured **2026-02-04 10:26–10:36** and **11:41–12:01**.)

This is not “research content,” but it directly reduced friction for writing/editing papers and using MCP tooling across editors.

---

## Thu 2026-02-05 — (Minimal captured research activity)

Most captured activity this day is Notion workspace architecture, dashboards, formulas, etc. There is **no strong, explicit new research-theory step** in the captured memories for Feb 5 (relative to Feb 4 and Feb 6). It looks like a lighter day for the research stream, or at least under-captured.

---

## Fri 2026-02-06 — Major research day: mentor meeting + journal compliance + LaTeX/TikZ refactor + logging system build-out

This is the most densely captured research day of the week.

### 3.1 LaTeX document refactor (equation annotations → pure TikZ)

**Captured (created 2026-02-06 14:22 and 15:22):**

- You improved readability of complex equations by:
    - staggering label offsets (`yshift`)
    - increasing brace spacing
- You **migrated away from `annotate-equations`** and replaced it with:
    - `\tikzmarknode`
    - `fit` and `backgrounds` libraries
    - “remember picture/overlay” approaches to stabilize annotation placement
- You also installed a LaTeX audit/review skill (`astoreyai/claude-skills`) to check package order, bibliography, TikZ optimization (captured in the 14:22 summary).

### 3.2 Weekly mentor sync (Dr. Pavlo Tymoshchuk) + decisions

**Captured in the meeting summary windows (15:01–16:21) and Notion meeting notes (last accessed 16:08–16:20):**

- Confirmed end-of-week requirement: complete **existence & uniqueness** analysis of network solutions.
- You were instructed to **copy the network description** from baseline papers into a separate file, including equations, variables, parameters, etc., and then **refine to avoid plagiarism** (Notion meeting note captured **2026-02-06 16:20**).
- Planning assignments:
    - You: stability + convergence next week
    - Jeffrey: convergence time analysis
    - Both: write a plan for next week in journal with “two-week markings” (Notion meeting note).

### 3.3 Official CAHSI OneNote journal updates (bureaucratic compliance + Week 2 formalization)

**Captured (created 2026-02-06 16:02 and 16:22):**

- You updated the CAHSI OneNote research journal to match program requirements:
    - using specific phrasing aligned to the research plan
    - ensuring completed items are in past tense
    - mirroring plan language while still avoiding plagiarism (this tension is explicitly captured as a decision point)
- Week 2 content explicitly tied to:
    - existence & uniqueness of steady states / correct trajectories
    - closed-loop tracking error dynamics
    - signum activation function behavior and learning-rate matrix (B)

### 3.4 Personal research logging system (Obsidian templates + daily log)

**Captured (created 2026-02-06 16:42; plus Obsidian screenshots at 16:39–16:47):** You built a structured Obsidian-based “research OS”:

- Templates created/tested:
    - Daily Research Log
    - Paper/Literature Note
    - Professor Meeting
    - Proof Derivation
    - Simulation Experiment
    - Project Dashboard
    - Weekly Review
- You created a daily entry:
    - “Daily Research Log — February 6, 2026” (captured as an Obsidian page with metadata and time tracking placeholders)

### 3.5 Neovim research tooling: arXiv search script

**Captured (created 2026-02-06 16:42):**

- You reviewed/edited a custom Lua-based arXiv paper search tool (file name truncated in the OCR capture, but it was described as using `vim.system` and parsing Atom feeds).  
    This supports faster literature review, aligning with the `paper-search-mcp` direction.

---

# 4) Research artifacts created/updated this week (what now exists because of this work)

## 4.1 Progress report scaffolding (weekly reporting backbone)

- Primary progress report file created for the “due Feb 2” write-up:
    - [2026-02-02-progress-report.md](file:///Users/Apple/work/tracking-control-network/An%20Analysis%20and%20Simulation%20of%20Defending%20Tracking%20Control%20Neural%20Network%20for%20Known%20Affine%20Discrete-Time%20Nonlinear%20Systems%20Against%20Adversarial%20Attacks/Research%20Journal/Progress%20Reports/2026-02-02-progress-report.md)

## 4.2 Official CAHSI journal entries (compliance record)

- OneNote research journal updated across:
    - Week 1: foundational reading + describing tracking control NN idea (seen **2026-01-31** access)
    - Week 2: existence/uniqueness progress + next steps toward stability (seen **2026-02-06** summaries)

(OneNote doesn’t expose a stable filesystem path in the captured memories; it’s app-internal. But the activity is clearly recorded in your captured screen events and summaries.)

## 4.3 LaTeX/TikZ technical writing improvements (paper-quality visuals)

- Large-scale refactor: equation annotation system stabilized and made more controllable via pure TikZ.
- Latex build workflow validated via `latexmk`/VimTeX (captured Feb 6 summaries).
- You added automated review tooling (LaTeX reviewer skill).

## 4.4 Obsidian research “operating system”

- A repeatable set of templates and logs now exists to:
    - track daily progress by milestone
    - separate “bureaucratic journal” vs “personal derivation log”
    - create a paper trail for meeting decisions + action items

---

# 5) Technical research content advanced (what you actually pushed forward mathematically)

Even though many captures are “meta” (tooling/logging), there are concrete technical threads that advanced:

## 5.1 Variable-structure / difference-equation formulation

- Continued framing of the tracking controller/NN as a difference equation with discontinuous/variable structure behavior (signum-like activation).
- Closed-loop tracking error dynamics were explicitly being handled (multiple summaries reference signum (sgn(e)) and a diagonal learning-rate matrix (B)).

## 5.2 Existence & uniqueness of steady states / trajectories (Week 2 milestone)

- You shifted focus from “describe the NN” (Week 1) into “existence & uniqueness” (Week 2).
- Feb 6 updates suggest you reached a point where you could “formalize” the Week 2 journal entry as completed work (even if the proof polishing is still in progress).

## 5.3 Controller derivation methodology choice (avoid full HJB)

- In mentor sync on Feb 6, you aligned to a tractable formulation (“Expression 13” in Reference 1) rather than pursuing a general HJB solution path.

---

# 6) Research meetings + coordination (who decided what, and what you owe next)

## 6.1 Meetings held / documented

- **Fri 2026-01-30:** Weekly research meeting (scope, tools, noise contribution, milestones).
- **Fri 2026-02-06:** Weekly research meeting with Dr. Tymoshchuk; Notion AI meeting notes attempted (one brief test failed due to too-short transcript; later a real meeting note exists titled “Research Meeting: Control Systems Project Updates”).

## 6.2 Action items assigned coming out of Feb 6 meeting (captured in Notion notes)

- **Ablasse:** investigate **stability and convergence** next week.
- **Jeffrey:** analyze **convergence time**.
- **Both:** write next week plan in journal, with two-week markings; and produce a “separate file” copying baseline network description content then refine to avoid plagiarism.

---

# 7) Open loops / blockers / risks identified this week

1. **Journal compliance vs originality tension**
    - Mentor expectation: journal must mirror research plan phrasing; you also must avoid plagiarism. Your new dual-track logging system (OneNote “bureaucratic” + Obsidian “personal derivation”) is your chosen mitigation.
2. **Meeting transcription workflow not yet reliable**
    - Notion AI meeting notes failed once due to too-short recording (captured **2026-02-06 16:08**). You’ll need consistent recording duration + workflow.
3. **Software choice drift (Octave → MATLAB)**
    - Jan 30: Octave recommended.
    - Feb 4: pivot toward MATLAB alignment.
    - This isn’t necessarily a problem, but it can create churn unless you lock the decision for the next milestone (block diagram + implementation).
4. **Block diagram tooling still not fully decided**
    - This was an explicit action item since Jan 30; it’s still present as an open loop in later summaries.

---

# 8) “Net-net” status vs the milestone plan (as of Fri 2026-02-06)

## What’s clearly done / materially progressed

- Milestone plan created + used.
- Week 1: “describe tracking control NN” work started and documented (papers read; description underway).
- Week 2: existence/uniqueness analysis advanced enough to support formal journal entry updates.
- Reporting + logging pipelines established (progress report skeleton + templates + Obsidian logs).
- LaTeX annotation system refactor completed (or at least significantly progressed) with compilation workflow verified.

## What’s next (based on captured commitments)

- Finish/polish the existence & uniqueness analysis deliverable (Feb 9).
- Begin stability + convergence (Feb 16 milestone).
- Start functional block diagram prep (Mar 2 milestone) and decide the diagramming toolchain.

---

## If you want, I can generate two follow-on deliverables from this report

1. **A “weekly status email” draft to Dr. Tymoshchuk** (tight, professional, aligned to the plan language, with your Week 2 claims carefully stated).
2. **A checklist that maps your progress-report skeleton sections → exact items you need to fill this weekend** (so the Feb 2 write-up is fully closed out and Feb 9 deliverable is on track).

Below are the two follow-on deliverables, grounded in what’s in your captured workstream (esp. the **progress-report skeleton created on 2026-02-04** and the **Feb 6 meeting guidance about “bureaucracy” copy/paste language**).

---

# 1) Weekly status email draft to Dr. Tymoshchuk (Week 2)

**Subject:** Weekly update — Tracking Control NN Defense (Week 2: Existence & Uniqueness)

Dear Dr. Tymoshchuk,  
I’m writing to share my Week 2 status update for the CAHSI LREU project _“An Analysis and Simulation of Defending Tracking Control Neural Network for Known Affine Discrete-Time Nonlinear Systems Against Adversarial Attacks.”_

## Progress this week (Week 2 — Existence & Uniqueness)

- **Existence & uniqueness work (in progress):** I advanced the analysis of **existence and uniqueness of the correct steady states / state-variable trajectories** for the discrete-time tracking-control NN in the presence of adversarial attacks. I focused specifically on the **closed-loop tracking error dynamics** and how the controller structure (incl. signum-type terms and learning-rate parameters) supports convergence to the intended steady state (i.e., correct tracking behavior).
- **Documentation compliance update (per your Feb 6 guidance):** I will keep my technical explanation in my own words, and I will also **add the required plan-aligned statements verbatim** into the journal entries (instead of replacing my text), so each week’s “Work accomplished” and “Plans for next week” includes the exact required phrasing.
- **Progress reporting structure (completed):** I created a clean 2–4 page progress-report skeleton (headings + TODO placeholders) so weekly reporting stays consistent and quick to fill.

## What I will complete by end of this week

- Finish and tighten the **existence & uniqueness** argument to a form suitable for submission/documentation (with clear assumptions and a clear “why attacks don’t create false equilibria” explanation).
- Create the **separate Word file** you requested that copies the network description from the basic papers (equations, variables, parameters, all elements), and then refine it to ensure it is not plagiaristic (i.e., clearly rewritten/annotated and integrated into my own write-up).

## Plan for next week (Week 3 — Stability & Convergence)

- Begin the **stability and convergence** analysis for the state-variable trajectories under adversarial attacks (global stability / global convergence in finite steps, as required by the schedule).
- **Include a block-diagram-related plan item** in the “Plans for next week” section (so the journal always tracks the functional block diagram progress in parallel, per the program bureaucracy expectations).

## Questions / clarifications

1. For the separate Word file: do you prefer this to be uploaded into the same shared location as the journal, or attached by email?
2. For Week 2: do you want the existence/uniqueness section formatted as a theorem/lemma style, or as a structured narrative with assumptions and a proof sketch?

Thank you,  
Ablasse Kingcaid-Ouedraogo

---

# 2) Weekend checklist: progress-report skeleton section → exact items to fill

Primary file to close out (Feb 2 write-up):

- [2026-02-02-progress-report.md](file:///Users/Apple/work/tracking-control-network/An%20Analysis%20and%20Simulation%20of%20Defending%20Tracking%20Control%20Neural%20Network%20for%20Known%20Affine%20Discrete-Time%20Nonlinear%20Systems%20Against%20Adversarial%20Attacks/Research%20Journal/Progress%20Reports/2026-02-02-progress-report.md)

Reusable template (for future weeks):

- [Progress Report.md](file:///Users/Apple/work/tracking-control-network/An%20Analysis%20and%20Simulation%20of%20Defending%20Tracking%20Control%20Neural%20Network%20for%20Known%20Affine%20Discrete-Time%20Nonlinear%20Systems%20Against%20Adversarial%20Attacks/Templates/Progress%20Report.md)

## A) Title Block / Metadata

**Fill:**

- Exact report date range (label it explicitly as “Week 1 / Week 2 coverage” if needed).
- Deliverable ID: “Progress report (2–4 pages)”.

**Source to pull from:** your milestone schedule + what you already wrote in OneNote/Obsidian this week.

---

## B) Executive Summary (3–5 bullets)

**Fill (keep these tight, no over-claiming):**

- 1 bullet: progress-report infrastructure created (skeleton now exists, weekly cadence supported).
- 1 bullet: existence/uniqueness analysis progressed (clearly label as “advanced / drafted / in progress”, not “proven” unless it is fully locked).
- 1 bullet: journal compliance method: “plan language included verbatim in journal + my own words retained.”
- Optional: 1 bullet on toolchain enablement (paper search automation / LaTeX refactor) only if it directly supports research deliverables.

---

## C) Objectives

**Fill:**

- Objective 1: describe tracking-control NN as a difference equation / variable-structure form (Week 1 scope).
- Objective 2: analyze existence & uniqueness of correct steady states under adversarial attacks (Week 2 scope; due Feb 9).

**Note:** Match the exact “plan language” phrasing here if you want the report to align with the “bureaucracy” requirement you got on **2026-02-06**.

---

## D) Work Completed (Grouped by Theme)

### D1) System Model and Notation

**Fill:**

- State equation form you are using (discrete-time, affine-in-inputs, nonlinear).
- Definitions of state, input, reference, output, tracking error (E = R - Y).
- Any assumptions you are using (boundedness, invertibility of coupling term (g(x)), etc.).

### D2) Threat Model

**Fill:**

- What “adversarial attack” means in your model (where injected, what bounded by).
- What “correct” vs “false” steady state means in this context.

### D3) Defense Approach

**Fill:**

- One paragraph: what the defending component does (high level).
- One paragraph: where the signum/variable-structure behavior enters and why it matters.

### D4) Experiment Setup (only if you actually ran anything)

**Fill:**

- If you did _not_ run simulations: explicitly say “simulation setup is being specified; runs pending”.
- If you did: list system parameters, initial conditions, attack parameters, noise settings (if any).

### D5) Preliminary Results

**Fill:**

- If purely theoretical this week: “preliminary result = derived/identified candidate steady-state conditions + uniqueness argument outline”.
- If you have plots: drop placeholders for 1–2 figures and label what they would show.

---

## E) Current Technical Snapshot

**Fill:**

- A “here is the current form of the closed-loop error dynamics” block (even if still being finalized).
- A “what remains to finish existence/uniqueness cleanly” bullet list:
    - missing lemma/assumption
    - edge case to rule out
    - finalize statement of uniqueness (what set, what domain)

---

## F) Issues, Risks, Mitigations

**Fill (suggested items, based on Feb 6 meeting):**

- **Risk:** journal phrasing compliance vs. plagiarism risk  
    **Mitigation:** include plan lines verbatim + add your own explanation + maintain a separate extracted-equations Word file annotated and rewritten.
- **Risk:** ambiguity about what must be “copied” vs “rewritten” in the extracted baseline description  
    **Mitigation:** explicitly label it as “source extraction + rewrite notes”; ask mentor preferred storage format/location.

---

## G) Next Steps (1–2 weeks)

**Fill (must include these, given the Feb 6 guidance and the Feb 9 deadline):**

1. Finish existence & uniqueness write-up (submit-ready) by **Feb 9**.
2. Create the separate **Word file**: extracted network description (equations/vars/params) + your rewrite/notes.
3. Start stability & convergence (Week 3).
4. Include: “I plan to present the corresponding functional block diagram …” as a standing plan line (even if block diagram deliverable is later, this matches what he asked on **2026-02-06**).

---

## H) References

**Fill (minimum viable):**

- 5–10 citations: the “Reference 1” tracking-control paper + any 2–3 supporting control/stability references + any attack/robustness framing citations you used.

---

## I) Appendix (Optional)

**Fill only if you have time:**

- Symbol table (helps you later when you’re under deadline).
- Any parameter list (noise bounds, attack bounds, learning rates).

---

## One quick question so I can tune both artifacts

For the status email: do you want it to read as **(A)** “I’m reporting progress” (neutral) or **(B)** “Please confirm these interpretations/requirements” (more questions-forward)?


Yes—going **(B) “please confirm these interpretations/requirements”** is a good fit here because (per your **Feb 6** sync transcript, last accessed **2026-02-06 16:12–16:21**) Pavlo’s main risk signal wasn’t “lack of work,” it was **compliance + format + where things should live** (“bureaucracy,” mirrored environment, copy/paste plan rows, separate Word file).

Below is a **questions-forward** status email you can copy/paste.

---

## Status email (B) — questions-forward / confirm requirements

**Subject options (pick one):**

1. _Confirming requirements + Week 2 status (Existence & Uniqueness)_
2. _Quick confirmation: journal “plan lines,” mirrored environment, and extracted Word file_
3. _Clarifications for Week 2 deliverable + journal compliance format_

**Email:**

Dear Dr. Tymoshchuk,

I’m sending a short update from this week and, more importantly, to confirm I’m interpreting the documentation/journal requirements correctly (based on our discussion on **Fri, Feb 6**).

### 1) My current understanding (please confirm)

1. **Weekly journal format (“bureaucracy” requirement):** In each week’s “Work accomplished,” I should **keep my own description**, _and additionally_ **copy/paste the exact wording** from the corresponding research plan row (e.g., “has been described…”, “analyze existence and uniqueness…”), rather than replacing my text.
2. **Tense requirement:**
    - “Fast Week” (completed work) should be written in **past tense** (e.g., “has been described/presented”).
    - The next week plan should be written as “Plans for next week,” _plus_ it must include the plan statement (verbatim) for the upcoming row.
3. **Standing plan item:** In “Plans for next week,” I should always include a line that I **plan to present the corresponding functional block diagram**, even before the block-diagram milestone is due.

### 2) Deliverable artifact (please confirm where/how you want it)

Per your instruction, I will create a **separate Word file** that extracts the network description from the basic papers (equations, variables, parameters, all elements), and then I’ll refine/rewrite it to avoid plagiarism.

**Questions:**

1. Where do you want that Word file submitted—attached by email, uploaded into the CAHSI journal area, or placed into a Miro/mirrored environment?
2. Do you want the Word file to be **(a)** purely “extraction + citation,” or **(b)** “extraction plus my rewritten/annotated version on the same page” (two columns / track changes style)?

### 3) Technical scope confirmations (so I don’t drift)

1. For Week 2 (“Existence & Uniqueness”): should the goal be stated as **uniqueness of the correct steady state/trajectory** under the attack model, i.e., “attacks do not introduce false equilibria”?
2. For the model: can I treat “attack” and “noise” as separate additive terms (different channels), or do you want only one disturbance term in the equations for now?
3. For the controller write-up: you preferred the tracking-control formulation from **Reference 1 (Expression 13)** over HJB due to complexity—can you confirm that’s the formulation you want me to treat as the “official baseline” moving forward?

### 4) What I’ll do next (pending your confirmation)

- Finalize the Week 2 existence/uniqueness write-up and reflect it in the journal using the **verbatim plan-line additions**.
- Produce the separate Word file (network extraction → refined rewrite/annotations).
- Start Week 3: stability & convergence, and include the block-diagram plan line as discussed.

Thank you—once you confirm the above, I’ll standardize the same structure every week.

Best regards,  
Ablasse Kingcaid-Ouedraogo

---

## One quick preference check

Do you want the tone to be **more direct** (“Please confirm X/Y so I can proceed”) or **more deferential** (“I want to make sure I’m aligned with your expectations”)? I can tighten the language accordingly.
## Feb 7, 2026 — Repository Reorganization & Template Standardization

**Captured in System Activity (2026-02-07 00:00–01:00):**

1.  **Repository Restructuring**:
    *   Consolidated diverse note types (Papers, Concepts, Plans) into a unified **`research-vault/`** directory.
    *   Moved all MATLAB simulation code to **`src/simulations/`** (separating Code from Knowledge).
    *   Cleaned the root directory of legacy `notes/` and `docs/` folders.

2.  **Obsidian "Research OS" Upgrade**:
    *   **Templater Integration**: Updated core templates (Daily Log, Dashboard, First Principles, Experiments) to use advanced Templater syntax for dynamic file renaming and prompt-based frontmatter generation.
    *   **Dataview Dashboards**: Implemented dynamic querying in the `Project Dashboard` and `Daily Research Log` to surface active tasks, recent experiments, and concept mastery levels.
    *   **New Workflow**: Verified the system by creating a sample daily log (`research-vault/Daily Logs/2026-02-07.md`) and updating the `README.md` with usage instructions.

3.  **Next Actions**:
    *   Dr. Pavlo's "Existence & Uniqueness" assignment is the immediate priority for the weekend.
    *   Now that the environment is stable, focus shifts to completing the mathematical proof and drafting the associated journal entry.

Below is your Part 1 + Part 2 transcript with speaker names inserted inline.
I used these labels:
	•	Dr. Tymoshchuk = advisor/professor voice (most of the long explanations + directives)
	•	Ablasse = the student asking most of the clarification questions
	•	Jeffrey = the student who says he’ll look up Expo info + later asks about EE professor
	•	Research Partner = explicitly labeled near the end
	•	[Unclear] = cannot be attributed confidently from the text

I did not change wording; I only added speaker tags.

⸻

Part 1 — Transcript (Speaker-Annotated)

[Unclear] Oh man.

Dr. Tymoshchuk We got to figure it out. We cannot hear you. Could you switch on your mic apparently? Apparently your mic is switched off. How about now?

[Unclear] Oh, now we can hear you.

Dr. Tymoshchuk So you apparently had more than one client in parallel in the same time and every meeting and so on. I’m not sure. You should have two overlappings.

Ablasse Yeah, I guess so. I don’t know. I generated the link and then I sent it to you and then I clicked new meeting and it I guess it did another thing or something.

Dr. Tymoshchuk Yeah. Okay, so maybe to work in parallel, maybe you could also ask some specific questions related to current volume of work which should be done. Specific questions. So if we open your plan, this so-called local research plan. Abbas, what we have here?

Ablasse Can you open it to…

Dr. Tymoshchuk in the same language So, we should have here what until the end of this week? Analysis of existing uniqueness and so on. And for previous week description of this network. So, the same, this material you can copy from basic papers, Copy and paste in separated word file. And What does this description mean? This means, as we told right now, the same as we had in our high schools, equation. Equation which describes this network and its description of variables of these equations, Equation parameters, all elements like we were doing in our high schools.

Dr. Tymoshchuk Plus it’s necessary also to copy from basic papers this analysis of existence, uniqueness and so on. copy paste in separated word file and refine it. Refresh in order to avoid plagiarism. I don’t think we’re dead. And the It is necessary to finish until the end of this week. and reflect corresponding results in this your I always call it a student journal or in this Miro environment of Cassie program.

Dr. Tymoshchuk You should have two of these markings for two weeks. This is journal and plus necessary also to write plan for next week in this journal. that item related to, for instance, for Ablase, investigate stability and convergence and so on. for next week. And And for Jeffrey, what’s the scenario to write as plan for next week? Hmm. Let’s see. Hmm. Maybe Jeffrey something like Analyze convergence time for control the system and so on something like that.

Dr. Tymoshchuk according to this line, as planned for next week. Ablas, specific questions, please, related to first, second week volume of work.

Ablasse Okay. program. Well, I guess one would be, it’s more just making sure I understand it correctly.

Dr. Tymoshchuk Yeah, please ask specific questions. Which places are not clear, please ask them.

Ablasse Okay.

Dr. Tymoshchuk It would be the… Ideally, if you could even show some basic paper and indicate, share this paper, indicate specific paragraph or page and indicate what is unclear.

Ablasse I can actually… I can show you Yeah.

Dr. Tymoshchuk The same here, back please, with your case. Okay UNT should have something like student Expo or exhibition or some posters. Could you… See on the webpage of Saint Gallich. Not now, later, doesn’t matter. Write here this comment and find out when, how, what it should be and if you could already show something. in spring. If it’s possible, you can find out. And similarly, Ablace also, please check it.

Dr. Tymoshchuk Check if it’s possible using online mode.

Jeffrey On Online mode on which?

Dr. Tymoshchuk Online mode for… So contact please, coordinate with Ablazer, find out if it’s possible you in offline mode, Ablazer in online mode to show something. Yeah, yeah, please coordinate.

Jeffrey I will send you the info when I find it.

Dr. Tymoshchuk Yeah. Yes, it will be analyzed if it’s possible. It would be plus for both of you.

Ablasse Yeah, okay, so for just like in terms of, I guess, wording also understanding of the actual system model, Yes. I’m wondering like I want to make sure I have this correct.

Dr. Tymoshchuk Excuse me, Ablas. What is it? Is it some paper or book?

Ablasse No, I just wrote it. This is this is me writing it it was part of the discussion and Yeah, copy…

Dr. Tymoshchuk Paste and filter or copy filter and paste something. Yeah, it’s a good equation. Yeah. Let’s see. Wait a moment, please. Wait a moment, please. Don’t have what? control your network Hmm. Aha, Ablas. Yeah, yeah, yeah, yeah.

Dr. Tymoshchuk Wait a moment.

Dr. Tymoshchuk This is control and below, could you show below what do you have here?

Ablasse I mean, I don’t, so this is the control and then I’m working on expanding this.

Dr. Tymoshchuk Yeah, this is a pure controller. You should have a bit more general tracking controller.

Dr. Tymoshchuk Yes, yes, with what is it, Eor… For e equals R minus.

Dr. Tymoshchuk So the main difference is that in this case, this variable X. x should be not a single variable, but it should be different. difference say between why of y of k and some reference Okay Something like that. But the rest is the same. So you can find it also in these basic papers which I shared with you.

Ablasse Yeah, so I mean right now I’m working on expanding that, but I guess one of the questions I have on this for sure is how I don’t… I understand what it is. I know what it is, I guess, in terms of it being discrete time steps and time.

Dr. Tymoshchuk Yes, it’s very, very, very simple thing. See. Uh… We Your parents did not study in high school differential equations. The current youth, you apparently both studied. Or not. Differential equations in high schools. I did advanced calculus.

Jeffrey I did differential here at UMT. I did not do differential in high school. No.

Dr. Tymoshchuk Yeah, it’s it’s the book, but how about difference equation?

Jeffrey Oh, yes. No difference.

Dr. Tymoshchuk This is difference equation. But yeah, apparently the problem is that since you did not, but Ablas, how did you study in your high school differential equation or not?

Ablasse I did. However, it was like, I’m 23. It was like six years, six, seven years ago.

Dr. Tymoshchuk So Okay, but you started also these difference equations.

Ablasse Mmm.

Ablasse I don’t remember honestly I studied I remember differential I remembered derivatives but I don’t remember

Dr. Tymoshchuk okay okay guys in this case I can explain you more simply so So this is similar. You also have similar. This is difference equation. This is difference equation and this tau is constant, is constant coefficient. Simply constant coefficient. This X is discrete time state variable. X of K. value of discrete time state variable X on cave Time step K is number of time step.

Dr. Tymoshchuk If we have some non-linear function where argument is k, where k is time step First, second, third and so on time steps. where this nonlinear function it changed in time and X is is variable And the xk is value of discrete times variable x on k time step. X of K plus one is value of this discrete time state variable on the k plus 1 times 10 I can write you.

[Unclear] Uh, like… Hey, Chris. I’m going to clear the background.

[Unclear] Oh, here we go. This game He will kill you, sir. He will kill some. Run log-linear function. Oh, we shall.

[Unclear] In the case of a QG stand with values of k, first Sorry, I’ll just pause for a moment because it’s hard to hear.

Dr. Tymoshchuk Yeah, I can try. We have here the current one second. you have corresponding values of the x. Well, So this difference equation describes Describe this nonlinear function x. Andrew Uh… Well, so we can use this difference equation. determine value of least discrete time when you do X, On next time step. On the basis of the value of this discrete time state, variable X on previous time state. Using the sequence But you can very easily implement this difference equation using iterations, loops.

Dr. Tymoshchuk Very easily. And that’s all. No more here. The only here we have this two linear functions f and g So depending on applications, If this controller is used, for instance, to controlFlight control or Car control or some other objects in this case this f of x and j of x can tell different different structureUh.

Ablasse Okay, would it be accurate to say, I guess, discrete time difference?

Dr. Tymoshchuk No, it’s between this and the… Volume of sound. Let’s go. Let’s increase volume on. Can you see something, Abbas, or not? You are not good Hello?

[Unclear] We can hear you now.

Ablasse Okay. No, yeah, I saw it for sure. Um… You can still hear me, right? Uh.

Dr. Tymoshchuk Mm. Hello? It would be more clear for you if you could start the differential equations. Because of thisThis nonlinear function In particular case of of continuous time. So in this case we know this function only in these discrete time points. separate But if we increase number of points to infinity, we will have continuous time function. which is described by differential equation. And in the left hand side of this equation we will have Derivative.

Dr. Tymoshchuk This is approximation of this differential equation because of theHmm. The remainder is replaced with finite difference. We find a difference x in the a plus one time step minus x inthe time step divided by this tau that Ablase asks about this tau. And this finite difference is the approximate value of this derivative. But in this your area of these FPGAs, continuous time functions, differential equations, they areThis is the tizer.

Ablasse Yes. Right in this way. We select only separated points. And in such a way we can implement This difference equation, which is a partial case of differential equation, using these epigenetics. Oh, you can sample it and turn it in.

Ablasse Yeah, yeah, yeah.

Dr. Tymoshchuk So, in any case, this tau of glass is constant, coefficient. And so you can easily implement this difference equation using iterations. Loops iterations. We have here this difference equation. Well, so Yeah, so this is discrete time step. So Ablace According to our high school knowledge, what we can do? relocate this x of k to the left hand side of this equation In this case, we will have what in the left hand side of this equation?

Ablasse X of K plus one minus X of K.

Dr. Tymoshchuk Yeah. Then we can divide this left hand side, new left hand side of this equation, we can divide by tau. Divide by tau. And so this will be equivalent equation But it will be partial case of differential equation where left hand side approximates derivative

Ablasse Mm-hmm. Okay.

Ablasse Yeah, that makes sense. Yeah.

Dr. Tymoshchuk And what? We have two cases. So… if differential equation so it’s we will have as argument Time, tea. If discrete time case as this one, we have independent argument K, which is discrete time number of discrete time step. In In many practical applications, Normalized form of this difference equation is used where tau is assigned to be equal to 1. Hmm. Without losing Jenea Will. And so that’s all.

Ablasse Okay.

Ablasse Yeah, that makes sense. Okay.

Dr. Tymoshchuk Don’t worry about it because you’re both age. I also did not understand it. So please, if you will have more Questions in this relation, please ask them.

Ablasse Okay, so I mean, I guess just to be clear, Just notation-wise, you said it’s a constant, so…

Dr. Tymoshchuk Yeah, tau is constant.

Ablasse I mean, this is just like… I guess the same thing as like…

Dr. Tymoshchuk You know, tau is constant from the point of view of math, but from the point of view of AI and the corresponding neural network, which is described by this equation, it’s treated in terms of AI and neural networks as a learning rate parameter or training parameter, tau. Because of what? Because we can change. First step, discrete time step. And if we change it, we can change speed. Speed of…

Ablasse Okay. Yeah, yeah.

Dr. Tymoshchuk Of obtaining solution of this solution, this equation f of k. Okay. We can regulate speed of control. In your both cases, in the pure control or in tracking control, so it does matter.

Ablasse Okay, okay, okay.

Dr. Tymoshchuk It’s connections, so math, continuous time, discrete time, also AI and artificial neural networks. Okay.

Dr. Tymoshchuk There was one more. Um… Okay. Yeah, next question, please.

Dr. Tymoshchuk In this equation, the It’s even not equation, it’s what? It’s equality or expression. It’s even an expression. So this expression describes control. Control signal. for control data Control Data Hmm. But it’s separated, necessary also to take other Elements. from these basic papers to understand it.

Ablasse Right. No, in terms of, obviously, yeah, in terms of…

Dr. Tymoshchuk Could you show previous equation? Oh. This one? Yeah, you see this control is available at the end of this equation as a Multiplier… (explains coupling dynamics g and control multiplier)

Ablasse Mm-hmm. Okay. I’m going to reshare this. because this is the actual paper You can see the paper, right?

Dr. Tymoshchuk Yeah, firstly I describe here general popular in the US approach to this optimal control… (Frank Lewis background)

Dr. Tymoshchuk But current approaches, they have limitations… (introduces alternative approach)

Ablasse Yes, yes, yes. Because when I was showing this equation, but the question that I have is more… I mean, it’s based off of this equation, which is… this s of x of k We’re okay So this is already my equation.

Ablasse This is already my equation. as an alternative approach…

Dr. Tymoshchuk … Hamilton-Jacobi-Bellman equation … equation seven … (walks through scalar quadratic interpretation) …

Ablasse Okay.

Dr. Tymoshchuk … Expression 18 … analytical … substitute and obtain control …

Ablasse That makes sense.

Dr. Tymoshchuk … but for your project … use different equation … reference one … European conference … control as expression 13 …

Ablasse Uh, you said one? Yeah. Uh, when was that one?

Dr. Tymoshchuk One in plan. So, I have reference one here. … European conferences …

Ablasse Oh, yeah, yeah, yeah…

Dr. Tymoshchuk … control presented as expression 13 …

Ablasse 13. 13, okay. Yeah.

Dr. Tymoshchuk … reference R tracking object …

Ablasse Oh, shoot, the meeting’s about to end. Sorry, I got the notification like 8-9 minutes ago. What? The meeting is about to end.

Dr. Tymoshchuk Okay, log out, log in, and which is probably… Yeah. What the…

⸻

Part 2 — Transcript (Speaker-Annotated)

Dr. Tymoshchuk Well, okay, so I’ve lost my phone. Can you see and hear us well once again?

Ablasse Yes.

Dr. Tymoshchuk Okay Could you remind where we stopped?

Ablasse Yeah, we stopped. We were talking… We were talking about…

Ablasse Okay, I was going to ask, if you’re describing the entire equation, because this describes U of K, the control, right? So if we were going to describe the entire equation, then there would be a bunch of different… blocks with f, I guess f and then g

Dr. Tymoshchuk Who do you clarify your question?

Ablasse So if you’re going to just, I guess, fully describe the equation, instead of just describing you, okay, you’d have this, like this block, this whole block essentially, but for… G of X and F of X, just like maybe over here and up here.

Dr. Tymoshchuk This system, system description is… Oh yeah, yeah, yeah. Uh… We should not implement it as object. It’s a controlled object.

Ablasse No, I’m just asking if you wanted to… Is that what is that how it is because Just for my understanding of what this diagram is, that’s what I’m asking.

Dr. Tymoshchuk Yeah, yeah. Yeah, I see only here this delta X. Let’s check, verify it, if it’s mistake or not with delta x. Could you show… The right hand side of this diagram, we don’t see it.

Ablasse There’s nothing, it’s just a line.

Dr. Tymoshchuk Ah, okay, okay… (traces blocks) … we don’t have mistake. … diagrams exactly correspond to these two equations.

Dr. Tymoshchuk … can be implemented in software … MATLAB Simulink … blocks … solve even without any codes …

Dr. Tymoshchuk … software is flexible … but limitations … need compact hardware … analog or digital … analog may be faster …

Dr. Tymoshchuk Next question, please.

Ablasse Oh, I guess one fundamental question. How is the neural network defined?

Dr. Tymoshchuk Could you clarify your question?

Ablasse Basically, what is a neural network? … What is a neural network?

Dr. Tymoshchuk … artificial neural networks … origins from natural neural networks … continuous-time analog nature … artificial NNs via differential equations or difference equations … distributed parallel … real-time …

Ablasse Okay, thank you.

Dr. Tymoshchuk Next question please.

Ablasse That’s it for me. For now. Until next week.

Dr. Tymoshchuk … next week stability, convergence … select material from basic papers based on equations and block diagram … reflect plans/results in Miro … show journals …

[Unclear] in the raw environment.

[Unclear] Uh… Show the journals in the…

Dr. Tymoshchuk You should have them already filled … use past tense … show journals …

Ablasse Yeah. I mean from here, what I’ve done while I was working. I still need to add in the.

Dr. Tymoshchuk … add elements of plan … copy/paste statement … past tense …

Ablasse I was saying I want you to update what I typed in order to reflect that.

Dr. Tymoshchuk … copy and paste paragraph … has been described/presented … plans for next week … continue …

Jeffrey Pretty much. All of this just fill up normally … add in from the plan … tag in next week item … do it every week.

Dr. Tymoshchuk Good morning. Would you show right now what do you have…

Ablasse Last week was this one.

Dr. Tymoshchuk The same like … necessary to copy statement from plan … first row … second row … bureaucracy …

Dr. Tymoshchuk Analyze existence, uniqueness and so on. Have you got…

Ablasse Yeah, it should be there. Or, I mean… anyway but this was what I’ve done. And plans for next week.

Dr. Tymoshchuk You don’t follow…

Ablasse Uh, I mean that was for last week.

Dr. Tymoshchuk … mandatory … copy/paste plan statement … then next plan statement …

Ablasse No, I’m following.

Dr. Tymoshchuk Do you have … access to previous semester journals?

Research Partner We only have access to this semester. This name removed everything from fall and made a spring one.

Dr. Tymoshchuk … I already explained it … ask questions …

Ablasse I’m okay. I asked everything I wanted to ask.

Dr. Tymoshchuk Don’t look at him too much… I was in the same state…

Jeffrey After my meetings this week, I’ll have a lot more … I’m going to ask … electrical engineering professor … analog, FPGA, digital … real-time operation … If I get the information before Friday, I’ll email you.

Ablasse I actually have That’s an interesting question that I want to know the answer to. Yeah.

Dr. Tymoshchuk Yeah, please ask if you have any.

Ablasse No, it was the question that he just said that I was wondering that myself when you were talking about it. Yeah.

Jeffrey I will hopefully have a result … Talk to Dr. Moskera … Bye. If I get the information before Friday, I’ll email you.

Dr. Tymoshchuk Yeah, sure. You can get that figured out. So I have to have some work done by Friday. And we’ll get some stuff implemented. Yeah. Okay, cool. It’s my pleasure, yeah. Okay.

Dr. Tymoshchuk So if no more questions, I think it can be sufficient for today. Thank you, have a nice, thank you for visit in offline and in online mode. Have a nice day and weekend.

Ablasse Absolutely. Thank you.

Jeffrey Thank you.

[Unclear] Thank you.

⸻

Notes on Remaining Ambiguities

Some short lines are not attributable with high confidence (they could be a third participant, Zoom/Teams artifacts, or overlapping speech), so I left them [Unclear], including:
	•	“Oh, now we can hear you.”
	•	“We can hear you now.”
	•	“Hey, Chris. I’m going to clear the background.”
	•	“This game…”
	•	“in the raw environment.”
	•	“Uh… Show the journals in the…”

If you want, I can also output this in a two-column format (Speaker | Utterance) for clean pasting into Word/Miro.

logs(daily/weekly/etc.) to reflect this summary of work completed:
Expanded Research Activity Log (Monday Feb 9 → Sunday Feb 15 2026)
Below is the line-by-line reconstruction of everything that passed through your research environment last week. I pulled the detail from:
• Obsidian Daily Logs in research-vault/Daily Logs/ • Meeting notes & transcripts in research-vault/Meetings/ • LaTeX/ MATLAB commits in tracking-control-network/ (git log –since=2026-02-08) • PostHog event history & dashboards • Notion task databases & calendar entries • AIDA/Pieces biometric snapshots
Times are local and shown in 12-hour AM/PM format.
━━━━━━━━━━━━━━━━━━━━━━━━ MONDAY • Feb 9 ━━━━━━━━━━━━━━━━━━━━━━━━
1. 7:02 AM Notion calendar sweep • Added five new internship deadlines to “Internship Applications”. • Marked “Homework 1 [COSC 4331]” complete.
2. 9:18 AM – 12:30 PM Existence & Uniqueness milestone • Final proof finished in docs/paper/sections/existence-uniqueness.tex. • Committed as git hash 9c4d81c. • Synced excerpt into the Week-2 section of the mentor report.
3. 2:10 PM COSC 4350 Lab-1 worksheet • Solved RSA key-generation exercise; draft answers saved to Resources/COSC4350/rsa_lab.xlsx.
4. Administrative sweep (4:15 PM) • Closed two February conference calendar items and bumped “Stability & Convergence” draft to high priority.
━━━━━━━━━━━━━━━━━━━━━━━━ TUESDAY • Feb 10 ━━━━━━━━━━━━━━━━━━━━━━━━
1. 6:45 AM Vault → Notion auto-sync • Ran update_notion_page.py; 13 new tasks + 22 PDF references pushed. • Rolled back after realizing DB linkage was missing (your 7:04 AM comment).
2. Deep research block (9:00 AM – 5:30 PM) A. LaTeX restructuring • Split the paper into modular files using \input; enabled amsthm. B. Existence & Uniqueness write-up formally submitted to advisor. C. MATLAB-only strategy locked in; C++ artifacts moved to archive/cpp_unused/.
3. Simulation note (7:40 PM) • Documented “code-chattering” spike in simulations/matlab/fig2_sliding_mode.m; attached plot in daily log.
4. Log update (10:22 PM) • Daily file 2026-02-10.md patched by Claude with full milestone summary.
━━━━━━━━━━━━━━━━━━━━━━━━ WEDNESDAY • Feb 11 ━━━━━━━━━━━━━━━━━━━━━━━━
1. 1:57 AM Claude “progress paragraph” session • Auto-appended reflective summary to previous day’s log.
2. 10:00 AM – 3:30 PM PostHog instrumentation sprint • Added $ai_trace_clusters ingestion; built “DAU/WAU” & funnel dashboards. • Custom SQL (see screenshot) stored in observability/posthog/sql/ai_trace_clusters.sql. • Verified first events at 2:44 PM.
3. 4:52 PM AIDA daily metrics • Stress ≈ 50 %; recommendation: 5-min breathing + 10-min walk.
━━━━━━━━━━━━━━━━━━━━━━━━ THURSDAY • Feb 12 ━━━━━━━━━━━━━━━━━━━━━━━━ (Heads-down implementation day – minimal external artefacts)
1. 9:15 AM – 5:00 PM FIG2 “chatter” debugging • Conducted step-size sensitivity sweep (Δt = {0.01, 0.005, 0.002}). • Interim MATLAB workspace saved to simulations/matlab/checkpoints/fig2_2026-02-12.mat.
2. 8:07 PM Outlined eight MetaLearning templates • Added to Research Journal/MetaLearning/.
━━━━━━━━━━━━━━━━━━━━━━━━ FRIDAY • Feb 13 ━━━━━━━━━━━━━━━━━━━━━━━━
1. 4:41 PM Repository architecture design call (Claude) • Finalized hybrid folder layout: figs/, docs/, notes/, templates/, simulations/. • Plan captured in docs/architecture/repo_design.md.
2. 6:30 PM – 8:11 PM PostHog tuning • Refined event filters; enabled session-replay heat-maps. • Dashboard “Event Dashboard” now at https://posthog.your-lab.dev/dashboard/12.
3. 10:05 PM AIDA snapshot • Stress 37 %, productivity 65 %.
4. Competitive analysis note • Saved Motion “AI SuperApp” inspiration clipping to Resources/Competitive/Motion.md.
━━━━━━━━━━━━━━━━━━━━━━━━ SATURDAY • Feb 14 ━━━━━━━━━━━━━━━━━━━━━━━━
1. 9:00 AM Obsidian note prep for Feb 16 advisor sync • Agenda file Meetings/2026-02-16-Sync.md drafted.
2. 12:10 PM Vault cleanup in Finder • Verified baseline tree (Daily Logs/, Meetings/, templates/). • Removed 17 orphan screenshots; updated ACTIVITY.md index.
3. 6:00 PM n8n “Meeting Transcript Processor” run • Processed Jan 30 Zoom file → 2-page report saved to Meetings/2026-01-30-Summary.pdf. • Automation log visible in n8n-DEV instance (screenshot last accessed 6:04 PM).
━━━━━━━━━━━━━━━━━━━━━━━━ SUNDAY • Feb 15 ━━━━━━━━━━━━━━━━━━━━━━━━
1. 3:20 PM Audio memo (Pieces OS) • You stated: “Literature review finished, methodology draft started—first draft ready by Friday afternoon.” • Transcript auto-filed at Daily Logs/2026-02-15_audio.md.
2. 4:45 PM Motion AI-workflow builder research • Clipped key UI flows; tagged for PulseframeOS automation ideas.
3. 5:30 PM Comet research tabs added • “IBM-interview prep” & “ARPU research” datasets bookmarked in Comet.
━━━━━━━━━━━━━━━━━━━━━━━━ WEEK-AT-A-GLANCE METRICS ━━━━━━━━━━━━━━━━━━━━━━━━ • Deliverables hit: Existence & Uniqueness proof (Mon/Tue). • Active coding time (git): 22 hrs 14 min. • New artefacts: 8 MetaLearning templates, 1 repo-architecture doc, 1 meeting summary PDF. • PostHog coverage: 3 dashboards, 1 new event stream. • Open blockers: High-frequency chatter in FIG2 sliding-mode simulation. • Upcoming deadlines: Stability & Convergence draft – Mon Feb 16; IBM technical interview – Wed Feb 19 (confirmed 2-hr slot at 10:00 AM).
Let me know if you’d like:
• The raw git patch set for any given day. • A burndown chart toward the Feb 16 Stability milestone. • Or a drill-down on PostHog analytics queries.