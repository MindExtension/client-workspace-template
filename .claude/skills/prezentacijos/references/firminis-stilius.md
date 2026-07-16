# <Klientas> firminis stilius (prezentacijoms)

> ŠABLONAS. Diegdami klientui: pakeisk `<Klientas>` į įmonės pavadinimą ir užpildyk
> `[užpildyti]` vietas pagal kliento logotipą (SVG), svetainę ir firminio stiliaus vadovą
> (brandbook), jei toks yra. Kol neužpildyta, prezentacijos naudoja neutralią numatytąją paletę.

Šitas failas laiko <Klientas> firminį stilių, kad kiekviena su DI kuriama prezentacija atrodytų
kaip <Klientas>, ne kaip atsitiktinis šablonas. Skill'as (`SKILL.md`) ir bazinis `base.html`
naudoja šitą paletę pagal nutylėjimą, tad naujos prezentacijos firminės iš karto.

## Kaip užpildyti (diegimo instrukcija)

1. Susirask kliento logotipo SVG (svetainė, brandbook, paklausk kliento). Iš jo išsitrauk
   2 ar 3 firmines spalvas (hex).
2. Iš firminių spalvų išvesk prezentacijos paletę žemiau: šviesų foną, tamsų foną, akcentą.
   Tamsų foną gali tekti patamsinti, kad baltas tekstas turėtų kontrastą.
3. Įrašyk tas pačias hex reikšmes į `templates/base.html` tailwind.config bloką (ir tik ten,
   klasės skaidrėse lieka tos pačios).
4. Iš kliento svetainės ir medžiagos aprašyk toną (žemiau) ir logotipo elgesį ant tamsaus fono.
5. Kur netikras, palik žymę `[patikslinti su klientu]`, neišgalvok.

## Spalvos

Firminės spalvos iš logotipo ar brandbook:

| Vaidmuo | Hex | Kur naudojam prezentacijoje |
|---|---|---|
| Pagrindinė tamsi | `[užpildyti]` | Tamsių fonų pagrindas |
| Akcentas | `[užpildyti]` | Akcento juostos, išskirti skaičiai, grafikų stulpeliai |
| Balta / šviesi | `#FFFFFF` | Švarus fonas |

Prezentacijos paletė (`base.html` tailwind.config), numatytosios neutralios reikšmės,
pakeisk į išvestas iš firminių:

| Slotas (klasė) | Numatytoji | Reikšmė |
|---|---|---|
| `cream` | `#F7F5F1` | Šviesus fonas |
| `offwhite` | `#FDFCFA` | Kortelių fonas |
| `navy` | `#24303F` | Tamsus fonas (firminę tamsią patamsink kontrastui su baltu tekstu) |
| `navy-deep` | `#171F2A` | Tamsesnis gradiento galas |
| `orange` (akcentas) | `#C65D2A` | Akcento spalva. Klasės pavadinimas visada lieka `orange`, kad nereikėtų perrašyti šablonų |
| `orange-dark` | `#A34A20` | Tamsesnis akcentas |
| `orange-light` | `#F6E2D5` | Šviesus akcento atspalvis (etiketės ant tamsaus, schemų mazgų užpildas) |
| `ink` | `#1B1B1B` | Beveik juoda, pagrindinis tekstas ant šviesaus |

Taisyklė: **pagrindinė tamsi spalva yra rimtis, akcentas yra akcentas.** Akcentą naudojam
taupiai, viena akcento juosta, vienas išskirtas skaičius ar grafiko stulpelis skaidrėje.
Ne visa skaidrė akcentinė.

## Logotipas

- Pavidalas: `[užpildyti: kaip atrodo logotipas, iš kokių dalių ir spalvų susideda]`
- Oficialus failas: `[užpildyti: nuoroda į SVG ar failo vieta bazėje]`
- Jei logotipas kelių spalvų, ant TAMSAUS fono tamsios dalys pranyksta. Tokiu atveju tamsioms
  skaidrėms reikia NEGATYVO (tamsi dalis perdažoma į baltą), šviesioms tinka pozityvas kaip yra.
  `[užpildyti: kuri dalis perdažoma ir kaip]`
- **Logotipą rodom tik VIRŠELYJE ir PABAIGOJE**, viršuje kairėje. NEkartojam jo ant kiekvienos
  skaidrės, tai tik prirašiukas, kuris blaško. Tarpinės skaidrės logotipo neturi.
- Tikro logotipo SVG parsisiuntimas yra tinklo komanda: pirma paklausk žmogaus (žr. `.claude/CLAUDE.md`),
  tada dėk kaip `<img>`. Jei žmogus nenori atsisiuntimo, viršelyje ir pabaigoje palik švarų
  tekstinį įmonės pavadinimą.

## Šriftai

- Prezentacijos naudoja supakuotus šriftus: **InstrumentSans** (antraštės), **WorkSans**
  (tekstas), **DMMono** (etiketės). Tai švarus, modernus, dalykiškas derinys.
- `[patikslinti su klientu]`: jei klientas turi firminį šriftą, jį reikia įdėti į `assets/fonts/`
  ir pakeisti `base.html` `@font-face` bei `fontFamily`. Iki tol laikom supakuotą derinį.

## Tonas ir asmenybė

`[užpildyti iš kliento svetainės ir medžiagos: kokias vertybes ir kokį charakterį komunikuoja]`

Ką tai reiškia skaidrėse (universalu, palik):
- **Švaru ir minimalu.** Daug oro, viena mintis skaidrėje, jokio vizualinio triukšmo.
- **Tikslu.** Skaičiai iš bazės, grafikai atitinka tikrus skaičius, jokio tempimo dėl grožio.
- **Premium, ne pigu.** Tvarkingas lygiavimas, nuosekli paletė, taupus akcentas. Blizgesys iš
  tvarkos, ne iš efektų.
- **Dalykiška, bet žmogiška.** Kalba paprasta, be žargono. Pasakojam istoriją, ne beriam faktus.

## Švarus vaizdas pagal nutylėjimą (be prirašiukų)

Skaidrės pagal nutylėjimą yra ŠVARIOS. Kampuose NErašom pasikartojančių prirašiukų.
Konkrečiai, be atskiro žmogaus prašymo NEDEDAM:
- pasikartojančio logotipo ar firmos pavadinimo ant kiekvienos skaidrės (tik viršelyje/pabaigoje),
- datų niekur (nei viršelyje, nei poraštėse),
- skaidrių numerių (`slide-number`),
- blokų etikečių viršuje dešinėje (eyebrow) ir poraščių su „parengta / įmonė · sritis" tekstu,
- ekrano navigacijos chrome (numeris, taškeliai, užuomina), strėlės tegu verčia be matomo chrome.

Tarpinės (turinio) skaidrės = tik antraštė ir turinys, sufokusuota. Auditorija žiūri į mintį,
ne į kampus. Jei žmogus aiškiai paprašo numerių ar poraščių, tada juos dedam.

## Firminio stiliaus kontrolė (naudoja refine ir dizaino peržiūra)

Prieš sakant „baigta", atvaizduotoje prezentacijoje patikrinam:
- [ ] Fonai iš firminės paletės, jokių pašalinių spalvų.
- [ ] Akcento spalva tik kaip akcentas, ne kaip fonas ir ne visur.
- [ ] Logotipas TIK viršelyje ir pabaigoje (ne ant kiekvienos skaidrės). Tamsiose negatyvas.
- [ ] Jokių prirašiukų kampuose: datų, eyebrow etikečių, poraščių, skaidrių numerių.
- [ ] Aiškus oras iš viršaus ir apačios, turinys nesiglaudžia prie kraštų (apie 65 iki 72 proc. užpildo).
- [ ] Vienoda paletė ir šriftai per visas skaidres.
- [ ] Lygiavimai tvarkingi, tinklelis laikosi (žr. `dizaino-rubrika.md`).
