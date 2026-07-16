# Vizualinių elementų parinkimas pagal turinį

Žmogus sako, KĄ nori parodyti, o tu pats parenki, KAIP tą parodyti. Vartotojui nereikia žinoti
jokių techninių žodžių (Mermaid, SVG, flowchart). Jis sako "parodyk užsakymo kelią", tu pats
išsirenki procesų schemą.

## Parinkimo lentelė

| Kai turinys yra... | Naudok | Šablonas |
|---|---|---|
| Procesas, eiga, "kas po ko" | Procesų schema (Mermaid flowchart) | `12-procesu-schema.html` |
| Sprendimas su šakomis ("jei taip, jei ne") | Schema su rombu (Mermaid flowchart su `{}` mazgu) | `12-procesu-schema.html` |
| Organizacinė struktūra, hierarchija | Medis (Mermaid `flowchart TD`) | `12-procesu-schema.html` (pakeisk kryptį į TD) |
| Skaičių palyginimas (metai, kategorijos, prieš ir po) | Stulpelinis grafikas | `13-skaiciu-grafikas.html` |
| 2 arba 4 svarbūs rodikliai | Statistikos kortelės | `02-why-now-split.html` |
| 3 lygiaverčiai variantai, režimai, kategorijos | Trys stulpeliai | `03-three-columns.html` |
| Sluoksniuota sistema, lygiai, etapai vienas ant kito | Sluoksnių krūva | `05-layers-stack.html` |
| Kas yra centre ir kas aplink (žmogus, sistema, klientas) | Koncentrinė diagrama | `06-concentric-diagram.html` |
| Klausimas ir atsakymas, pokalbio demonstracija | Pokalbio kortelė | `08-qa-conversation.html` |
| Struktūruoti duomenys, laukų sąrašas, įrašo pavyzdys | Duomenų lentelė | `09-data-schema.html` |
| Skyriaus pradžia, kvėpavimo pauzė | Tamsi skiriamoji skaidrė | `04-section-break-dark.html` |
| Pirmoji skaidrė | Viršelis | `01-cover-dark.html` |
| Paskutinė skaidrė, kvietimas veikti | Pabaigos skaidrė | `11-closing-cta.html` |

## Mermaid schemų receptai

Visos schemos rašomos į `<pre class="mermaid">` bloką (jis jau paruoštas šablone
`12-procesu-schema.html`, variklis pajungtas per `base.html`). Dažniausi pavidalai:

**Eiga iš kairės į dešinę** (procesai, srautai):
```
flowchart LR
  A["Užklausa"] --> B["Pasiūlymas"] --> C["Užsakymas"]
```

**Medis iš viršaus žemyn** (struktūra, hierarchija):
```
flowchart TD
  V["Vadovas"] --> G["Gamyba"]
  V --> P["Pardavimai"]
  G --> OP["Operatoriai"]
```

**Sprendimas** (rombas yra klausimas):
```
flowchart LR
  A["Gauta byla"] --> B{"Ar tinka spaudai?"}
  B -- "Taip" --> C["Į gamybą"]
  B -- "Ne" --> D["Grąžinam klientui taisyti"]
```

Taisyklės schemoms:
- Mazgų tekstai visada kabutėse `["..."]`, kad lietuviškos raidės ir tarpai nesulūžtų.
- Iki 9 mazgų vienoje skaidrėje. Daugiau reiškia, kad reikia skelti į dvi skaidres.
- Trumpi mazgų pavadinimai, 1 arba 3 žodžiai. Detalės eina į pastabą po schema.

## Grafikų taisyklės

- Stulpelinis grafikas daromas grynu CSS (šablonas `13-skaiciu-grafikas.html`), be jokių
  bibliotekų: stulpelio `height` procentas atitinka reikšmę, didžiausia reikšmė apie 90 procentų.
- Aukščiai PRIVALO atitikti tikrus skaičius. Niekada netempk stulpelio dėl grožio.
- Skaičius rašyk virš stulpelio, etiketę po juo. Išskirtinį stulpelį daryk akcento spalva,
  likusius pilkus (`bar muted`).
- Linijos grafikas ar skritulinė diagrama reikalinga retai. Jei tikrai reikia, piešk SVG ranka
  (polyline su taškais pagal tikras reikšmes) toje pačioje kortelėje, laikykis paletės.

## Bendras principas

Kiekviena skaidrė turi VIENĄ vizualinį akcentą: schemą, grafiką, korteles ARBA didelį skaičių.
Ne du iš karto. Jei tekstas pasakoja procesą, jis virsta schema. Jei tekstas lygina skaičius,
jis virsta grafiku arba kortelėmis. Ištisiniai teksto sąrašai yra paskutinė priemonė.
