# Research Notes: Research-Assistant Agent Design

## Available Tool Inventory (58 tools)

### Academic Research
- **paper-search-mcp** (13 tools): Search arXiv, PubMed, bioRxiv, medRxiv, Google Scholar + download + read full text
- **pdf-reader** (1 tool): Advanced PDF reading with table/image extraction
- PubMed is search-only (cannot download/read PDFs directly)

### Web Research
- **WebSearch** (built-in): General web search with domain filtering
- **WebFetch** (built-in): URL content extraction (fails on authenticated URLs)
- **Playwright** (21 tools): Full browser automation for dynamic/authenticated content

### Technical Documentation
- **Context7** (2 tools): Library/framework docs (resolve-library-id → query-docs)
- **claude-context**: Semantic codebase search

### Knowledge Storage
- **Notion** (12 tools): Structured database creation, page CRUD, semantic search
- **claude-mem** (5 tools): Persistent semantic memory with 3-layer retrieval
- **episodic-memory** (2 tools): Cross-session conversation recall
- **VectorCode**: Vector-based code search

### Team Coordination (Native)
- TeamCreate, TeamDelete, SendMessage, Task, TaskCreate, TaskUpdate, TaskList

## Agent Architecture Patterns

### Pattern A: Parallel Specialists
Leader creates team → creates tasks → spawns specialist workers → workers report back → leader synthesizes → cleanup.

### Pattern B: Pipeline with Dependencies
Tasks have dependency chains (search → analyze → synthesize). Workers auto-claim unblocked tasks.

### Pattern C: Self-Organizing Swarm
Pool of independent tasks, N workers race to claim them.

## Agent Frontmatter Spec
Required: name, description
Optional: tools, disallowedTools, model, color, maxTurns, memory, skills, mcpServers, hooks, permissionMode

## Key Constraints
- Subagents CANNOT spawn other subagents (1 level deep)
- The leader agent must include Task, TeamCreate, SendMessage in tools
- Workers use SendMessage to report results back to leader
- Model choices: opus (deep reasoning), sonnet (balanced), haiku (fast search)
