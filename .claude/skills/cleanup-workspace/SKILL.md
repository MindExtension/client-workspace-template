---
name: cleanup-workspace
description: >
  Išvalo užterštą kontekstą šitoje žinių bazėje po pakeitimų (sujungtas PR ar šaka,
  pervadinta ar nebeaktuali rolė ar failas, pasikeitę etatų skaičiai). Dirba sekvensu:
  orientuojasi kas keitėsi, seka pakeitimo bangą per visą bazę (wikilink nuorodos, tiesos
  šaltinio failas, skaičiai, diagramos, sąveikų matrica, README rodyklės),
  kiekvieną radinį įvertina taršos skoru, paruošia planą ir tik po aiškaus žmogaus TAIP
  pritaiko pataisas (nebeaktualu žymos, nuorodų perkreipimas, dublikatų šalinimas, kabančių
  nuorodų taisymas, kalbos svara). NIEKADA netrina duomenų be patvirtinimo. Naudoti kai:
  sujungtas PR ar šaka, pervadinta ar panaikinta rolė ar failas, pasikeitė etatų skaičiai,
  reikia rasti pasenusius, nebeaktualius ar prieštaringus dalykus, arba kai sakoma
  "cleanup workspace", "cleanup-workspace", "išvalyk kontekstą", "sutvarkyk bazę po merge",
  "rask kas teršia kontekstą", "sutvarkyk nuorodas".
---

# Cleanup Workspace

Tikslas: po pakeitimo (sujungto PR, šakos, pervadintos ar nebeaktualios rolės) surasti visą
bazėje likusią **užterštą kontekstą** ir jį sutvarkyti taip, kad bazė neprieštarautų pati sau.
Ši bazė yra dirbtinio intelekto (DI) atmintis, tad kiekvienas pasenęs skaičius, kabanti nuoroda
ar prieštaravimas tyliai klaidina ir DI, ir žmogų. Šis skill paverčia tvarkymą aiškiu sekvensu
su vertinimo skoru, o ne akių pasitikėjimu.

Jei bazėje yra, skill remiasi dokumentu [[kaip-tersiasi-kontekstas]] (septynios taršos
formos su tikrais pavyzdžiais). Neperrašinėk to dokumento čia, o naudok jį kaip taršos formų
žinyną. Detalus vertinimo skoras ir paieškos receptai yra `references/vertinimo-rubrika.md`.

## Saugumo posūkis (skaityk pirma)

Galioja [[di-saugumo-taisykles|bazės saugumo taisyklės]] ir `.claude/CLAUDE.md`:

- Bazės viduje markdown failus skaityti, kurti ir redaguoti yra saugi zona.
- **Trynimas ir turinio šalinimas be žmogaus TAIP yra draudžiamas.** Net jei skoras aukštas,
  šalinimą ar failo ištrynimą visada pirma parodai ir gauni aiškų patvirtinimą.
- Už bazės ribų nieko nerašom, į išorines sistemas (apskaita, paštas) nerašom.
- Jokių `rm -rf`, `del`, `format`. Slaptų failų (.env, *secret*, *token*, *.key) neliečiam.

Numatyta laikysena: **siūlyk, nešalink savavališkai.** Mechaniškas, grįžtamas taisymas
(kabanti nuoroda į pervadintą failą, brūkšnys, skaičius pagal tiesos šaltinį) gali būti
pritaikytas kaip saugios zonos redagavimas, bet visada išvardijamas suvestinėje. Bet koks
turinio šalinimas laukia žmogaus TAIP.

## Sekvensas

Vykdyk griežtai iš eilės. Kiekvienas žingsnis maitina kitą.

### 1. Orientuokis: kas keitėsi

Nustatyk pakeitimo šaltinį (bent vieną):
- **Git**: `git fetch` ir palygink šaką su `origin/main`. Kas naujo main, ko dar nėra čia.
  Kas pakeista šitoje šakoje, ko dar nėra main.
- **PR ar merge**: paskutiniai commit'ai, sujungtos šakos, PR aprašymas.
- **Žmogaus nurodymas**: "rolė X nebeaktuali", "failas Y pervadintas į Z", "etatų iš 6 į 7".
- **Žymos jau bazėje**: paieška `nebeaktual`, `nebenaudoj`, `deprecated`, `pasenus`, `senas`.

**Spąstų patikra iš karto (taršos forma nr. 4):** ar tavo šaka atsilikusi nuo `main`? Jei taip,
naivus sujungimas gali tyliai grąžinti seną versiją ir ištrinti kito žmogaus darbą. Pirma
`git fetch`, tada palygink, ir tik tada tvarkyk. Jei radai atsilikimą, tai pirmas radinys.

### 2. Ištrauk pakeistus objektus

Iš pakeitimo išrink konkrečius objektus ir kiekvieno pakeitimo pobūdį:
- **rolės / vaidmenys** (slug, pvz. `uzsakymu-vadybininkas`): nebeaktuali, pervadinta, panaikinta;
- **failai**: pervadinti, perkelti, ištrinti;
- **žmonės**: pasitraukė, pakeitė pareigas, pavardės rašyba;
- **skaičiai**: etatai, kiekiai, procentai;
- **sistemos, datos, santrumpos**.

Kiekvienam objektui užsirašyk: kas buvo, kas tapo, pobūdis (deprecated / renamed / removed /
count-changed / added).

### 3. Sek bangą: rask analogišką kontekstą

Kiekvienam pakeistam objektui perbrauk **visą bazę** ir surask, kur jis dar gyvena. Tai ir yra
sekvenso esmė: deterministinė paieška objektas po objekto, ne spėjimas. Naudok
`scripts/sweep.sh <terminas>` arba receptus iš `references/vertinimo-rubrika.md`. Ieškok:
- `[[wikilink]]` nuorodų (ir su alias `[[slug|Tekstas]]`);
- laisvo teksto paminėjimų (žmogaus skaitomas pavadinimas, ne tik slug);
- **tiesos šaltinio** failo įrašų (pvz. `data/organizacija.yaml`, jei bazė tokį turi) (rolė, skaičius, žmogus);
- skaičių, diagramų (mermaid), sąveikų matricos ir etatų lentelės (jei bazėje yra);
- README ir rodyklių (`vaidmenys/vaidmenys.md`, departamentų sąrašai).

Papildomai, nepriklausomai nuo konkretaus objekto, perbrauk visos bazės bendrą sveikatą:
kabančios nuorodos (target failo nėra), našlaičiai failai (į juos niekas nenurodo), kalbos
svara (ilgi ir vidutiniai brūkšniai), tiesos šaltinio desinchronizacija.

### 4. Įvertink kiekvieną radinį (skoras)

Kiekvienam radiniui priskirk **taršos skorą** (0 - 100) ir **veiksmo tikrumą**. Signalai ir
taškai yra `references/vertinimo-rubrika.md`. Trumpai:
- kuo aiškiau radinys prieštarauja tiesai (nebeaktualu, bet vis dar aktyviai nurodoma; kabanti
  nuoroda; skaičius nesutampa su tiesos šaltiniu; dublikatas), tuo aukštesnis taršos skoras;
- veiksmo tikrumas rodo, kiek taisymas mechaniškas ir grįžtamas.

Veiksmo lygiai:
- **Aukštas tikrumas** (mechaniška, grįžtama, vienareikšmiška): kabančios nuorodos taisymas į
  pervadintą failą, brūkšnio šalinimas, skaičiaus suvedimas pagal tiesos šaltinį. Paruošiam ir
  parodom, pritaikom po vieno bendro TAIP.
- **Vidutinis tikrumas** (reikia sprendimo): nuorodos perkreipimas į spėjamą naują taikinį,
  skilties žymėjimas „nebeaktualu". Siūlom su argumentu, klausiam.
- **Žemas tikrumas** (semantinis sprendimas): ar visa rolė ar failas nebereikalingas, ar trinti
  failą. Niekada automatiškai, tik iškeliam žmogui aiškų klausimą.

### 5. Paruošk planą ir gauk TAIP

Pateik suvestinę lentelę: radinys (failas:eilutė), kas negerai, taršos skoras, siūlomas veiksmas,
veiksmo tikrumas. Rūšiuok pagal skorą, aukščiausi viršuje. Aiškiai atskirk:
- ką siūlai pritaikyti iš karto (aukštas tikrumas),
- ką reikia patvirtinti po vieną (vidutinis, žemas),
- **ką siūlai šalinti ar trinti (visada laukia atskiro žmogaus TAIP).**

Nepradėk jokio šalinimo, kol negavai aiškaus patvirtinimo.

### 6. Pritaikyk tik patvirtintus

Tik bazės viduje. Tipiniai veiksmai:
- kabančios nuorodos perkreipimas į teisingą ar pervadintą taikinį;
- skaičiaus suvedimas su tiesos šaltinio failu (šaltinis pirma, tada visos jo santraukos:
  `etatai.md`, org medis, diagramos, matrica);
- skilties ar failo žymėjimas „(nebeaktualu)" su trumpu paaiškinimu ir data;
- dublikato pakeitimas nuoroda į vieną kanoninę vietą;
- kalbos svara (brūkšniai, uždrausti anglicizmai, „AI" -> „DI").

Kiekvieną atliktą veiksmą užfiksuok suvestinėje. Jei žmogus patvirtino turinio šalinimą,
šalink tik tiksliai tą, kas patvirtinta.

### 7. Patikrink rezultatą (tikrink, ne tikėk)

Po pataisų dar kartą perbrauk:
- ar neliko kabančių nuorodų į pakeistą objektą;
- ar tiesos šaltinis ir visos jo santraukos sutampa (skaičiai vienodi visur);
- ar nebeliko naujų kalbos svaros pažeidimų (`grep -rnP '\x{2014}|\x{2013}' .`);
- perskaityk savo paties diff kaip skaitytojas, ne kaip rašytojas (`git diff`).

Pabaigoje pateik trumpą suvestinę: kiek radinių rasta, kiek pritaikyta, kiek laukia žmogaus,
kas liko sąmoningai nepaliesta ir kodėl. Niekada neteigk, kad viskas švaru, jei liko neišspręstų.

## Ribos

- Numatyta: siūlyk ir įvertink, netrink savavališkai. Šalinimas visada per žmogaus TAIP.
- Tik bazės viduje. Į išorines sistemas nerašom, laiškų nesiunčiam.
- Jei ko nematai ar neaišku, sąžiningai pažymėk, neprasimanyk taikinio.
- Kilus abejonei, laikykis [[di-saugumo-taisykles|saugumo taisyklių]].

## Susiję

- [[kaip-tersiasi-kontekstas]] (jei bazėje yra): taršos formų žinynas.
- [[kaip-dirbam-su-baze]]: bendra darbo su baze tvarka.
- [[di-saugumo-taisykles]]: ką galima ir ko negalima.
- [[zodynas]]: terminų vienoda rašyba.
