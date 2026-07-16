# Vertinimo rubrika ir paieškos receptai

Šis failas yra `cleanup-workspace` skill žinynas: kaip skaičiuoti taršos skorą, kokie signalai
ką reiškia ir kokiomis komandomis rasti radinius. Taršos formų prasmę žr.
[[kaip-tersiasi-kontekstas]] (neperrašinėjam jos čia, tik nurodom).

## Taršos skoras (0 - 100)

Kiekvienam radiniui sudedi taškus pagal signalus. Kuo aukščiau, tuo labiau radinys klaidina.

| Signalas | Taškai | Kaip atpažinti |
|---|---:|---|
| Objektas pažymėtas „nebeaktualu", bet kitur į jį vis dar aktyviai nurodoma | +40 | žymos paieška + gyvos `[[nuorodos]]` |
| Prieštarauja tiesos šaltiniui `data/organizacija.yaml` | +30 | skaičius, rolė ar žmogus nesutampa su YAML |
| Kabanti nuoroda (taikinio failo nėra) | +30 | `[[slug]]` be atitinkamo `slug.md` |
| Skaičius ar kiekis nesutampa su tiesos šaltiniu | +25 | „6" viena vieta, „7" kita |
| To paties turinio dublikatas keliose vietose | +20 | ta pati pastraipa ar sąrašas dviejuose failuose |
| Našlaitis failas (į jį niekas nenurodo, ne rodyklė ar README) | +15 | nulis įeinančių `[[nuorodų]]` |
| Kalbos svaros pažeidimas (ilgas ar vidutinis brūkšnys, „AI" vietoj „DI", „implementacija") | +10 | grep |
| Pasenusi data ar faktas prieš vėlesnį pakeitimą | +10 | data ankstesnė nei ją panaikinęs pakeitimas |

Orientaciniai slenksčiai (ne griežta riba, o pagalba rikiuoti):
- **70 - 100 (aukšta tarša):** aiškiai klaidina, tvarkyti pirmiausia.
- **35 - 69 (vidutinė):** verta sutvarkyti, dažnai reikia sprendimo dėl taikinio.
- **1 - 34 (žema):** kosmetika ar spėjama, tvarkyti paskutinį, nešvaistyti dėmesio.

## Veiksmo tikrumas (kaip saugu taisyti)

Nepainiok su taršos skoru. Taršos skoras sako „kiek blogai", veiksmo tikrumas sako „kiek saugu
taisyti automatiškai".

- **Aukštas:** mechaniška, grįžtama, vienareikšmiška. Kabančios nuorodos taisymas į akivaizdų
  pervadintą failą, brūkšnio šalinimas, skaičiaus suvedimas pagal YAML. Paruošiam, parodom,
  pritaikom po vieno bendro TAIP.
- **Vidutinis:** taikinys spėjamas arba keičiama prasmė. Nuorodos perkreipimas kai naujas
  taikinys tik numanomas, skilties žymėjimas „nebeaktualu". Siūlom su argumentu, klausiam.
- **Žemas:** semantinis sprendimas. Ar visa rolė nebereikalinga, ar trinti failą, ar sujungti du
  dokumentus. Niekada automatiškai. Iškeliam žmogui aiškų klausimą su faktais.

**Griežta taisyklė (`.claude/CLAUDE.md`):** turinio šalinimas ir failų trynimas visada laukia
žmogaus TAIP, nesvarbu koks skoras. Aukštas skoras leidžia rikiuoti dėmesį, ne apeiti patvirtinimą.

## Paieškos receptai (read-only)

Visos komandos tik skaito. Vykdyti iš bazės šaknies.

### Nuorodos ir paminėjimai į objektą
```bash
# slug nuorodos (su alias ir be)
grep -rniP '\[\[slug([|][^]]*)?\]\]' --include='*.md' .
# žmogaus skaitomas pavadinimas laisvu tekstu (pritaikyk regex savo terminui)
grep -rniP 'u[zž]sakym[uų] vadybinink' --include='*.md' .
# tiesos šaltinis
grep -niP 'terminas' data/organizacija.yaml
```

### Kabančios nuorodos (target failo nėra)
```bash
# visi unikalūs [[targetai]] (be alias), palyginti su egzistuojančiais .md
comm -23 \
  <(grep -rhoP '\[\[[^]]+\]\]' --include='*.md' . | sed -E 's/\[\[([^]|#]+).*/\1/' | sort -u) \
  <(find . -name '*.md' -not -path './.git/*' -exec basename {} .md \; | sort -u)
# likusieji targetai, kuriems nėra failo, yra kabančių nuorodų kandidatai
# (atmesk sekcijų nuorodas su # ir aiškiai išorinius)
```

### Kalbos svara (ilgi ir vidutiniai brūkšniai, anglicizmai)
```bash
grep -rnP '\x{2014}|\x{2013}' --include='*.md' .          # em ir en brūkšniai
grep -rniP '\bAI\b' --include='*.md' .                    # turėtų būti DI (ne kodo blokuose)
grep -rni 'implementacij' --include='*.md' .              # turėtų būti diegimas
```

### Šaka atsilikusi nuo main (taršos forma nr. 4)
```bash
git fetch origin
git log --oneline HEAD..origin/main   # ko main jau turi, o ši šaka dar ne
git log --oneline origin/main..HEAD   # ką ši šaka turi virš main
```

### Tiesos šaltinio desinchronizacija (skaičiai)
```bash
# palygink etatų skaičius YAML ir etatai.md rankiniu perskaitymu;
# jei keitei skaičių, atnaujink VISAS kopijas: organizacija.yaml, etatai.md, org medis, diagramos.
grep -niP 'etatai:|skaicius:' data/organizacija.yaml
```

## Suvestinės lentelės pavyzdys

Planą žmogui teik tokia forma (rūšiuota pagal skorą):

| # | Radinys (failas:eil.) | Kas negerai | Skoras | Veiksmas | Tikrumas |
|---|---|---|---:|---|---|
| 1 | organizacija/etatai.md:77 | rolė nebeaktuali, bet vis dar etatų lentelėje | 65 | žymėti „nebeaktualu" arba pašalinti eilutę | vidutinis |
| 2 | vaidmenys/pardavimu-vadybininkas.md:72 | nuoroda į nebeaktualią rolę | 40 | perkreipti į naują taikinį arba pažymėti | vidutinis |

Prie kiekvienos eilutės, kur siūlai šalinti, aiškiai pažymėk, kad tai laukia žmogaus TAIP.
