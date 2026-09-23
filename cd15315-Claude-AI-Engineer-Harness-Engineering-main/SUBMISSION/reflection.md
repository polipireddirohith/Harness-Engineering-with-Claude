# Harness Engineering Capstone Reflection

## Evidence note
This submission uses the repository's completed `solution/` implementations and records the verification that could be performed locally without embedding credentials. Live Anthropic calls were intentionally not performed because API secrets must remain in environment variables and must not be committed or placed in the ZIP. Therefore, no live token counts, run IDs, or model-generated claim outcomes are fabricated below.

### 1. System 1 loop control
The claims intake loop is controlled by the model response `stop_reason`: tool use continues the loop, `end_turn` terminates it, and unexpected stop reasons are treated as errors. Local unit verification: **29 passed**.

### 2. System 1 anti-pattern
The solution's anti-pattern tests enforce stop-reason-driven control rather than assistant-text matching or a fixed integer iteration cap. Local unit verification: **29 passed**.

### 3. System 1 tool design
The solution separates deterministic domain operations into tools, keeping policy/data lookups and pricing outside the orchestration loop. The implementation is in the final `03-dynamic-decomposition/solution` directory.

### 4. System 1 numbers
No live API token counts or run IDs are claimed here because the live `--all` run was not executed. The repository's tests were executed locally with **29 passed**.

### 5. System 2 reduction
The final context strategy assembles durable case facts, compressed resolved issues, and the active conversation as separate sections. Unit verification: **28 passed, 2 skipped**; the two skipped checks require generated run artifacts.

### 6. System 2 summarize vs preserve
Resolved issues are summarized, while the active issue is preserved verbatim. This behavior is directly exercised by the assembly tests in the final solution.

### 7. System 2 facts block
The case-facts block is kept as structured durable state and is assembled ahead of resolved and active conversation sections.

### 8. System 3 path-scoped rules
The final Claude Code configuration contains project-level `CLAUDE.md`, path-scoped rules, commands, standards, and skills. The validator returned **OK** and the test suite returned **35 passed**.

### 9. System 3 forked skill
The deploy-check skill is configured with `context: fork`, separating its read-only verification context from the main working context.

### 10. System 3 scope
The configuration uses path-scoped rules so guidance is applied according to the surface being changed rather than as one global instruction set.

### 11. System 4 push work down
The orchestration pipeline prefilters defects using warm state/SQL before the model call, reducing unnecessary model context and work.

### 12. System 4 crash recovery
The recovery implementation distinguishes empty/complete state, recent resumable state, and stale state using a 30-minute resume threshold. Local unit verification: **33 passed**.

### 13. System 4 small state
The locally generated `hot_state.json` was **643 bytes**, demonstrating a small bounded hot-state representation. The offline recorded-response shift run completed successfully.

### 14. Three layers
Across the four systems, reliability is separated into deterministic orchestration/state, constrained model interaction, and evidence/verification. The implementations make these boundaries explicit.

### 15. Deterministic vs prompt behavior
Loop termination, state recovery, filtering, configuration validation, and file/state handling are deterministic. Model-facing tasks are used where interpretation or synthesis is required.

### 16. Context has two faces
The retail system treats context as both durable structured facts and conversational text. The active conversation is preserved while resolved material is compressed.

### 17. Hidden reliability
The strongest reliability mechanisms are not the model prompts themselves: they include stop-reason control, anti-pattern tests, bounded state, recovery manifests, path-scoped configuration, and validators.

### 18. Blast radius
The designs reduce blast radius by isolating tools, path-scoped rules, bounded state, and forked investigation contexts. A failure in one layer is less likely to corrupt unrelated state or instructions.

### 19. What broke
The local environment did not contain the Anthropic Python SDK, and network access was unavailable for installing it. Consequently, System 2 live build/evaluation artifacts and System 1/System 2 live API measurements could not be regenerated. The package does not conceal this limitation.

### 20. What I would change
For a fully live submission, I would run the prescribed `--all`/`--build` workflows with the learner's API credential supplied only through environment variables, retain the generated run artifacts, and replace this evidence note with the actual run IDs, token counts, evaluation results, and claim outcomes from those runs.
