---
name: prezentacijos
description: Kuria profesionalias verslo prezentacijas kaip HTML skaidres, atvaizduojamas į PDF per Playwright. Turi paruoštų skaidrių tipų biblioteką (viršelis, statistikos kortelės, trys stulpeliai, procesų schemos, grafikai, sluoksniai, pokalbio demonstracija, pabaiga) ir pats parenka vizualinius elementus pagal turinį: procesui schemą, skaičiams grafiką ar korteles, struktūrai medį. Vartotojui nereikia žinoti jokių techninių žodžių. Prieš kurdamas skaito prezentacijos aplanko kontekstas.md (kam, koks tikslas, kokia auditorija). Naudoti, kai prašoma padaryti prezentaciją, skaidres, pristatymą, pasiūlymo skaidres. Raktažodžiai - prezentacija, skaidrės, pristatymas, padaryk prezentaciją, sukurk skaidres, deck.
---

# Prezentacijos

Prezentacija kuriama kaip vienas `slides.html` failas (1920x1080 skaidrės), atvaizduojamas į PDF
per Playwright. **Rezultatas yra PDF.** PNG failai generuojami tik dizaino peržiūrai arba kai
žmogus aiškiai paprašo paveikslėlių.

## Prieš pradedant: kontekstas

Kiekviena prezentacija gyvena savo aplanke `silotech-programa/prezentacijos/<pavadinimas>/`. Pirmas failas jame yra
`kontekstas.md` (šablonas: `silotech-programa/prezentacijos/kontekstas-sablonas.md` repo šaknyje). Jame surašyta,
KAM prezentacija skirta, koks jos TIKSLAS, kokia AUDITORIJA ir ko keisti negalima.

Tvarka:
1. Jei `kontekstas.md` yra, perskaityk jį PIRMIAUSIA. Jis lemia toną, gylį, kalbą ir vizualus.
2. Jei jo nėra, užduok žmogui 3 klausimus (kam skirta, koks tikslas, kiek skaidrių) ir pats
   sukurk `kontekstas.md` iš atsakymų, kad kitą kartą jo klausti nebereikėtų.
3. Faktus imk iš šitos žinių bazės (procesai, vaidmenys, organizacija) ir iš konteksto failo.
   Nieko neišgalvok: jei fakto nėra, palik [užpildyti] žymę ir pasakyk žmogui.

## Darbo eiga

### 1. Karkasas
```bash
node .claude/skills/prezentacijos/scripts/scaffold.mjs silotech-programa/prezentacijos/<pavadinimas>
cd silotech-programa/prezentacijos/<pavadinimas>
npm install
npx playwright install chromium
```
Jei įrankiai dar neįdiegti, žr. `diegimas/prezentaciju-irankiai.md`. Diegimo komandas leisk tik
gavęs žmogaus patvirtinimą (žr. saugumo taisykles).

### 2. Skaidrių juodraštis
`slides.html` jau turi visą apipavidalinimą (šriftai, spalvos, schemų variklis). Skaidres dėk
prieš `</body>`: kopijuok bloką iš `templates/slides/*.html` ir keisk [pažymėtas] vietas.

Prieš KIEKVIENĄ skaidrę palik numeruotą žymę (pagal ją veikia skaidymo skriptai):
```html
<!-- ===== 01 Virselis ===== -->
<section class="slide ...">...</section>
```
Šablonų antraštinius komentarus (dideles KEISTINA pastabas) į `slides.html` nekopijuok, tik
patį `<section>` bloką su numeruota žyme.

Vizualinius elementus rink pagal `references/vizualiniai-elementai.md`: procesas virsta schema,
skaičiai grafiku ar kortelėmis, struktūra medžiu. Žmogui apie tai kalbėti nereikia, tai tavo darbas.

### 3. Peržiūra kuriant
Atsidaryk `slides.html` naršyklėje ir žiūrėk akimis po kiekvienų 2 ar 3 skaidrių. PDF kol kas
negeneruok.

### 4. Dizaino peržiūra (privaloma)
Prezentacija nėra baigta, kai atsivaizduoja. Pereik `references/dizaino-rubrika.md` ir
`references/pamokos.md` žiūrėdamas į ATVAIZDUOTAS skaidres:
```bash
npm run render:png   # output/slide-NN.png, tik peržiūrai
```
Radęs naują klaidų klasę, įrašyk pamoką į `references/pamokos.md`.

### 5. Galutinis PDF
```bash
npm run render       # output/<aplanko-vardas>.pdf
```

## Spalvos ir stilius (firminis)

Paletė apibrėžta vienoje vietoje, `slides.html` viršuje (tailwind.config bloke): `cream` šviesus
fonas, `navy` tamsus fonas, `orange` akcento spalva. Numatytosios reikšmės yra neutralios.
Kliento firminė paletė, logotipas, šriftai ir tonas aprašyti `references/firminis-stilius.md`,
perskaityk jį prieš kurdamas, kaip ir dizaino rubriką. Kitam klientui keičiamos tik hex reikšmės
tailwind.config bloke, klasės skaidrėse lieka tos pačios.

Logotipas: **tik viršelyje ir pabaigoje**, viršuje kairėje. NEkartojam jo ant kiekvienos skaidrės.
Jei logotipas kelių spalvų, ant tamsaus fono tamsi dalis pranyksta, tada naudok negatyvo versiją
(žr. `references/firminis-stilius.md`). SVG parsisiuntimas yra tinklo komanda, pirma paklausk
žmogaus; jei nenori atsisiuntimo, palik švarų tekstinį įmonės pavadinimą tik viršelyje ir pabaigoje.

Švarus vaizdas pagal nutylėjimą: kampuose NErašom prirašiukų. Be atskiro prašymo NEDEDAM datų,
skaidrių numerių (`slide-number`), eyebrow etikečių viršuje dešinėje, poraščių su „įmonė · sritis",
nei ekrano navigacijos chrome (numerio, taškelių, užuominos). Tarpinė skaidrė = tik antraštė ir
turinys, su dosniu oru iš viršaus ir apačios. Pilnas aprašas: `references/firminis-stilius.md`.

Akcento taisyklė: **pagrindinė tamsi spalva yra rimtis, akcentas yra akcentas.** Akcentą taupiai,
viena akcento juosta, vienas išskirtas skaičius ar grafiko stulpelis skaidrėje. Ne visa skaidrė
akcentinės spalvos.

Ritmas: tamsus viršelis, tamsios skiriamosios skaidrės tarp dalių, tamsi pabaiga, visa kita
šviesu. Ne daugiau kaip 2 tamsios iš eilės.

## Tobulinimas su refine (siūlyk automatiškai)

Kai pirmas variantas atvaizduotas ir perėjai dizaino rubriką, **PATS PASIŪLYK refine**, neverčiant
žmogaus prašyti. Baigęs pirmą PDF, paklausk viena eilute:

> Pirmas variantas paruoštas. Nori, kad prasukčiau tobulinimo ciklą (refine)? Jis peržiūri
> kiekvieną skaidrę atskirai, sutvarko lygiavimus ir patikrina, ar viskas pagal firminį stilių.

- Jei žmogus sako **taip** (arba iš karto paprašė kurdamas, pvz. „padaryk ir iškart refine"),
  prasuki refine **automatiškai**, be papildomų klausimų, ir tik pabaigoje parodai rezultatą.
- Jei sako **ne** arba nutyli, palieki pirmą variantą, refine neprasuki.

Refine eiga (skriptai leidžiami iš prezentacijos aplanko; kelią iki skill aplanko pasitikslink):
```bash
node .claude/skills/prezentacijos/scripts/split-slides.mjs        # slides.html -> slides-src/slide-NN.html
npm run render:png                                                 # PNG kiekvienai skaidrei (Playwright)
# refine: vienas agentas vienai skaidrei, lęšiai iš kontekstas.md + dizaino-rubrika.md + firminis-stilius.md
node .claude/skills/prezentacijos/scripts/reassemble-slides.mjs   # slides-src -> slides.html
npm run render                                                     # galutinis PDF
```
Refine tikslą ir auditoriją ima iš `kontekstas.md`, o vertinimo lęšius iš `dizaino-rubrika.md`
IR `firminis-stilius.md`. Skaidymas ir surinkimas turi sutapti baitas į baitą, patikrink
prieš keisdamas turinį.

### Firminė patikra su Playwright (privaloma po refine)

Po refine surinkimo dar kartą atvaizduok PNG per Playwright ir pažiūrėk į KIEKVIENĄ atvaizduotą
skaidrę (ne į kodą), tikrindamas firminio stiliaus kontrolinį sąrašą iš `firminis-stilius.md`:
```bash
npm run render:png            # output/slide-NN.png, žiūrėk akimis
```
Tikrini: (1) fonai iš firminės paletės, jokių pašalinių spalvų; (2) akcento spalva tik kaip taupus
akcentas, ne fonas; (3) logotipas tik viršelyje ir pabaigoje, jokių prirašiukų kampuose (datų,
numerių, eyebrow, poraščių); (4) vienoda paletė ir šriftai, aiškus oras iš viršaus ir apačios;
(5) lygiavimai tvarkingi, tinklelis laikosi, niekur tekstas neužlipa ir neišsprūsta už krašto.
Radęs neatitikimą, taisyk ir vėl atvaizduok. Tik tada generuok galutinį PDF ir sakyk „baigta".

## Apsaugos

- Jokių emoji skaidrėse. Jokių ilgų brūkšnių, vietoj jų kablelis arba trumpas brūkšnelis.
- Lietuviškos raidės visada teisingos (ą č ę ė į š ų ū ž).
- Faktų, skaičių ir pavadinimų neišgalvoti. Trūksta fakto? [užpildyti] žymė ir klausimas žmogui.
- Grafikų stulpeliai atitinka tikrus skaičius, vizualo netempti.
- Be žmogaus patvirtinimo nieko nediegti ir necommitinti (žr. `.claude/CLAUDE.md`).
- Prieš sakydamas "baigta" atvaizduok PDF ir pereik dizaino rubriką.
