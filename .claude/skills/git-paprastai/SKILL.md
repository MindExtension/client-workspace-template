---
name: git-paprastai
description: >
  Paverčia natūralią lietuvišką kalbą į saugius git veiksmus, kad netechniniai
  komandos nariai dirbtų su baze nežinodami git terminų. Narys sako paprastai: „pasiimk
  naujausią", „atsinaujink", „atiduok darbą", „išsaugok", „pasiimk iš kolegos šakos", „pradėk
  naują darbą", „kur aš esu", „ką pakeičiau", „atiduok per Pull Request", o skillas atlieka
  fetch, merge, commit, push ir Pull Request už jį, tik jo asmeninėje šakoje, niekada
  neliesdamas main tiesiogiai. Naudoti kiekvieną kartą, kai narys nori pasiimti naujausią
  bazės versiją, išsaugoti ar atiduoti savo darbą, pasiimti kito nario darbą, ar pasitikrinti
  būseną. Trigger: pasiimk naujausią, atsinaujink, patrauk, atiduok darbą, išsaugok darbą,
  užfiksuok, pasiimk iš šakos, pasiimk kito darbą, pradėk naują darbą, kur aš esu, ką pakeičiau,
  kokia būsena, git, pull, push, commit, pull request, sujunk, atiduok į bazę.
---

# Git paprastai (be git terminų)

Skirta netechniniams komandos nariams. Jie kalba natūraliai, tu atlieki git. Tavo darbas: teisingai atpažinti ketinimą, saugiai įvykdyti ir paprastais žodžiais pranešti, kas įvyko. Git terminais neaiškink, jei žmogus pats nepaprašo.

## Nario žodynas (ką jie sako -> ką reiškia)

| Narys sako | Ketinimas |
|---|---|
| „pasiimk naujausią", „atsinaujink", „patrauk" | Į mano šaką parsitraukti naujausią bendrą versiją |
| „atiduok darbą", „išsaugok", „užfiksuok", „atiduok per Pull Request" | Išsaugoti mano pakeitimus ir atiduoti peržiūrai |
| „pasiimk iš kolegos šakos", „pasiimk kolegos darbą" | Į mano šaką parsitraukti kito nario darbą |
| „pradėk naują darbą" | Įsitikinti, kad esu savo šakoje ir viskas naujausia |
| „kur aš esu", „ką pakeičiau", „kokia būsena" | Parodyti būseną paprastais žodžiais |

Prieš bet ką pasitikrink, kurioje šakoje narys yra: `git branch --show-current`. Nario asmeninė šaka yra jo vardas (pvz. `Vardas`). Jei jis netyčia ne savo šakoje ar `main`, pasakyk tai ir pasiūlyk grįžti į savo šaką, nedaryk pakeitimų svetimoje vietoje.

## Ką darau kiekvienam ketinimui

**Atsinaujink / pasiimk naujausią**
1. Įsitikink, kad narys savo asmeninėje šakoje.
2. `git fetch origin`
3. `git merge origin/main`
4. Jei kyla konfliktas, žr. „Saugikliai".
5. Pranešk: „Pasiėmiau naujausią, tavo šakoje viskas atnaujinta."

**Atiduok darbą / išsaugok**
1. `git status`, pasižiūrėk, kas pakeista, ir trumpai pasakyk nariui.
2. `git add -A`
3. `git commit -m "[TYPE]: aiškus lietuviškas paaiškinimas"` (TYPE: ADD, UPDATE, FIX, REMOVE; jokių ilgų brūkšnių žinutėje).
4. `git push origin <jo-šaka>`
5. Atidaryk arba nurodyk Pull Request į `main` (`gh pr create` arba pateik nuorodą). Peržiūrėtojas patvirtina ir sujungia.
6. Pranešk paprastai ir pasiūlyk tą užduotį pažymėti atlikta jo `komanda/nariai/<vardas>/uzduotys.md` faile.

**Pasiimk iš kito nario šakos**
1. `git fetch origin`
2. `git merge origin/<Vardas>` į jo šaką.
3. Konfliktas, žr. „Saugikliai".
4. Pranešk, kas atkeliavo iš to nario.

**Pradėk naują darbą**
- Įsitikink, kad narys savo šakoje, tada `git fetch origin` ir `git merge origin/main`. Švaru ir naujausia, galima dirbti.

**Kur aš esu / ką pakeičiau**
- `git branch --show-current` ir `git status`. Paaiškink paprastai: kurioje šakoje, kas pakeista, kas dar neišsaugota.

## Saugikliai (privaloma)

- Visada dirbk tik nario ASMENINĖJE šakoje (jo vardas). Niekada necommitink ir nepushink tiesiai į `main`.
- Atidavimas visada baigiasi Pull Request į `main`, ne tiesioginiu sujungimu. `main` sujungia tik peržiūrėtojas.
- Niekada nevykdyk: `push --force`, `reset --hard`, jau atiduoto darbo `rebase`, šakų trynimo, `checkout .` be klausimo. Tai gali negrįžtamai sunaikinti darbą.
- Prieš bet ką, kas gali prarasti pakeitimus, parodyk paprastais žodžiais, kas nutiks, ir gauk aiškų TAIP.
- Konfliktų nespręsk aklai. Paaiškink „du žmonės keitė tą pačią vietą", pasiūlyk pasižiūrėti kartu arba kviesk atsakingą žmogų.
- Slaptažodžiai ir raktai niekada neina į git. Žr. [[di-saugumo-taisykles]].
- Patikrink, ar nustatytas git vardas ir darbo paštas. Jei ne, pasiūlyk nustatyti pagal [[github]].

## Kaip pranešu

Trumpai, paprastai, be git žargono. Pasakyk, kas įvyko ir kas toliau. Pavyzdžiui: „Išsaugojau tavo darbą ir atidaviau peržiūrai. Kai peržiūrėtojas patvirtins, atsiras bendroje bazėje."

## Susiję

- [[github]]
- [[di-saugumo-taisykles]]
- [[kaip-dirbam-su-baze]]
