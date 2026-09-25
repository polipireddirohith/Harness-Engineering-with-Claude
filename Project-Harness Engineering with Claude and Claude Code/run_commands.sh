#!/usr/bin/env bash
set -euo pipefail

ROOT="/workspace"

CAPSTONE="$ROOT/Project-Harness Engineering with Claude and Claude Code"
SYSTEM1="$ROOT/Build a Claims Intake Agent with a stop_reason-Driven Loop/exercises/03-dynamic-decomposition/solution"
SYSTEM2="$ROOT/Engineer a Long-Conversation Context Strategy for a Retail Support Copilot/04-assemble-and-locate/solution"
SYSTEM3="$ROOT/Configure Claude Code for a Multi-Surface Monorepo Team/04-plan-mode-and-explore-decision-doc/solution"
SYSTEM4="$ROOT/Build a Multi-Shift Quality Monitoring System with Claude Orchestration/04-fork-scratchpad/solution"

EVIDENCE="$CAPSTONE/evidence"

mkdir -p "$EVIDENCE/system-1"
mkdir -p "$EVIDENCE/system-2"
mkdir -p "$EVIDENCE/system-3"
mkdir -p "$EVIDENCE/system-4"

echo "=== Harness Engineering Capstone ==="
echo

echo "=== System 1: Claims Intake Agent ==="
cd "$SYSTEM1"
./run_commands.sh
cp -r evidence/. "$EVIDENCE/system-1/" 2>/dev/null || true

echo
echo "=== System 2: Long-Conversation Context Strategy ==="
cd "$SYSTEM2"
if [ -f "requirements.txt" ]; then
    python3 -m pip install -q -r requirements.txt
fi
pytest -q
cp -r . "$EVIDENCE/system-2/" 2>/dev/null || true

echo
echo "=== System 3: Multi-Surface Monorepo Team ==="
cd "$SYSTEM3"
if [ -f "requirements.txt" ]; then
    python3 -m pip install -q -r requirements.txt
fi
pytest -q
cp -r . "$EVIDENCE/system-3/" 2>/dev/null || true

echo
echo "=== System 4: Multi-Shift Quality Monitoring ==="
cd "$SYSTEM4"
if [ -f "requirements.txt" ]; then
    python3 -m pip install -q -r requirements.txt
fi
pytest -q
cp -r . "$EVIDENCE/system-4/" 2>/dev/null || true

echo
echo "=== Capstone Completed Successfully ==="
echo "Evidence: $EVIDENCE"
