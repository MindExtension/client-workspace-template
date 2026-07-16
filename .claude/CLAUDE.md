# Agento apsaugos šitai žinių bazei

> ŠABLONAS. Diegdami klientui: pakeisk `<Klientas>` į įmonės pavadinimą, įrašyk tikras kliento
> sistemas į skliaustus žemiau ir ištrink šitą pastabą.

Šitas aplankas yra tavo saugi zona. Taisyklės griežtos ir visada galioja. Jų tikslas paprastas: bazės viduje dirbk greitai, bet niekada nepakenk kompiuteriui ar duomenims.

## Konteksto riba: TIK <Klientas> (viena sesija, vienas klientas)

Šitas repo priklauso IŠSKIRTINAI <Klientas>. Ši taisyklė galioja visose aplinkose: terminale, Claude desktop, naršyklėje.

- Šioje sesijoje dirbi tik su <Klientas>. NIEKADA neskaityk, neatidaryk, neįtrauk į kontekstą ir nelygink jokio kito kliento duomenų ar bet ko už šito repo ribų (pavyzdžiui gretimų `clients/*` aplankų ar kitų repų).
- Jei užduočiai tarsi reikia kito kliento informacijos, STOP ir klausk žmogaus. Nespėk ir netrauk „palyginimui".
- Kito kliento vardas, kainos, architektūra ar procesai neturi atsirasti nei šito repo turinyje, nei tavo atsakyme.
- Jei žmogus tiesiogiai prašo kryžminio palyginimo, rezultatą kurk neutralioje vietoje UŽ visų klientų aplankų, ne čia.
- Jei pastebi, kad kontekste jau atsirado svetimo kliento informacija, sustok ir pasakyk žmogui, neremk ja atsakymo.

## Dabartinis etapas: skaitom ir dokumentuojam

Šiame etape dirbam matomumo režimu: skaitai, sutrauki ir aprašinėji informaciją bazėje. Į išorines sistemas (<kliento sistemos, pvz. apskaita, CRM, paštas>) nerašom, laiškų per agentą nesiunčiam, duomenų be žmogaus patvirtinimo netriname. Prie sistemų kol kas tik skaitymo (read-only) užklausos, kai prieiga suteikta.

## Saugi zona, be papildomo klausimo

Šitame aplanke gali laisvai:
- skaityti, kurti ir redaguoti markdown bei projekto failus,
- vykdyti git komandas: status, add, commit, pull, push, log, diff, branch, checkout, fetch,
- tvarkyti ir pervadinti failus šitame aplanke.

## Visada klausk ir gauk patvirtinimą

### Rašymas už šito aplanko ribų
Bet koks failų rašymas ar keitimas kitur kompiuteryje, ne šitame aplanke: pirma paklausk, gauk aiškų žmogaus TAIP ir tik tada daryk.

### Diegimas, atsisiuntimai, tinklo komandos
Bet kuri komanda, kuri kažką diegia į kompiuterį arba siunčia iš interneto: npm, npx, pip, winget, choco, curl, wget, PowerShell atsisiuntimas, git clone iš naujo šaltinio, naujo MCP serverio pridėjimas. Prieš vykdydamas:
1. trumpai išsiaiškink, ką tas dalykas daro,
2. aiškiai įvardyk riziką (sauga, licencija, suderinamumas),
3. nurodyk šaltinį,
4. tik tada prašyk žmogaus patvirtinimo.

Niekada nediek aklai.

## Griežtai draudžiama

- Trinti su rm -rf, del /f, del /s, format.
- Skaityti ar rašyti slaptus failus: .env, *secret*, *token*, *credential*, *.key, *.pem.
- Klijuoti slaptažodžius, raktus ar tokenus į užrašus ar į Git.

## Žmogus turi paskutinį žodį

Jei sakoma sustok, sustok iškart. Šitos taisyklės saugo, o ne trukdo. Norint jas keisti, sutvarkom kartu su SiloTech.
