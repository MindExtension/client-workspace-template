# Kas kur gyvena: žinios, šablonai, įrašai

Paprastas testas prieš dedant failą į žinių bazę.

## Paradigma

Šita tvarka nėra tik failų higiena. Tai naujas darbo būdas: visas įmonės intelektinis turtas struktūrizuojamas į vieną schemą, ir tą daro patys žmonės, dirbdami per DI. Pirmoji vertė yra žinojimas, kur yra žinios. Kai schema stovi, ant jos galima organizuoti dalinimąsi (SharePoint ir kiti kanalai), kad informacija tekėtų ten, kur jos reikia. Bet pradžia visada ta pati: konceptualiai visi dirbame kartu per DI vienoje bazėje.

## Trys failų rūšys

1. **Žinios** (gyvena čia, bazėje). Keičiasi retai, agentas jas skaito kaip kontekstą: organizacijos aprašai, procesai, darbo taisyklės, žodynas, sistemų žemėlapiai. Klausimas: „ar agentas šitą skaito, kad suprastų, kaip pas mus viskas veikia?" Jei taip, vieta čia.
2. **Šablonai** (gyvena čia, `sablonai/`). Dokumentų ruošiniai, iš kurių gimsta nauji dokumentai: sutarčių formos, pasiūlymai, laiškai, tvarkos. Agentas + šablonas + žodynas = paruoštas juodraštis per kelias minutes. Žr. `sablonai/README.md`.
3. **Įrašai** (gyvena NE čia). Juos gamina procesas ir jų vis daugėja: sąskaitos, užsakymai, pasirašytos sutartys, susirašinėjimas, asmens duomenys. Jie priklauso tam skirtoms sistemoms (buhalterinė, CRM, dokumentų saugykla). Klausimas: „ar tokių failų atsiranda po kelis per savaitę ir juose yra konkrečių sandorių ar žmonių duomenys?" Jei taip, vieta sistemoje, ne bazėje.

## Kodėl taip

- Bazė lieka švari: agentui nereikia bristi per šimtus sąskaitų, kad rastų taisyklę.
- Jautrūs dokumentai neatsiduria ten, kur jiems ne vieta.
- Bazė perkeliama: markdown + git veikia su bet kokiu DI įrankiu, šiandien ir ateityje. Susitvarkyta žinių bazė yra turtas, kurį galima pajungti prie bet kokios būsimos sistemos.

## Pilka zona

Jei failas nei aiškios žinios, nei aiškus įrašas (pvz., svarbaus susitikimo santrauka), spręsk pagal naudą agentui: jei jis tai skaitys kaip kontekstą ateityje, trauk esmę į žinių failą, o originalą palik ten, kur gyvena dokumentai.
