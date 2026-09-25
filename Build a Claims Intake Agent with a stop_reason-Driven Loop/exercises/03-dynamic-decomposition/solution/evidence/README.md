# Harness Engineering Capstone Evidence

This directory contains execution evidence for System 1 — Claims Intake Agent.

## System 1: Claims Intake Loop

Evidence is derived from the genuine run:

`runs/20260925_005134`

### Included evidence

- `evidences/system_1_claims_loop/run_summary.md` — actual 8-fixture run summary
- `evidences/system_1_claims_loop/tests.txt` — actual pytest output
- `evidences/system_1_claims_loop/escalations.jsonl` — actual escalation record
- `evidences/system_1_claims_loop/claim_*.jsonl` — actual traces for all 8 claims

### Test result

29 tests passed.

### Fixture run result

8 claims processed:
- 7 routed
- 1 escalated

The evidence files were copied from the actual generated run artifacts; no synthetic trace or fabricated execution data was added.
