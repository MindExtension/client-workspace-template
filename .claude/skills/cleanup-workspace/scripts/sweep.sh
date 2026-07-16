#!/usr/bin/env bash
#
# sweep.sh - cleanup-workspace paieškos pagalbininkas (TIK SKAITO, nieko nekeičia).
#
# Naudojimas:
#   scripts/sweep.sh <terminas>   # visa banga vienam objektui + bazės sveikata
#   scripts/sweep.sh              # tik bazės sveikata (kabančios nuorodos, brūkšniai, šaka)
#
# <terminas> gali būti slug (uzsakymu-vadybininkas) arba ERE regex (u[zž]sakym[uų] vadyb).
# Perkeliama: naudoja tik POSIX grep -E ir literalius baitus, veikia macOS (BSD) ir Linux.
# Skriptas nieko netrina ir nieko nerašo. Sprendimą dėl veiksmų priima žmogus.

set -u
cd "$(git rev-parse --show-toplevel 2>/dev/null || echo .)" || exit 1

TERM_ARG="${1:-}"
MD=(--include='*.md')
# .claude iskiriam: skillu dokai turi pavyzdiniu [[placeholder]] nuorodu, ne bazes turinys.
EXCL=(--exclude-dir='.git' --exclude-dir='.obsidian' --exclude-dir='node_modules' --exclude-dir='.claude')

# Em (U+2014) ir en (U+2013) brūkšniai kaip literalūs UTF-8 baitai (be -P priklausomybės).
EM=$(printf '\xe2\x80\x94')
EN=$(printf '\xe2\x80\x93')

hr() { printf '\n===== %s =====\n' "$1"; }

if [ -n "$TERM_ARG" ]; then
  hr "1. Wikilink nuorodos i '$TERM_ARG' (su alias ir be)"
  grep -rniE "\[\[${TERM_ARG}([|#][^]]*)?\]\]" "${MD[@]}" "${EXCL[@]}" . || echo "  (nerasta)"

  hr "2. Laisvo teksto paminejimai '$TERM_ARG' (be wikilink)"
  grep -rniE "$TERM_ARG" "${MD[@]}" "${EXCL[@]}" . | grep -vF '[[' || echo "  (nerasta)"

  hr "3. Tiesos saltinis data/organizacija.yaml"
  if [ -f data/organizacija.yaml ]; then
    grep -niE "$TERM_ARG" data/organizacija.yaml || echo "  (nerasta YAML)"
  else
    echo "  (data/organizacija.yaml nerastas)"
  fi
fi

hr "4. Kabancios nuorodos kandidatai (target failo nera)"
# visi unikalus [[target]] be alias ir be #sekcijos, palyginti su egzistuojanciais .md vardais
# markdown lentelese alias rasoma kaip \| , tad po istraukos dar nuvalom backslash uodega
targets=$(grep -rhoE '\[\[[^]]+\]\]' "${MD[@]}" "${EXCL[@]}" . \
  | sed -E 's/\[\[([^]|#]+).*/\1/' | sed -E 's#.*/##' | sed -E 's/\\+$//' \
  | grep -vE '^[[:space:]]*$' | grep -vE '\.' | sort -u)
files=$(find . -name '*.md' -not -path './.git/*' -not -path './.obsidian/*' \
  -exec basename {} .md \; | sort -u)
missing=$(comm -23 <(printf '%s\n' "$targets") <(printf '%s\n' "$files"))
if [ -n "$missing" ]; then
  printf '%s\n' "$missing" | sed 's/^/  KABANTI: /'
else
  echo "  (kabanciu nuorodu nerasta)"
fi

hr "5. Kalbos svara: ilgi (em) ir vidutiniai (en) bruksniai"
grep -rn -e "$EM" -e "$EN" "${MD[@]}" "${EXCL[@]}" . || echo "  (svaru)"

hr "6. Anglicizmai: 'AI' vietoj 'DI', 'implementacij'"
grep -rnw 'AI' "${MD[@]}" "${EXCL[@]}" . || echo "  (AI nerasta)"
grep -rni 'implementacij' "${MD[@]}" "${EXCL[@]}" . || echo "  (implementacij nerasta)"

hr "7. Saka atsilikusi nuo main? (tarsos forma nr. 4)"
if git rev-parse --abbrev-ref HEAD >/dev/null 2>&1; then
  git fetch origin --quiet 2>/dev/null || echo "  (git fetch nepavyko, tikrink rankiniu budu)"
  behind=$(git rev-list --count HEAD..origin/main 2>/dev/null || echo '?')
  ahead=$(git rev-list --count origin/main..HEAD 2>/dev/null || echo '?')
  echo "  Si saka atsilikusi nuo origin/main: $behind commit(-u); pirmyn: $ahead"
  if [ "$behind" != "0" ] && [ "$behind" != "?" ]; then
    echo "  DEMESIO: pirma parsitrauk main, kad naivus merge tyliai negrazintu senos versijos."
    git log --oneline HEAD..origin/main 2>/dev/null | sed 's/^/    main turi: /'
  fi
else
  echo "  (ne git repozitorija)"
fi

hr "Baigta. Skriptas nieko nekeite. Veiksmus tvirtina zmogus."
