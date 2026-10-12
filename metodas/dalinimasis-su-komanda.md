# Kaip mano darbas pasiekia kolegą

Nereikia mokėti Git komandų. Prašyk agento paprastais žodžiais ir paprašyk parodyti rezultatą.
Kas kurioje šakoje dirba ir kas priima darbą: [sakos-ir-sujungimas.md](sakos-ir-sujungimas.md).

## Ką perduodame

Perduodame išsaugotas darbo taisykles, įgūdžius, failų vietų aprašus ir nuasmenintus šablonus.
Šie failai yra agento nurodymai, kaip dirbti. Kontekstas yra informacija, kurią agentas perskaito
konkrečiai užduočiai. Vien failo buvimas nereiškia, kad agentas jį jau perskaitė.

Pokalbis, prisijungimai ir kompiuteryje įdiegtos programos su failais nekeliauja. Asmens dokumentai
ir tikri darbuotojų ar klientų duomenys lieka savo sistemose (žr. [kas-kur-gyvena.md](kas-kur-gyvena.md)).

## Keturi žingsniai

| Žingsnis | Kas vyksta | Kaip žinau, kad baigta |
|---|---|---|
| 1. Užrašau | Agentas darbo taisyklę įrašo mano kopijos faile | Matau kelią ir perskaitau pakeitimą |
| 2. Perduodu | Pakeitimai įkeliami į mano šaką ir pateikiami peržiūrai | Turiu PR nuorodą ir žinau, kas peržiūrės |
| 3. Priimame | Peržiūrėtojas peržiūri ir sujungia į bendrą versiją | Prašymas pažymėtas „Merged“ (sujungta) |
| 4. Pasiimame | Kolega atnaujina savo kopiją, agentas perskaito failą | Jo kompiuteryje matomas ir panaudotas tas pats pakeitimas |

Git saugo failų pakeitimų istoriją. GitHub yra vieta, kur dalijamės. Asmeninė šaka yra mano atskira
darbo versija. `main` yra priimta bendra versija. PR („Pull Request“) yra prašymas peržiūrėti
pakeitimus prieš juos priimant.

**„Įkelta“ nėra „priimta“. „Priimta“ nėra „kolega jau pasiėmė“.**

## Ką pasakyti agentui

Pradedant:
> Pasiimk naujausią bendrą versiją į mano šaką. Pirma patikrink, ar turiu neišsaugoto darbo.
> Jo neperrašyk. Pasakyk, kas naujo atkeliavo.

Kai suradome gerą darbo būdą:
> Užsirašyk, kaip tai padarėme, kad kitame pokalbyje nereikėtų aiškinti iš naujo.
> Įrašyk tik darbo taisyklę, be asmens duomenų. Parodyk, kuriame faile ją išsaugojai.

Pabaigus:
> Atiduok šį darbą peržiūrai. Parodyk pakeistus failus ir prašymo nuorodą.
> Pasakyk, ar jis jau priimtas, ir kas jį peržiūrės.

Priimant:
> Parodyk šio prašymo pakeitimus paprastai: ką jie duos komandai ir ar yra neaiškių vietų.
> Dar nieko nejunk.

Po priėmimo, naujame pokalbyje:
> Pasiimk naujausią. Perskaityk [konkretaus failo kelias] ir parodyk, kurią naują taisyklę
> taikysi mano užduočiai.

## Kas priima

Peržiūrėtojas ir sujungiantis įrašyti [sakos-ir-sujungimas.md](sakos-ir-sujungimas.md). Mokymo
pratime juo būna mentorius arba jo paskirtas dalyvis, turintis teisę sujungti pakeitimus. Jei
peržiūrėtojas nepaskirtas, darbas dar neperduotas iki galo: paprašome jį paskirti.

Jei prašymas laukia, tikriname tą patį prašymą ir kreipiamės į peržiūrėtoją. Antro tokio pat
prašymo nekuriame. Agentas nesiunčia žinutės žmogui be atskiro leidimo.

## Kai kažkas neaišku

- **Nėra teisių:** paprašome pagalbos, kito žmogaus prisijungimų nekopijuojame.
- **Du žmonės pakeitė tą pačią vietą:** agentas parodo abu variantus. Sprendžiame kartu, o kol
  neaišku, nesujungiame. Tai nėra prarastas darbas.
- **Pakeitimo nematau:** patikriname, ar prašymas sujungtas, ar atnaujinta mano šaka, ar agentas
  skaito tinkamą failą. Vien atnaujinti GitHub puslapį neužtenka.
- **Agentas sako „negaliu“:** prašome įvardyti konkrečią klaidą ir patikrinti jau turimus skaitymo
  būdus. Nieko papildomai nediegiame vien dėl spėjimo.
- **Norime sustoti:** „Išsaugok mano darbą mano šakoje ir parodyk, kur sustojome.“

Praktika: [vienos taisyklės perdavimas](dalinimosi-pratimas.md).
