# Prezentacijų įrankių diegimas

> Šitą failą gali tiesiog paduoti Claude Code: "perskaityk šitą gidą ir paruošk mano
> kompiuterį". Skirta agentui, bet parašyta taip, kad suprastų ir žmogus. Diegiama vieną
> kartą per kompiuterį. Veikia macOS ir Windows.

## Kas diegiama ir kodėl

| Įrankis | Kam reikia |
|---|---|
| Node.js (LTS) | Skriptams, kurie surenka ir atvaizduoja skaidres. Greičiausiai jau turi (žr. [`README.md`](README.md)). |
| Playwright + Chromium | Naršyklės variklis, kuris HTML skaidres paverčia į PDF. Diegiasi lokaliai, nieko nesiunčia į išorę. |

Interneto reikia dviem momentais: diegiant (paketai iš oficialaus npm registro) ir atvaizduojant
(skaidrės naudoja apipavidalinimo ir schemų bibliotekas iš CDN).

## Instrukcija agentui

Vykdyk žingsnius eilės tvarka. Prieš KIEKVIENĄ diegimo komandą paaiškink žmogui, ką ji daro,
ir gauk patvirtinimą (pagal `.claude/CLAUDE.md` taisykles). Nieko nediek aklai.

### 1. Patikrink Node.js

```bash
node --version
```

Jei versija 20 ar naujesnė, viskas gerai. Jei komandos nėra arba versija senesnė, įdiek Node.js
LTS pagal [`README.md`](README.md) (oficialūs skriptai `install-macos.sh` / `install-windows.ps1`
arba https://nodejs.org/en/download).

### 2. Paruošk bandomąją prezentaciją

Iš repo šaknies:

```bash
node .claude/skills/prezentacijos/scripts/scaffold.mjs silotech-programa/prezentacijos/bandymas
cd silotech-programa/prezentacijos/bandymas
npm install
npx playwright install chromium
```

`npm install` parsiunčia Playwright paketą, `npx playwright install chromium` parsiunčia
naršyklės variklį (apie 150 MB, vieną kartą). Abu iš oficialių šaltinių: registry.npmjs.org ir
playwright.dev infrastruktūros.

### 3. Patikrink, kad veikia

Į `slides.html` prieš `</body>` įdėk vieną bandomąją skaidrę (paimk `01-cover-dark.html` bloką
iš `.claude/skills/prezentacijos/templates/slides/`, pakeisk tekstus į bandomuosius ir pridėk
žymę `<!-- ===== 01 Bandymas ===== -->` prieš bloką). Tada:

```bash
npm run render
```

Sėkmė: terminale `✓ bandymas.pdf`, o `output/bandymas.pdf` atsidaro ir rodo skaidrę su
taisyklingomis lietuviškomis raidėmis.

### 4. Sutvarkyk po savęs

Parodyk žmogui PDF ir paklausk, ar gali ištrinti bandomąjį aplanką `silotech-programa/prezentacijos/bandymas/`.
Diegimas lieka (Playwright ir Chromium galioja visoms būsimoms prezentacijoms).

## Dažnos kliūtys

| Problema | Sprendimas |
|---|---|
| `node: command not found` | Node.js neįdiegtas arba terminalas senas. Įdiek pagal 1 žingsnį ir atsidaryk naują terminalą. |
| `npx playwright install` lėtas | Normalu, siunčiasi apie 150 MB. Palauk. |
| PDF be lietuviškų raidžių ar keistu šriftu | Aplanke trūksta `fonts/` (scaffold turėjo nukopijuoti). Paleisk scaffold dar kartą. |
| Schemos vietoje tuščias plotas | Nebuvo interneto atvaizdavimo metu (schemų variklis kraunasi iš CDN). Prisijunk ir paleisk `npm run render` iš naujo. |
| Windows: PowerShell blokuoja skriptus | Diegimui naudok `install-windows.ps1` instrukciją iš [`diegimas-windows.md`](diegimas-windows.md). |

## Susiję

- Prezentacijų naudojimas: `../silotech-programa/prezentacijos/README.md`
- Agento instrukcija: `../.claude/skills/prezentacijos/SKILL.md`
- Bonus užduotis išbandymui: `../komanda/pamokos/bonus-prezentacija/bonus-prezentacija.md`
