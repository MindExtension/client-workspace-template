# Švarinimo taisyklės ir PR šablonas

Kaip kiekvieną patvirtintą radinį paversti taisymu, ir kada NEtaisyti. Pamatinis principas: sutrauk
dokumentaciją iki fundamentalios tiesos. Faktas gyvena vienoje vietoje, pasakytas tiesiai; kiti tik
nurodo. Netrink unikalios informacijos.

## HIGH-confidence: taisom kandidate

| Taršos klasė | Taisymas | Sąlyga |
|---|---|---|
| Prieštaravimas (pasenusi reikšmė) | Pakeisti pasenusią reikšmę autoritetinga | Yra įvardytas autoritetingas šaltinis, kuris aiškiai keičia (pvz. GD patvirtinta 160 keičia spėjimą 140) |
| Neišplitęs pataisymas | Suvienodinti su jau patvirtinta versija | Patvirtinta versija egzistuoja kitame faile su šaltiniu |
| Sistemų fakto duplikatas | Pakeisti kartojimą į `[[sistemos]]` (ar tinkamą kanoninį) nuorodą, palikti vieną sakinį kontekstui | Faktas pilnai gyvena kanoniniame faile |
| Nepatvirtintas skaičius/teiginys | Pridėti aiškų žymeklį, pvz. `(nepatvirtinta, tikslintina)` prie teiginio | Teiginys pateiktas kaip faktas be šaltinio |
| Proceso/harnesso likutis fakto doke | Pašalinti iš fakto doko arba perkelti į proceso doką | Aiškiai proceso ar sesijos artefaktas, ne organizacijos faktas |
| Akivaizdus aplinkinis aiškinimas | Perrašyti į vieną tiesioginę teiginio eilutę | Prasmė nekinta, tik forma trumpėja |

Taisyti tik tikslias eilutes. Nekeisti prasmės, skaičių reikšmės (nebent tai ir yra pasenusios reikšmės
taisymas su šaltiniu), datų ar dokumento paskirties.

## AMBIGUOUS: NEtaisom, tik raportuojam

Į „reikia žmogaus sprendimo" skiltį, ne į diff:
- Neaiški rolė ar būsena, kur nė vienas variantas nėra autoritetingas (pvz. Kristinos titulas, kai
  vienas failas sako „(tikslinti)", kitas įvardija rolę, o suvestinė mini atšaukimą).
- Du galimi teisingi variantai be aiškaus šaltinio.
- Faktas, kurio patvirtinti neįmanoma iš bazės (reikia žmogaus ar išorės, kurios NEnaudojam).
- Bet kas, kur taisymas galėtų ištrinti prasmę.

Auksinė taisyklė: jei abejoji, ar tai HIGH-confidence, tai AMBIGUOUS. Linteris verčiau per atsargus
nei užteršia bazę savo spėjimu.

## PR aprašo šablonas

Kandidato PR (juodraštinis) aprašas:

```
# Tiesos linteris, kandidatas YYYY-MM-DD

Automatinis švarinimas iki fundamentalių tiesų. NESULIETI be peržiūros.
Apimtis: <pilna bazė | dienos diff nuo YYYY-MM-DD>. Radinių: <n taisyta>, <m raportuota>.

## Pritaikyti taisymai (HIGH-confidence)

1. [klasė] failas:eilutė
   - Buvo: "<senas tekstas>"
   - Tapo: "<naujas tekstas>"
   - Įrodymas / šaltinis: <kanoninis failas:eilutė arba autoritetingas šaltinis>

2. ...

## Reikia žmogaus sprendimo (netaisyta)

- [klasė] failas:eilutė: <kas neaišku, kokie variantai, kodėl linteris nesprendė>

## Kaip peržiūrėti

Kiekvieną taisymą tikrink prie įrodymo. Jei kuris neteisingas, komentuok PR, netaisyk main tiesiai.
```

## Commit žinutė

Formatas kaip repo: `[LINT]: <trumpas aprašas> (tiesos-linteris YYYY-MM-DD)`. Jokių ilgų brūkšnių.

## Ką NIEKADA nedaryti

- Nesulieti PR ir tiesiogiai neliesti main.
- Netrinti unikalaus fakto (dedublikacija yra nuorodos įdėjimas, ne informacijos šalinimas).
- Netaisyti dviprasmiško radinio spėjant.
- Nedaryti išorinių paieškų faktui patikrinti; patikra tik iš pačios bazės.
