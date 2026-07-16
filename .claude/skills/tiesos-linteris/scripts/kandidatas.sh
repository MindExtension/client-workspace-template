#!/usr/bin/env bash
# Tiesos linteris: paverčia jau pritaikytus darbo medžio taisymus KANDIDATU (šaka + juodraštinis PR).
# NIEKADA nesulieja, NIEKADA nekomitina i main. Kandidatas eina i tiesos-linteris/YYYY-MM-DD saka.
#
# Naudojimas:
#   bash kandidatas.sh "<PR pavadinimas>" [pr-body-failas.md]
#
# Pries leidziant: HIGH-confidence taisymai jau turi buti pritaikyti darbo medyje (Edit).
set -euo pipefail

TITLE="${1:-}"
BODY_FILE="${2:-}"
if [ -z "$TITLE" ]; then
  echo "KLAIDA: reikia PR pavadinimo. Naudojimas: bash kandidatas.sh \"<pavadinimas>\" [body.md]" >&2
  exit 1
fi

# Repo saknis
ROOT="$(git rev-parse --show-toplevel 2>/dev/null)" || { echo "KLAIDA: ne git repas" >&2; exit 1; }
cd "$ROOT"

DATE="$(date +%Y-%m-%d)"
BRANCH="tiesos-linteris/${DATE}"
CUR="$(git rev-parse --abbrev-ref HEAD)"

# Saugiklis: turi buti pakeitimu, kitaip nera ka teikti
if git diff --quiet && git diff --cached --quiet; then
  echo "Nera pakeitimu darbo medyje. Pirma pritaikyk HIGH-confidence taisymus, tada leisk skripta." >&2
  exit 0
fi

echo "→ Fetch origin (naujausias main)…"
git fetch origin main --quiet || { echo "ISPEJIMAS: fetch nepavyko, tesiu su lokaliu main" >&2; }

BASE_REF="origin/main"
git rev-parse --verify "$BASE_REF" >/dev/null 2>&1 || BASE_REF="main"

echo "→ Perkeliu taisymus i kandidato saka ${BRANCH} (nuo ${BASE_REF})…"
git stash push -u -m "tiesos-linteris-${DATE}" >/dev/null
# Jei saka jau yra, prisijungiam prie jos, kitaip kuriam nuo BASE_REF
if git rev-parse --verify "$BRANCH" >/dev/null 2>&1; then
  git checkout "$BRANCH" --quiet
else
  git checkout -b "$BRANCH" "$BASE_REF" --quiet
fi
git stash pop >/dev/null || { echo "KLAIDA: nepavyko atkurti taisymu (stash pop). Patikrink rankomis." >&2; exit 1; }

echo "→ Commit…"
git add -A
git commit -m "[LINT]: ${TITLE} (tiesos-linteris ${DATE})" --quiet

echo "→ Push…"
git push -u origin "$BRANCH" --quiet

# Juodrastinis PR per gh (jei yra). NIEKADA nesuliejam.
if command -v gh >/dev/null 2>&1; then
  echo "→ Atidarau JUODRASTINI PR i main…"
  if [ -n "$BODY_FILE" ] && [ -f "$BODY_FILE" ]; then
    gh pr create --draft --base main --head "$BRANCH" --title "[LINT] ${TITLE} (${DATE})" --body-file "$BODY_FILE" || \
      echo "ISPEJIMAS: gh pr create nepavyko. Saka jau supushinta, PR atidaryk rankomis." >&2
  else
    gh pr create --draft --base main --head "$BRANCH" --title "[LINT] ${TITLE} (${DATE})" \
      --body "Tiesos linterio kandidatas ${DATE}. Perziurek kiekviena taisyma pries suliejant. NESULIETI automatiskai." || \
      echo "ISPEJIMAS: gh pr create nepavyko. Saka supushinta, PR atidaryk rankomis." >&2
  fi
else
  echo "gh CLI nerasta. Saka supushinta: ${BRANCH}. Atidaryk juodrastini PR i main rankomis (arba grizk i pradine saka: git checkout ${CUR})."
fi

echo "✓ Kandidatas paruostas sakoje ${BRANCH}. main NEPALIESTAS, NIEKAS NESULIETA."
echo "  Grizti i pradine saka: git checkout ${CUR}"
