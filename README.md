# Klientų workspace šablonas

Neutralus DI pagalbininkų (Agent Skills) rinkinys ir mokymo medžiaga naujo kliento žinių bazei
(workspace). Čia yra ŠALTINIS: visi įgūdžiai laikomi be jokių klientų duomenų, o diegiant
konkrečiam klientui kopijuojami ir pritaikomi jo bazėje.

Griežta taisyklė: šitame repo NIEKADA neatsiranda kliento vardas, žmonių vardai, skaičiai ar
kita kliento informacija. Pavyzdžiai tik anonimizuoti.

## Kas viduje

```
.claude/skills/          10 įgūdžių (žr. lentelę metodas/skills-sarasas.md)
metodas/skills-sarasas.md   mokymo dokumentas nariams: ką kuris įgūdis daro ir kaip paprašyti
diegimas/prezentaciju-irankiai.md   prezentacijų įrankių diegimo instrukcija
silotech-programa/prezentacijos/kontekstas-sablonas.md   prezentacijos konteksto šablonas
.claude/CLAUDE.md        bazės apsaugų šablonas (saugi zona, draudimai, konteksto izoliacija)
metodas/kas-kur-gyvena.md   doktrina: žinios ir šablonai gyvena bazėje, įrašai (sąskaitos, pasirašytos sutartys) sistemose
sablonai/README.md       šablonų aplanko griaučiai: kas tinka, kas ne, kaip pradėti
```

Įgūdžiai: `git-paprastai`, `atlikta`, `dienos-ataskaita`, `cleanup-workspace`, `tiesos-linteris`,
`lt-gramatika`, `lt-verslo-teise`, `prezentacijos`, `refine`, `wispr-dict-trainer`.

Pastaba dėl `refine`: jo tiesos šaltinis yra viešas `silotech-skills` repo. Atnaujinus ten,
atnaujinti ir čia.

## Diegimas naujam klientui (kontrolinis sąrašas)

1. Nukopijuok reikalingus įgūdžius į kliento repo: `cp -R .claude/skills/<įgūdis> <kliento-repo>/.claude/skills/`.
   Bazinis rinkinys ankstyvam etapui: `lt-gramatika`, `refine`, `cleanup-workspace`, `tiesos-linteris`,
   `prezentacijos`. Kai atsiranda git darbas šakomis: `git-paprastai`, `atlikta`. Pagal poreikį:
   `dienos-ataskaita`, `lt-verslo-teise`, `wispr-dict-trainer`.
2. Pakeisk `<Klientas>` žymes: `prezentacijos/references/firminis-stilius.md` ir `.claude/CLAUDE.md`.
3. Užpildyk `firminis-stilius.md` pagal kliento logotipą, svetainę ir brandbook (instrukcija failo viršuje).
   Įrašyk firmines spalvas į `prezentacijos/templates/base.html` tailwind.config bloką.
4. `git-paprastai` ir `atlikta`: sutikrink, kad kliento repo turi asmenines šakas vardais ir
   `komanda/nariai/<vardas>/uzduotys.md` struktūrą; įrašyk, kas yra peržiūrėtojas.
5. `lt-verslo-teise/references/es-teise.md` 4 skyrių pritaikyk kliento sektoriui.
6. Nukopijuok `metodas/skills-sarasas.md` į kliento bazę, palik tik įdiegtus įgūdžius, ištrink
   šablono pastabą viršuje, ir pridėk nuorodą į jį kliento pradiniame dokumente (PRADEK-CIA ar atitikmuo).
7. Jei diegi prezentacijas: nukopijuok `diegimas/prezentaciju-irankiai.md` ir
   `silotech-programa/prezentacijos/kontekstas-sablonas.md`.
7a. Nukopijuok `metodas/kas-kur-gyvena.md` ir `sablonai/` (README pritaikyk kliento procesams,
   pvz. įrašyk jo sistemas ir pirmo greito laimėjimo srautą). Šablonų surinkimas = geras ankstyvos
   sesijos namų darbas: klientas sudeda po vieną švarų kiekvieno tipo dokumentą, agentas nuasmenina.
8. Prieš push į kliento repo: patikrink, ar niekur neliko kitų klientų vardų ar pavyzdžių
   (`grep -ri` per įdėtus failus). Kliento repo gali turėti savo leak-guard kabliuką, jis tave
   pagaus, bet nesikliaujam vien juo.

## Priežiūra (abipusis srautas)

- Patobulinus įgūdį kliento bazėje, generinę pamoką parnešk čia (be kliento duomenų).
- Patobulinus čia, atnaujink klientų kopijas kito vizito metu.
- Diegimo bangas klientams varo HQ skillas `skills-rollout` (silotech-hq): matrica kas kur
  įdiegta, etapo vartai, vienas skillas per kartą, pristatymo draftas klientui.

## Kandidatai ateičiai

Dedam tik kai atsiranda realus poreikis, ir tik generinius:
- pašto apžvalga (inbox digest nariui)
- failų traukimas iš Drive ar kitų šaltinių
- `autonomous-loop` ir `launch-readiness` (yra viešame `silotech-skills` repo)
