#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$root"

failed=0

if [ ! -f .claude/CLAUDE.md ]; then
  echo "KLAIDA: trūksta .claude/CLAUDE.md" >&2
  failed=1
fi

if [ ! -d .claude/skills ] || ! find .claude/skills -type f -name SKILL.md | grep -q .; then
  echo "KLAIDA: trūksta Claude Code įgūdžių .claude/skills kataloge" >&2
  failed=1
fi

if [ -f AGENTS.md ] || [ -d .agents ] || [ -d .codex ]; then
  echo "KLAIDA: rastas neleistinas Codex konfigūracijos paviršius" >&2
  failed=1
fi

if find .claude/skills -type f -path '*/agents/openai.yaml' | grep -q .; then
  echo "KLAIDA: rasti Codex skirti agents/openai.yaml failai" >&2
  failed=1
fi

if [ "$failed" -ne 0 ]; then
  exit 1
fi

echo "PASS: kliento šablono Claude Code struktūra tvarkinga."
