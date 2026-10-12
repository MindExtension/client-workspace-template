#!/usr/bin/env bash
# Šakų būsena: kas kurioje šakoje, kas nauja GitHub'e, kas laukia sujungimo.
# Paleidžiamas sesijos pradžioje (.claude/settings.json kabliukas) ir prieš kiekvieną git veiksmą.
# Tik skaito: git fetch atnaujina vien nuotolinių šakų kopijas, darbo failų neliečia.
# Veikia macOS, Linux ir Windows Git Bash. Visada baigiasi kodu 0, kad neužblokuotų sesijos.

ZEMELAPIS="metodas/sakos-ir-sujungimas.md"

cd "${CLAUDE_PROJECT_DIR:-.}" 2>/dev/null || exit 0
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || exit 0

export GIT_TERMINAL_PROMPT=0 GCM_INTERACTIVE=never

# Komanda su laiko riba, be `timeout` (jo nėra macOS ir Git Bash).
ribotai() {
  local sek=$1; shift
  "$@" &
  local pid=$!
  ( sleep "$sek"; kill "$pid" ) >/dev/null 2>&1 &
  local sargas=$!
  wait "$pid" 2>/dev/null
  local kodas=$?
  kill "$sargas" >/dev/null 2>&1
  wait "$sargas" 2>/dev/null
  return $kodas
}

isvalyk() { printf '%s' "$1" | sed -e 's/`//g' -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'; }

mazosiomis() { printf '%s' "$1" | tr '[:upper:]' '[:lower:]'; }

# Kas dirba šakoje pagal žemėlapį: tikslus šakos vardas, o temos šakai `vardas-tema-data` pirma dalis.
zmogus_pagal_saka() {
  [ -f "$ZEMELAPIS" ] || return 0
  local tiksli pirma
  tiksli=$(mazosiomis "$1")
  pirma=${tiksli%%-*}
  grep -E '^\|' "$ZEMELAPIS" | while IFS='|' read -r _ zmogus github saka _; do
    s=$(mazosiomis "$(isvalyk "$saka")")
    [ -z "$s" ] && continue
    if [ "$s" = "$tiksli" ]; then printf '0|%s (%s)\n' "$(isvalyk "$zmogus")" "$(isvalyk "$github")"
    elif [ "$s" = "$pirma" ]; then printf '1|%s (%s)\n' "$(isvalyk "$zmogus")" "$(isvalyk "$github")"; fi
  done | sort | head -1 | cut -d'|' -f2-
}

echo "ŠAKŲ BŪSENA $(date '+%Y-%m-%d %H:%M') (git-paprastai)"

if git remote get-url origin >/dev/null 2>&1; then
  if ribotai 10 git fetch --quiet --prune origin 2>/dev/null; then
    echo "GitHub patikrintas ką tik."
  else
    kada=$(date -r .git/FETCH_HEAD '+%Y-%m-%d %H:%M' 2>/dev/null || echo "nežinoma")
    echo "GitHub nepasiekiamas per 10 s. Rodau paskutinę žinomą būseną (atnaujinta $kada)."
  fi
else
  echo "Ši bazė neturi GitHub kopijos (origin). Rodau tik vietinę būseną."
fi

saka=$(git branch --show-current 2>/dev/null)
[ -z "$saka" ] && saka="(atjungta būsena, ne šaka)"
kas=$(zmogus_pagal_saka "$saka")
echo
echo "Dabartinė šaka: $saka${kas:+ = $kas}"
if [ "$saka" = "main" ] || [ "$saka" = "master" ]; then
  echo "  DĖMESIO: tai bendra priimta versija. Darbas vyksta asmeninėje šakoje, ne čia."
elif [ -f "$ZEMELAPIS" ] && [ -z "$kas" ]; then
  echo "  Šios šakos nėra žemėlapyje ($ZEMELAPIS). Pasiūlyk ją įrašyti."
fi

pakeisti=$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')
[ "$pakeisti" != "0" ] && echo "  Neišsaugoti failai: $pakeisti ($(git status --porcelain | head -5 | awk '{print $2}' | tr '\n' ' '))"

if git rev-parse --verify --quiet origin/main >/dev/null; then
  truksta=$(git rev-list --count HEAD..origin/main 2>/dev/null)
  [ "${truksta:-0}" -gt 0 ] && echo "  main turi naujų pakeitimų, kurių šioje šakoje dar nėra: $truksta. Siūlyk „pasiimk naujausią“."
fi
if git rev-parse --abbrev-ref '@{u}' >/dev/null 2>&1; then
  neikelta=$(git rev-list --count '@{u}..HEAD' 2>/dev/null)
  [ "${neikelta:-0}" -gt 0 ] && echo "  Neįkeltų į GitHub išsaugojimų: $neikelta. Jie yra tik šiame kompiuteryje."
elif [ "$saka" != "main" ] && git remote get-url origin >/dev/null 2>&1; then
  echo "  Ši šaka dar neįkelta į GitHub."
fi

echo
echo "Šakos GitHub'e (naujausios viršuje, „nesujungta“ = pakeitimai, kurių main dar neturi):"
git for-each-ref --sort=-committerdate --count=10 refs/remotes/origin \
  --format='%(refname:short)|%(committerdate:short)|%(authorname)|%(subject)' 2>/dev/null |
while IFS='|' read -r ref data autorius tema; do
  case "$ref" in origin/HEAD|origin) continue ;; esac
  vardas=${ref#origin/}
  zyme=""
  if [ "$vardas" != "main" ] && git rev-parse --verify --quiet origin/main >/dev/null; then
    n=$(git rev-list --count "origin/main..$ref" 2>/dev/null)
    [ "${n:-0}" -gt 0 ] && zyme=", nesujungta: $n"
  fi
  kieno=$(zmogus_pagal_saka "$vardas")
  printf '  - %s%s: %s, %s%s, „%s“\n' "$vardas" "${kieno:+ ($kieno)}" "$data" "$autorius" "$zyme" "$tema"
done

if command -v gh >/dev/null 2>&1; then
  pr=$(ribotai 8 gh pr list --state open --limit 10 2>/dev/null)
  if [ -n "$pr" ]; then
    echo
    echo "Atviri sujungimo prašymai (PR), laukia peržiūros:"
    printf '%s\n' "$pr" | awk -F'\t' '{printf "  - #%s %s -> main: %s\n", $1, $3, $2}'
  fi
fi

if [ -f "$ZEMELAPIS" ]; then
  tvarka=$(grep -m1 -E '^Sujungimo tvarka:' "$ZEMELAPIS" | sed 's/^Sujungimo tvarka:[[:space:]]*//')
  echo
  echo "Žemėlapis: $ZEMELAPIS${tvarka:+. Sujungimo tvarka: $tvarka}"
fi
exit 0
