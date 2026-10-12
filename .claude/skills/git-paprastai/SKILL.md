---
name: git-paprastai
description: >
  Paverčia natūralią lietuvišką kalbą į saugius git veiksmus, kad netechniniai komandos nariai
  dirbtų su baze nežinodami git terminų. Pirma perskaito šakų žemėlapį (kas kurioje šakoje, kas
  sujungia į main), tada be perteklinių klausimų atlieka fetch, merge, commit, push ir Pull Request
  nario asmeninėje šakoje, peržiūrėtojui padeda priimti ir sujungti PR, o būseną įrodo, ne spėja.
  Naudoti kiekvieną kartą, kai narys nori pasiimti naujausią versiją, išsaugoti ar atiduoti darbą,
  pasiimti kolegos darbą, peržiūrėti ar sujungti PR, sužinoti, ką kiti įkėlė, ar užrašyti naują
  darbo taisyklę į bazę. Trigger: pasiimk naujausią, atsinaujink, patrauk, išsaugok, užfiksuok,
  atiduok darbą, atiduok per Pull Request, pasiimk iš kolegos šakos, pradėk naują darbą, kur aš
  esu, ką pakeičiau, kokia būsena, kas naujo, ką kiti įkėlė, priimk, sujunk, peržiūrėk PR,
  užsirašyk kaip tai padarėme, git, pull, push, commit, merge, pull request, šaka.
---

# Git paprastai (be git terminų)

Skirta netechniniams komandos nariams. Jie kalba natūraliai, tu atlieki git. Tavo darbas: atpažinti
ketinimą, saugiai įvykdyti ir paprastais žodžiais pranešti, kas įvyko. Git terminais neaiškink, jei
žmogus pats nepaprašo.

## 1. Pirma žemėlapis ir būsena

Kiekvieno git ketinimo pradžioje paleisk būsenos skriptą:

```bash
bash .claude/skills/git-paprastai/scripts/sakos-busena.sh
```

Jis atnaujina GitHub šakų kopijas (darbo failų neliečia) ir parodo: kurioje šakoje esi ir kieno ji,
ar yra neišsaugotų failų, ar `main` turi naujų pakeitimų, kurių šakoje nėra, kas ką įkėlė į kitas
šakas ir kurie PR laukia peržiūros. Ta pati suvestinė automatiškai rodoma sesijos pradžioje
(kabliukas `.claude/settings.json`), bet kiti gali būti ką tik įkėlę, todėl prieš veiksmą paleisk iš naujo.

Kas kurioje šakoje dirba ir kas sujungia į `main`, parašyta `metodas/sakos-ir-sujungimas.md`.
Tai vienintelis tos informacijos šaltinis:

- Žmogų atpažink pagal šaką ir žemėlapį. Jei šakos ar žmogaus žemėlapyje nėra, pasakyk tai ir
  pasiūlyk įrašyti. Tapatybės nespėk.
- Peržiūrėtoją ir sujungiantį imk iš žemėlapio. Jei jis neįrašytas, darbas negali būti priimtas iki
  galo: paprašyk jį paskirti.
- Pasikeitus žmonėms ar šakoms, žemėlapį atnaujink tame pačiame atidavime.

## 2. Kada darau, kada klausiu

Netechniniam žmogui kiekvienas klausimas yra kliūtis. Saugius veiksmus darau iš karto ir tik pranešu:

| Darau be klausimo | Klausiu vienu klausimu su mano rekomendacija |
|---|---|
| būsena, `fetch`, `log`, `diff`, PR peržiūra | sujungti PR į `main` |
| `main` įliejimas į savo šaką, kai nėra neišsaugoto darbo ir konflikto | konfliktas: kurį variantą palikti |
| šio darbo failų išsaugojimas (`add` konkrečiais keliais, `commit`) | failai, kurių nežinau, ar jie šio darbo |
| `push` į nario šaką, PR sukūrimas ar atnaujinimas | bet kas, kas gali prarasti darbą |
| asmeninės šakos sukūrimas iš `origin/main` | darbas svetimoje šakoje ar tiesiai `main` |

Jei narys jau aiškiai pasakė, ką daryti („atiduok ir sujunk“), antrą kartą neklausk.

## 3. Nario žodynas

| Narys sako | Ketinimas |
|---|---|
| „kur aš esu“, „ką pakeičiau“, „kokia būsena“ | Parodyti būseną paprastais žodžiais |
| „kas naujo“, „ką kiti įkėlė“ | Parodyti, kas pasikeitė GitHub'e nuo paskutinio karto |
| „pasiimk naujausią“, „atsinaujink“, „patrauk“, „pradėk naują darbą“ | Įlieti naujausią `main` į mano šaką |
| „išsaugok“, „užfiksuok“ | Įrašyti mano pakeitimus ir įkelti į mano šaką GitHub'e |
| „atiduok darbą“, „atiduok per Pull Request“ | Išsaugoti ir atidaryti PR į `main` |
| „pasiimk iš kolegos šakos“ | Įlieti kito nario šaką į mano šaką |
| „peržiūrėk PR“, „priimk“, „sujunk“ | Peržiūrėtojui: parodyti PR ir sujungti į `main` |
| „užsirašyk, kaip tai padarėme“ | Įrašyti pakartojamą darbo taisyklę į bazę ir ją atiduoti |

## 4. Ką darau kiekvienam ketinimui

Prieš viską: nario šaka yra jo asmeninė šaka iš žemėlapio. Jei jis `main` ar svetimoje šakoje,
pasakyk tai ir perjunk į jo šaką (`git switch <šaka>`), jei joje nėra neišsaugoto darbo. Jei jo šakos
dar nėra: `git fetch origin` ir `git switch -c <šaka> origin/main`.

**Kur aš esu / kas naujo**
- Paleisk būsenos skriptą ir paaiškink paprastai: kurioje šakoje, kas neišsaugota, kas naujo `main`,
  kas laukia peržiūros. Kas naujo nuo paskutinio karto: `git log --oneline HEAD..origin/main` ir
  kitų šakų paskutiniai pakeitimai iš skripto.

**Atsinaujink / pasiimk naujausią / pradėk naują darbą**
1. Patikrink `git status --short`. Neišsaugoto darbo neperrašyk ir automatiškai neslėpk (`stash`).
   Jei jo yra, pirma išsaugok jį konkrečiais keliais savo šakoje („Išsaugok“ eiga).
2. `git fetch origin`, tada `git merge origin/main`.
3. Konfliktas: žr. „Saugikliai“.
4. Patikrink `git merge-base --is-ancestor origin/main HEAD`. Tik sėkmės atveju sakyk, kad bendra
   versija jau šakoje, ir parodyk, kokie failai atkeliavo (`git diff --stat ORIG_HEAD HEAD`).

**Išsaugok / užfiksuok**
1. `git status --short`. Iš sąrašo atsirink tik šio darbo failus ir trumpai juos įvardyk.
2. `git add -- <konkretūs keliai>`. `git add -A`, `git add .` nenaudok.
3. Peržiūrėk `git diff --cached --name-only` ir `git diff --cached`. Netikėtas failas, slaptažodis,
   kito kliento ar tiekėjo HQ medžiaga reiškia STOP: išimk jį (`git restore --staged <kelias>`) ir pasakyk.
4. `git commit -m "[TYPE]: aiškus lietuviškas paaiškinimas"`. TYPE: ADD, UPDATE, FIX, REMOVE,
   RESTRUCTURE. Jokių ilgų brūkšnių žinutėje.
5. `git push origin <nario-šaka>` (pirmą kartą su `-u`).
6. Pranešk: darbas saugus GitHub'e nario šakoje, bet bendroje versijoje jo dar nėra.

**Atiduok darbą**
1. Jei yra neišsaugotų šio darbo pakeitimų, atlik „Išsaugok“.
2. Patikrink, ar šakai jau yra atviras PR: `gh pr list --head <šaka> --state open`. Jei yra, naujo
   nekurk: naujas išsaugojimas jau jame. Įvertink visą PR, ne vien paskutinį pakeitimą, ir jei
   pavadinimas nebeatitinka turinio, atnaujink jį (`gh pr edit`).
3. Jei PR nėra: `gh pr create --base main --head <šaka>` su aiškiu lietuvišku pavadinimu ir
   2 iki 4 eilučių aprašu: kas pakeista ir kam to reikia. Jei `gh` neveikia, pateik nuorodą
   `https://github.com/<savininkas>/<repo>/compare/main...<šaka>`.
4. Pasakyk, kas peržiūrės (iš žemėlapio). PR pateikimas nėra sujungimas.
5. Pasiūlyk užduotį pažymėti atlikta per `atlikta` įgūdį.

**Pasiimk iš kolegos šakos**
1. Paaiškink vienu sakiniu: kolegos šakoje gali būti dar nepriimtų pakeitimų. Jei reikia tik
   patvirtintos versijos, užtenka „Atsinaujink“.
2. Jei narys vis tiek nori: patikrink neišsaugotą darbą, `git fetch origin`, `git merge origin/<kolegos-šaka>`.
3. Pranešk, kas atkeliavo ir iš ko.

**Peržiūrėk ir sujunk (tik peržiūrėtojui pagal žemėlapį)**
1. `gh pr view <nr>` ir `gh pr diff <nr> --name-only`. Papasakok paprastai: ką PR keičia, kam tai duos
   naudos, ar yra netikėtų failų, slaptažodžių ar kitų klientų medžiagos.
2. Patikrink, ar PR sujungiamas be konflikto (`gh pr view <nr> --json mergeable`). Jei ne, pasiūlyk
   autoriui „pasiimti naujausią“ savo šakoje ir atiduoti dar kartą.
3. Sujunk tik aiškiai paprašytą konkretų PR: `gh pr merge <nr> --merge`. Ne suspaudimu (`--squash`),
   nes asmeninės šakos gyvena ilgai.
4. Po sujungimo `git fetch origin` ir pranešk: pakeitimas bendroje versijoje, kiti jį gaus, kai
   „pasiims naujausią“.

**Užsirašyk, kaip tai padarėme (bazės plėtra)**
1. Suformuluok pakartojamą darbo taisyklę be asmens duomenų ir be vienkartinių detalių.
2. Įrašyk į tinkamą vietą: įgūdžio taisyklė į `.claude/skills/<įgūdis>/SKILL.md`, darbo tvarka į
   `metodas/`, šablonas į `sablonai/`. Agento saugumo taisyklės (`.claude/CLAUDE.md`) keičiamos tik
   kartu su bazės savininku.
3. Parodyk skirtumą, tada „Atiduok darbą“. Taisyklė galioja visiems tik po sujungimo į `main`.
4. DI klaidą paversk patikrinama taisykle, ne pažadu „daugiau nebeklysiu“.

## 5. Būseną įrodome

Kiekvienas teiginys apie būseną turi įrodymą:

- **Mano kompiuteryje:** pakeitimas dar tik vietinis (`git status` arba neįkeltų išsaugojimų skaičius).
- **Mano šakoje GitHub'e:** `git push` pavyko, skriptas nerodo neįkeltų išsaugojimų.
- **Perduota peržiūrai:** yra PR nuoroda ir žinomas peržiūrėtojas. Nesakyk „komanda jau turi“.
- **Bendroje versijoje:** PR būsena „Merged“ ir naujas `origin/main`.
- **Kolegos kompiuteryje:** tai patvirtinama tik jo sesijoje: jis pasiima naujausią, agentas perskaito
  konkretų failą ir parodo paskutinio jo pakeitimo numerį (`git log -1 --format=%h -- <kelias>`).
  Kito žmogaus kompiuterio būsenos iš savo sesijos nepatvirtink.

„Įkelta“ nėra „priimta“. „Priimta“ nėra „kolega jau pasiėmė“.

Jei šakoje yra nesusijusių nebaigtų pakeitimų, mažo atskiro darbo iš jos neatiduok. Išsaugok esamą darbą
ir pasiūlyk temos šaką `vardas-tema-YYYYMMDD` iš `origin/main`.

## 6. Saugikliai (privaloma)

- Dirbk tik nario asmeninėje ar jo temos šakoje. Niekada necommitink ir nepushink tiesiai į `main`,
  nebent bazės savininkas tai aiškiai liepia konkrečiam pakeitimui.
- Niekada nevykdyk: `push --force`, `reset --hard`, `clean`, jau atiduoto darbo `rebase`, šakų trynimo,
  `checkout .` ar `restore .`. Tai gali negrįžtamai sunaikinti darbą.
- Prieš bet ką, kas gali prarasti pakeitimus, parodyk paprastais žodžiais, kas nutiks, ir gauk aiškų TAIP.
- Konfliktų nespręsk aklai. Paaiškink: „du žmonės keitė tą pačią vietą“, parodyk abu variantus ir
  pasiūlyk, kurį palikti. Kol neaišku, nesujunk. Jei reikia nutraukti: `git merge --abort` grąžina,
  kas buvo prieš bandymą.
- Slaptažodžiai, raktai ir prisijungimai niekada neina į git. Žr. `.claude/CLAUDE.md`.
- Viename atidavime tik vienos temos ir vieno kliento medžiaga.
- Patikrink `git config user.name` ir `user.email`. Jei nenustatyti, pasiūlyk nustatyti darbo vardu ir paštu.

## 7. Kaip pranešu

Trumpai, paprastai, be git žargono: kas įvyko, kur dabar darbas, kas toliau. Pavyzdžiui:
„Išsaugojau tavo darbą ir atidaviau peržiūrai (PR #12). Peržiūrės Jonas. Kai sujungs, atsiras bendroje
versijoje.“

## Susiję

- `metodas/sakos-ir-sujungimas.md`: kas kurioje šakoje ir kas sujungia
- `metodas/dalinimasis-su-komanda.md`: paaiškinimas žmogui, kaip darbas pasiekia kolegą
- `metodas/dalinimosi-pratimas.md`: praktika
- `atlikta` įgūdis: užduoties užbaigimas
- `.claude/CLAUDE.md`: saugumo taisyklės
