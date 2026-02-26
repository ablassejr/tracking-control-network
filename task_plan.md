# Task Plan: Research-Assistant Agent

## Goal
Build a Claude Code agent (.claude/agents/research-assistant.md) that conducts comprehensive research across academic and technical domains using aggressive delegation (team-based subagent parallelism), with dual persistence (claude-mem + markdown files).

## Phases
- [x] Phase 1: Explore project context
- [x] Phase 2: Research tools and methods (58 MCP tools inventoried)
- [x] Phase 3: Clarify requirements (both academic + tech, aggressive delegation, both persistence, CC agent)
- [x] Phase 4: Propose approaches and get design approval (Approach B: Dynamic Delegation)
- [x] Phase 5: Build the agent (~/.claude/agents/research-assistant.md)
- [x] Phase 6: Test and verify (all checks passed)

## Key Questions
1. ~~Research type?~~ → Both academic and technical equally
2. ~~Context management?~~ → Aggressive delegation (spawn subagent teams)
3. ~~Persistence?~~ → Both claude-mem + markdown files
4. ~~Implementation?~~ → Claude Code built-in agent (.claude/agents/)

## Decisions Made
- Claude Code native Teams (System A) over swarm plugin (System B): Simpler, no file reservation overhead needed for read-only research
- Opus model for leader, haiku for search workers, sonnet for synthesis workers
- Dynamic delegation (Approach B): Always delegates ≥1 worker, scales workers based on query dimensions
- Always delegate: leader never does research itself, keeps context clean

## Errors Encountered
- (none yet)

## Status
**COMPLETE** — Agent built, verified, and ready for use
