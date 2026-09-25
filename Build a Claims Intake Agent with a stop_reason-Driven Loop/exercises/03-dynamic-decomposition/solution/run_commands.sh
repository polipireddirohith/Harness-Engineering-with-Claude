#!/bin/bash
set -e

echo "=== Claims Intake Agent: Test Suite ==="
pytest tests/ -v

echo ""
echo "=== Claims Intake Agent: All Fixtures ==="
python -m claims_intake.run --all

echo ""
echo "=== Claims Intake Agent: Completed Successfully ==="
