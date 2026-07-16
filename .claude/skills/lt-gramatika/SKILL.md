---
name: lt-gramatika
description: Patikrinti lietuviško teksto gramatiką, rašybą, skyrybą ir skaitomumą (readability). Naudoti kai yra bet koks lietuviškas tekstas ir prašoma jį patikrinti ar pagerinti. Trigger: patikrink gramatiką, sutvarkyk tekstą, ar taisyklingas laiškas, perskaityk prieš siunčiant. Tinka - LinkedIn postai, el. laiškai, pasiūlymai, mokomoji medžiaga, vidiniai dokumentai, blog'ai. Skill'as randa gramatikos klaidas IR pasiūlo, kaip tekstą padaryti aiškesnį, trumpesnį, lengviau skaitomą. Taip pat aptinka ir išardo dirbtinio intelekto rašysenos žymes (AI smell) - triadas (trijų dėmenų taisyklę), lygiagrečius fragmentus, perdėtą simetriją, šablonines sakinių struktūras ir ritmo monotoniją, kad tekstas skambėtų natūraliai, ne kaip DI generuotas.
---

# Lietuvių kalbos gramatikos ir skaitomumo tikrinimas

## Tikslas

Surasti ir ištaisyti dvi problemų klases lietuviškame tekste:

1. **Gramatika ir rašyba** - linksniavimas, kirčiavimas, skyryba, diakritiniai ženklai, anglicizmai.
2. **Skaitomumas (readability)** - sakinių ilgis, pasyvas, biurokratinės konstrukcijos, perteklinės frazės, struktūros klaidumas.

Nekeisti turinio prasmės, tik kalbos taisyklingumą ir aiškumą.

---

# DALIS 1 - GRAMATIKA IR RAŠYBA

## 1. Dažniausios linksnių klaidos

- **įmonėms / įmonės** - naudininkas vs. kilmininkas: „savo įmonės klientams" (kieno?), ne „įmonėms klientams" (kam?)
- **Galininkas laiko trukmei** - „tris metus", „dvi savaites", ne „trys metai" ar „dvi savaitės" kaip laiko trukmė
- **Santykinis įvardis kilmininke** - „modelių, kurių savybės..." (kieno savybės?), ne „kurie savybės"

## 2. Įvardžiuotinės formos (apibrėžtumas)

- Konkretus daiktas → įvardžiuotinė forma: „tikroji istorija" (the real story), ne „tikra istorija" (a real story)
- Testas: ar galima pasakyti „ta X"? Jei taip - reikia įvardžiuotinės formos.

## 3. Dažnos žodžių formos klaidos

- **„nė vienas"** (not a single one) - NE „nei vienas" (jungtukas, naudojamas „nei... nei...")
- **„naujas/nauja"** - būdvardis turi atitikti daiktavardžio giminę: „nauja norma" (norma - mot. g.)
- **„tris dešimtmečius"** (acc.) - NE „trys dešimtmečius" (sumaišytos formos)

## 4. Anglicizmai ir svetimžodžiai

- „vetuotas" → „patikrintas" arba „atrinktas"
- „implementacija" → „diegimas"
- „chatbot'as" - priimtina, bet galima ir „pokalbių robotas"
- „resursai / resursų" → „ištekliai / išteklių" (rusizmas)
- „treniruoti" (ML kontekste) → „apmokyti" - naudoti nuosekliai
- „implementuoti" → „diegti / įgyvendinti"

**Tech terminai:** kai vartojamas sulietuvintas terminas, pirmą kartą skliaustuose pridėti anglišką originalą:
- „vektorinis modelis (embedding model)", „kešavimas (caching)"

**Svarbu tech/business tekstuose:** EN `layer` neversti pažodžiui kaip „sluoksnis". Lietuvos vadovui taip skamba nenatūraliai. Rinktis pagal kontekstą:
- „lygmuo" - architektūrai, valdymui, modeliui, vykdymui;
- „dalis" / „grandies dalis" - grandinės metaforai;
- „pakopa" - kainodarai, planams, brandai ar prieigos režimams.

## 4a. Daiktavardinės konstrukcijos (nominalizacija)

Veiksmažodiniai daiktavardžiai (-imas/-ymas) dažnai sunkina tekstą:

- „atlikti patikrinimą" → „patikrinti"
- „daryti sprendimus" → „spręsti"
- „vykdyti analizę" → „analizuoti"
- „žiūrėjimas" → „požiūris"

Testas: ar sakinys skamba natūraliai išsakytas garsiai? Jei dirbtinai - keisti.

## 4b. Simboliai sklandžiame tekste

- „6×", „8×" → „šešis kartus", „aštuonis kartus"
- „~$10" → „apie 10 €" arba „maždaug 10 €"

## 4c. Terminų nuoseklumas

Tas pats konceptas visame tekste turi turėti vieną terminą:
- „apmokytas" vienoje vietoje + „treniruojamas" kitur ta pačia reikšme = klaida.
- Sudaryti reikšminių porų sąrašą ir patikrinti.

## 4d. Verslo ir IT kalkės (dažnos verslo komunikacijoje)

Tiesioginiai vertiniai iš anglų kalbos, kuriuos DI dažnai palieka. Šie YRA klaida (taisyti), ne abejotini. Pavyzdžiai sugalvoti, ne iš realių laiškų:

| Kalkė / anglicizmas | Taisyklinga lietuviškai |
|---|---|
| „klaidos **fix**" | „klaidos **taisymas**" |
| „mėnesio **raportas**" | „mėnesio **ataskaita**" |
| „**deadline'as** penktadienį" | „**terminas** penktadienį" |
| „**meeting'as** su tiekėju" | „**susitikimas** su tiekėju" |
| „**apruvinti** užsakymą" | „**patvirtinti** užsakymą" |
| „**sumappinau** duomenis su lentele" | „**susiejau / sugretinau** duomenis su lentele" |
| „viskas **ok**" | „viskas **gerai**" |
| „**storage** / **lifecycle** / API **limitų**" | „**saugykla** / **gyvavimo ciklas** / API **ribų**" |
| „**deployment** / migracijų pagalba" | „**diegimas** / pagalba su migracijomis" |
| „**implementacija**" | „**diegimas / įgyvendinimas**" |

**Skyrybos / valdymo niuansai (dažnos klaidos):**
- „Sumos **ką** suskaičiavau" → „Sumos, **kurias** suskaičiavau" (santykinis įvardis, ne „ką")
- prašyti + **kilmininkas**: „taisymas, **kurio** kolega prašė" - NE „kurį prašė"
- „perdarysim **kai** rasim" → „perdarysim**,** kai rasim" (kablelis prieš šalutinį „kai")

**Sąmoningai paliekama autoriaus balse** (NETAISYTI, jei toks registras): šnekamosios formos („setup'as", „tavim", „iškėlėt"), emoji, produktų ir kampanijų pavadinimai anglų kalba.

## 5. Dvigubas neigimas - privalomas

DI dažnai praleidžia vieną neigimą dėl angl. kalbos įtakos:
- „niekas **ne**atėjo", „niekur **ne**ina", „nieko **ne**žino"
- ❌ „niekas atėjo", „niekur eina"

## 5a. Veiksmažodžių valdymas (rection)

| Veiksmažodis | Linksnis | Pavyzdys |
|---|---|---|
| bijoti | kilm. (ko?) | bijoti šalčio |
| laukti | kilm. (ko?) | laukti rezultatų |
| vadovauti | naud. (kam?) | vadovauti įmonei |
| naudotis | įnag. (kuo?) | naudotis galimybe |
| klausti | kilm. (ko?) | klausti nuomonės |
| klausinėti | gal. (ką?) | klausinėti žmones |
| laikytis | kilm. (ko?) | laikytis taisyklių |
| atsisakyti | kilm. (ko?) | atsisakyti pasiūlymo |
| pasirinkti | gal. (ką?) | pasirinkti variantą |

## 5b. Pusdalyviai ir padalyviai

Pusdalyvis (-damas/-dama) turi sutapti su sakinio veiksniu:
- ✅ „Dirbdamas jis parašė ataskaitą"
- ❌ „Dirbdamas ataskaitą parašė komanda" (dangling participle)

## 5c. Lyginamasis laipsnis - sintetinė forma

- ❌ „labiau svarbus", „labiau efektyvus"
- ✅ „svarbesnis", „efektyvesnis"
- Išimtis: „labiau prieinamas" (kai sintetinės nėra) - priimtina

## 5d. „Nei...nei" konstrukcija

- ✅ „nei A, nei B"
- ❌ „ne A, ne B"
- ✅ „ne tik...bet ir"

## 5e. Sangrąžiniai veiksmažodžiai (-tis)

| Klaida | Taisyklinga |
|---|---|
| „mokyti" reikšme „mokytis" | mokyti = teach; mokytis = learn |
| „dominti" reikšme „domėtis" | dominti = interest; domėtis = be interested |
| „taikyti" reikšme „taikytis" | taikyti = apply; taikytis = adapt |
| „rasti" reikšme „rastis" | rasti = find; rastis = appear/emerge |

## 5f. Skaitvardžiai + daiktavardžiai

- 1-4 → vardininkas: „du modeliai", „trys rezultatai"
- 5+ → kilmininko daugiskaita: „penki modelių", „dešimt rezultatų"
- ❌ „penki modeliai", „dešimt rezultatai"

## 5g. Predikatinis naudininkas

- ✅ „Man šalta", „Jam reikia pagalbos", „Komandai svarbu"
- ❌ „Aš šalta", „Jis reikia", „Komanda svarbu" (angl. įtaka)

## 6. Skyryba

- Prieš „ar" netiesioginiame klausime - kablelis: „Klausimas, ar jis atvyks."
- Prieš „kad" papildiniame sakinyje: „Manau, kad tai tiesa."
- Prieš „kuris/kuri/kurie" santykiniame sakinyje: „Žmogus, kuris atvyko, yra inžinierius."
- Įterptiniai žodžiai atskiriami kableliais: „Tai, žinoma, svarbu."
- Po jungtukų „bet", „o", „tačiau" - kablelis prieš juos.

## 6a. Brūkšniai ir brūkšneliai

- **Brūkšnys (-)**: tarp pavyzdžių, paaiškinimų, akcento. „Tai svarbu - niekam nesakyk."
- **Brūkšnelis (-)**: sudurtiniuose žodžiuose, pvz., „mokomoji-mokslinė", „IT-specialistas".
- ❌ „Pirma -" sąraše. ✅ „Pirma -" arba „Pirma:".

## 7. Diakritiniai ženklai (nosinukai) - PRIVALOMA tikrinti

| Taisyklinga | Dažna klaida |
|---|---|
| **ą** | a (tą → ta, šiandieną → šiandiena) |
| **č** | ch, c (čia → cia) |
| **ę** | e (ženklą → zenkla) |
| **ė** | e (ėjo → ejo) |
| **į** | i (į → i, įmonė → imone) |
| **š** | sh, s (šiandien → siandien) |
| **ų** | u (žmonių → zmoniu) |
| **ū** | u (būtų → butu) |
| **ž** | zh, z (žinau → zinau) |

**Niekada transliteracija** sh/zh/ch/u vietoje š/ž/č/ū.

**Ypač dažnos klaidos**: galūnės (-ų, -ius, -ių), prieveiksmiai (čia, šiandien), veiksmažodžių formos (būtų, galėtų, reikėtų).

**Slapti svetimi simboliai**: kartais copy-paste palieka kirilicos `а` (ne LT `a`), graikų `ο` (ne LT `o`). Aktyviai ieškoti pažiūrint į žodžių vidų - vizualiai vienodas, bet kiti baitai.

## 8. Kiti dėsningumai

- **„daugmaž"** - rašoma kartu
- **„iš tikrųjų"** - rašoma atskirai
- **Didžioji raidė** formaliai kreipiantis: „Jūs", „Jūsų", „Jums"
- **Datos**: „2026 m. gegužės 5 d." (LT formatas)
- **Tūkstančiai**: „1 000" arba „1000" (ne „1,000" - angl. įtaka)

---

# DALIS 2 - SKAITOMUMAS (READABILITY)

Lietuviškas tekstas dažnai ilgas ir kupinas pasyvinių konstrukcijų. Skaitomumas pagerina supratimą.

## 9. Sakinių ilgis

- **Tikslas**: vidutinis sakinys 12-18 žodžių; max 25 žodžiai (be sąrašų).
- **Per ilgi sakiniai laužyti** į du ar tris.
- **Ilgio variacija**: po ilgo sakinio - trumpas. Monotonija sunkina.

Žymės, kad sakinys per ilgas:
- Daugiau nei 2 šalutinių sakinių lygmenys
- Daugiau nei 3 kableliai
- „kuris" / „kad" / „nors" pasitaiko du kartus tame pačiame sakinyje

## 10. Aktyvas vs. pasyvas

DI mėgsta pasyvą, bet aktyvas aiškesnis:

- ❌ „Sutartis buvo pasirašyta vadovo." → ✅ „Vadovas pasirašė sutartį."
- ❌ „Sprendimas yra priimamas komandos." → ✅ „Komanda priima sprendimą."
- ❌ „Buvo nustatyta, kad..." → ✅ „Nustatėme, kad..."

Pasyvas tinka, kai veikėjas nesvarbus arba nežinomas: „Sutartis buvo pasirašyta 2024 m." (ok, jei kontekste neaišku, kas pasirašė ir tai nesvarbu).

## 11. Biurokratinės konstrukcijos

Pakeisti sunkias frazes paprastomis:

| Sunki frazė | Paprasta forma |
|---|---|
| atsižvelgiant į tai, kad | nes |
| esant tokioms aplinkybėms | tada |
| pateikti pasiūlymą | pasiūlyti |
| atlikti analizę | analizuoti |
| daryti sprendimą | spręsti |
| turi galimybę | gali |
| yra įpareigotas | privalo |
| pateikiame šią informaciją | pranešame |
| esame įsitikinę, kad | manome, kad |
| turime tikslą | siekiame |
| dėl to, kad | nes |
| tuo atveju, kai | kai |

## 12. Pertekliniai žodžiai

Žodžiai, kuriuos beveik visada galima pašalinti be prasmės netekimo:

- „iš tiesų", „iš esmės", „faktiškai", „tikrai" (kaip užpildas)
- „tam tikras", „kažkoks", „kaip ir" (kai netikslina)
- „labai", „gana", „pakankamai" (kai pats būdvardis stiprus)
- „tiesiog", „tiesiog tai" (filer)
- „kad ir kaip ten bebūtų", „kaip ten bebūtų"

## 13. Pasikartojantys žodžiai

- Ar tas pats žodis kartojasi 3+ kartus per pastraipą? - pakeisti sinonimu arba įvardžiu.
- „yra" / „turi" / „daro" pasikartoja per dažnai - perfrazuoti su konkretesniu veiksmažodžiu.

## 14. Sunkūs daiktavardžių junginiai (noun chains)

- ❌ „klientų aptarnavimo kokybės gerinimo strategija"
- ✅ „strategija, kaip pagerinti klientų aptarnavimą"

Kai 4+ daiktavardžiai eina iš eilės kilmininkais - laužyti su veiksmažodžiu arba prielinksniu.

## 15. Pradžios silpnumas

Sakinys neturėtų prasidėti silpnomis frazėmis:
- ❌ „Yra svarbu pažymėti, kad..." → ✅ „Svarbu, kad..." arba praleisti
- ❌ „Reikia paminėti, kad..." → ✅ „Paminėtina, kad..." arba praleisti
- ❌ „Tai yra dalykas, kuris..." → ✅ „Tas dalykas..." arba pradėti nuo esmės

## 16. Pastraipos struktūra

- **Vienas pastraipos vienetas - viena mintis**. Jei pastraipa turi 2-3 mintis - laužyti.
- **Trumpos pastraipos** (2-4 sakiniai) skaitytojui patogiau nei vienos didelės.
- **Sąrašai** vietoj ilgo sakinio su „a, b, c ir d" - kai punktų 3+ ir jie struktūriškai lygūs.

## 17. Konkretumas vs. abstrakcija

- ❌ „Daug klientų išreiškė susidomėjimą" → ✅ „37 klientai susisiekė"
- ❌ „Reikšmingai patobulinta" → ✅ „Greitis padidėjo dvigubai"
- ❌ „Kažkokie probleminiai aspektai" → ✅ įvardyti, kokie

## 18. Tonas ir registras

- **Vientisas registras**: jei tekstas profesionalus - neperšokti į šnekamąją kalbą („nu", „va", „toks dalykas").
- **Žodyno lygis**: jei auditorija nespecializuota - vengti specialaus žargono be paaiškinimo.
- **Vengti dviprasmybių**: sąvoka, kuri turi kelias reikšmes, paaiškinama pirmąkart.

---

# DALIS 3 - DIRBTINIO INTELEKTO RAŠYSENOS ŽYMĖS (AI smell)

DI generuotą tekstą išduoda ne atskiros klaidos, o **pasikartojančios sakinių struktūros ir per tvarkingas ritmas**. Šios žymės **taisytinos**, net jei gramatika nepriekaištinga - tikslas, kad tekstas skambėtų kaip žmogaus, ne kaip šablonas. Tai privaloma peržiūros dalis, ne pasirinktina.

## 19. Trijų dėmenų taisyklė (triada) - DAŽNIAUSIA žymė

Trys lygiagretūs, kableliais atskirti dėmenys viename sakinyje. Skamba ritmiškai, bet dirbtinai. Ypač dažna sakinio ar pavadinimo pabaigoje.

- ❌ „Atsako iš karto, tik iš oficialių šaltinių, su nuoroda į pirminį puslapį."
- ✅ „Atsako iškart ir nurodo, iš kur paimta." (du dėmenys arba vieną dėmenį paversti šalutiniu)

**Taisymas:** sumažinti iki dviejų dėmenų ARBA vieną dėmenį paversti šalutiniu sakiniu. Tris lygiagrečias frazes vengti net tada, kai visos trys teisingos.

## 20. Lygiagrečių fragmentų krūva (staccato)

Trumpi, vienodos sandaros fragmentai vienas po kito.

- ❌ „Greita. Saugu. Be Smart ID." / „Aišku. Patikima. Iškart."
- ✅ Sujungti į natūralų sakinį arba palikti vieną akcentą.

## 21. Antitezės formulė „ne tik X, bet ir Y" / „tai ne A, o B"

DI piktnaudžiauja simetriškomis priešpriešomis.

- ❌ „Tai ne tik įrankis, bet ir patikimas palydovas."
- Vieną kartą tekste - gerai (stiprina). Kelis kartus - žymė. Pakeisti tiesioginiu teiginiu.

## 22. Tuščios stiprinamosios pradžios

- ❌ „Verta paminėti, kad...", „Svarbu pabrėžti, kad...", „Žinoma, negalima pamiršti..."
- ✅ Pradėti nuo esmės. (žr. 15 sk.)

## 23. Būdvardžiai poromis / triadomis (marketinginis tonas)

„sklandus, galingas ir intuityvus", „patikimas ir efektyvus".

- ✅ Vienas konkretus būdvardis arba konkretus faktas vietoj būdvardžių virtinės.

## 24. Apibendrinimo ir „kelionės" formulės

- ❌ „Trumpai tariant,...", „Apibendrinant,...", „Galiausiai, verta...", „pasinerkime", „atverkime duris", „naujas erą".
- ✅ Baigti konkrečiu teiginiu arba veiksmu.

## 25. Ritmo monotonija

Visi sakiniai panašaus ilgio ir sandaros (veiksnys-tarinys-papildinys). Žmogus rašo nelygiai.

- Tikrinti: ar yra bent vienas trumpas (3-6 ž.) ir bent vienas ilgesnis sakinys? Ar ne visi prasideda vienodai?
- **Taisymas:** keisti sakinių ilgį ir pradžią (žr. 9 sk. „Ilgio variacija").

## 26. Dirbtinis įtraukimas

- ❌ „Įsivaizduokite pasaulį, kuriame...", retorinių klausimų virtinės.
- ✅ Konkretus scenarijus arba faktas.

## 27. Per dažnas brūkšnys minčiai pabrėžti

DI mėgsta brūkšnį kas antrame sakinyje (žr. 6a). Palikti retai; dažniau kablelis arba taškas.

**Testas visam tekstui:** perskaityti garsiai. Jei juntamas „trigubas" ritmas, perdėta simetrija ir sklandžios, bet tuščios frazės - tai DI žymės. Laužyti simetriją, trumpinti, įdėti konkretumo.

---

# Procesas

1. **Perskaityti visą tekstą** (arba failų rinkinį, jei jų daug).
2. **Pirmoji peržiūra - gramatika**:
   - Aktyviai patikrinti nosinukus (`grep` neraidinių variantų)
   - Patikrinti veiksmažodžių valdymą
   - Patikrinti skaitvardžių derinį
   - Patikrinti sangrąžinius (-tis)
   - Patikrinti svetimus simbolius (kirilica žodžių viduje)
3. **Antroji peržiūra - skaitomumas**:
   - Pažymėti per ilgus sakinius
   - Pažymėti pasyvines konstrukcijas
   - Pažymėti biurokratines frazes
   - Pažymėti perteklinius žodžius
   - **Pažymėti DI rašysenos žymes** (triados, staccato, simetrija, ritmo monotonija - žr. DALIS 3)
4. **Trečioji peržiūra - terminų nuoseklumas**:
   - Reikšminių porų lentelė
   - Patikrinti, ar tas pats konceptas turi vieną terminą
5. **Pasiūlymai**:
   - Sugrupuoti pagal klaidų tipą
   - Kiekvienam - vieta, klaidingas variantas, taisyklingas variantas, priežastis
6. **Taisymas**:
   - Jei vartotojas paprašė taisyti tiesiogiai - naudoti Edit tool, vienas taisymas vienu metu
   - Nekeisti turinio prasmės, tik kalbą ir struktūrą
7. **Galutinė peržiūra**:
   - Perskaityti visą tekstą iš naujo
   - Įsitikinti, kad ritmas natūralus

# Rezultato formatas

Po patikros pateikti:

## 📋 Suvestinė

- **Failų peržiūrėta**: N
- **Failų taisyta**: M
- **Klaidų rasta**: K (pagal tipą)

## 🔤 Gramatikos klaidos

```
[Failas: path/to/file.md, eil. X]
**[Klaidos tipas]**
Rasta: „[klaidingas variantas]"
Turi būti: „[teisingas variantas]"
Priežastis: [trumpas paaiškinimas]
```

## 📖 Skaitomumo pataisymai

```
[Failas: path/to/file.md, eil. X]
**[Pataisymo tipas: per ilgas sakinys / pasyvas / biurokratinė frazė / pertekliniai žodžiai / ...]**
Buvo: „[originalus tekstas]"
Pakeista į: „[patobulintas tekstas]"
Priežastis: [trumpas paaiškinimas]
```

## 🤖 DI rašysenos žymės

```
[Failas: path/to/file.md, eil. X]
**[Žymės tipas: triada / staccato / antitezės formulė / būdvardžių virtinė / ritmo monotonija / ...]**
Buvo: „[originalus tekstas]"
Pakeista į: „[natūralesnis tekstas]"
Priežastis: [kuri DI žymė ir kaip išardyta]
```

## 📊 Skaitomumo metrika (jei prašoma)

- Vidutinis sakinio ilgis: X žodžių
- Ilgiausias sakinys: Y žodžių
- Pasyvinių konstrukcijų: Z
- Biurokratinių frazių: W
- Pasikartojančių žodžių per pastraipą: U

## 🎯 Bendras vertinimas

Trumpa pastaba (1-2 sakiniai) apie bendrą teksto kokybę: stipriosios pusės ir likusi tobulinimo erdvė.

## ⚠️ Abejotini žodžiai - vartotojo sprendimas

**PRIVALOMA sekcija.** Po visų taisymų pateikti **PILNĄ sąrašą** žodžių/frazių, kurie yra abejotini ir gali būti taisomi, BET nėra akivaizdi klaida. Vartotojas turi turėti galimybę pažiūrėti visą sąrašą ir pasakyti, kuriuos taisom, kuriuos ne.

Į šį sąrašą įtraukti:

1. **Anglicizmai su apostrofa** - setup'as, stack'as, workshop'ai, deadline'as, draft'ai, add-on'ai, track'ą, case study, hands-on, self-service, onboarding, lead enrichment, ir pan.
2. **Sulietuvinti angliški veiksmažodžiai** - implementuoti, deployinti, scrapinti, optimizuoti (kontekste, kai yra LT atitikmuo)
3. **Tarptautiniai terminai su LT alternatyva** - infrastruktūra (vs aplinka), implementacija (vs diegimas), generavimas (vs kūrimas), konfigūracija (vs nustatymai), kompetencija (vs įgūdis), produktyvumas (vs našumas)
4. **Verslo žargonas** - power user, anchor person, governance, retro, pilot, scope, flow
5. **Apostrofuoti tikriniai pavadinimai** - jei vartojami su apostrofa (Claude'as, Outlook'as) - paklausti, ar palikti

**Formatas - LENTELĖ su trim stulpeliais:**

| # | Žodis/frazė tekste | Galimas LT atitikmuo | Eil. nr. |
|---|---|---|---|
| 1 | setup'as | konfigūracija, sąranka | 17 |
| 2 | workshop'ai | praktiniai užsiėmimai, praktikumai | 33 |
| 3 | onboarding | įvedimas, įsiliejimas | 31 |
| 4 | hands-on | praktinis | 31 |
| 5 | track'ą | kryptį, kelią | 64 |
| 6 | deadline'as | galutinis terminas | 70 |

**Pabaigoje paklausti:** "Kuriuos iš šių žodžių pakeičiame? Pasakyk numerius (pvz. 1, 3, 5) arba 'visus' / 'nei vieno'."

NIEKADA savarankiškai netaisyti abejotinų žodžių - tik atskirti aiškias klaidas (taisom) nuo abejotinų (klausiam vartotojo).
