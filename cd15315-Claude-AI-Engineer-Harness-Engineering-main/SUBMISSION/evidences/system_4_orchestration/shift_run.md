Offline recorded-response verification:

Command:
python -c "import json; from pathlib import Path; from shift_monitor.warm import WarmStore; w=WarmStore(Path('data/warm.sqlite')); w.initialize(); w.insert_many(json.load(open('fixtures/defects.json')))"
python -m shift_monitor run-shift --shift C --warm-db data/warm.sqlite --recorded-response fixtures/recorded_responses/shift_C_2026-04-30.json

Observed summary:
shift C: 0 new defects
Recorded response summary: 3 high + 2 medium defects on capacitor-bank-C-7, all from lot 2026-0430-B; 1 low VP-4 vent squeal (repeat); lot quarantine recommended.

The current local run produced a fresh shift state and scratchpad. No live Claude API call was used.
