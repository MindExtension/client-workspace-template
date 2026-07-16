---
name: wispr-dict-trainer
description: Treniruoja vartotojo Wispr Flow diktavimo žodyną iš jo paties transkripcijų istorijos. Skaito lokalią Wispr Flow SQLite bazę (jokio API, jokių raktų, iš kompiuterio išeina tik transkripcijų tekstas LLM analizei), paleidžia agentus, kurie pagal kontekstą randa neteisingai atpažintus žodžius (angliški terminai, iškraipyti į netaisyklingą lietuvių ar bet kurią kalbą), sudeda pasiūlymų sąrašą, ir tik po žmogaus patvirtinimo įrašo priimtus žodžius į Wispr Flow žodyno lentelę su atsargine kopija ir dry-run saugikliais. Naudoti, kai vartotojas nori pagerinti Wispr Flow tikslumą, sutvarkyti diktavimo žodyną, paskanuoti balso istoriją dėl klaidų arba pertreniruoti žodyną. Trigger: wispr žodynas, patobulink transkribavima, diktavimo klaidos, balso klaidos, wispr flow dictionary, dictation errors.
---

# Wispr Flow žodyno treniruoklis

Wispr Flow neturi viešo API, bet viskas guli lokalioje SQLite bazėje. Kelias priklauso nuo OS:

- **macOS:** `~/Library/Application Support/Wispr Flow/flow.sqlite`
- **Windows:** `%APPDATA%\Wispr Flow\flow.sqlite`
- **Linux:** `~/.config/Wispr Flow/flow.sqlite`

Lentelės:

- `History`: kiekvienas diktavimas su žaliu atpažinimo tekstu (`asrText`) ir sutvarkytu tekstu
  (`formattedText`), laiku, programa, atpažinta kalba.
- `Dictionary`: vartotojo žodynas. Čia įrašytos eilutės atrodo lygiai kaip pridėtos per programos
  sąsają (`manualEntry=1`, `source='manual'`) ir susisinchronizuoja su Wispr cloud kitą kartą
  paleidus programą.

Jokių raktų ar slaptažodžių nėra nė viename žingsnyje. Skaityti saugu ir kol programa veikia
(read-only prieiga), rašyti galima tik uždarius programą.

## Saugumo rėmai

- Tai vyksta **tavo kompiuteryje su tavo paties Wispr programa**, ne su įmonės sistemomis. Tai
  asmeninio produktyvumo įrankis, todėl neprieštarauja matomumo etapo taisyklei „į išorines
  sistemas nerašom".
- Įrašymas į žodyną yra rašymas už bazės aplanko ribų, todėl **privalomas žmogaus patvirtinimas**
  (4 žingsnis), lygiai kaip reikalauja `.claude/CLAUDE.md`.
- Į LLM analizę išeina tik transkripcijų tekstas. Jei diktavai kažką jautraus, atmesk tuos įrašus
  peržiūros metu.

## Ciklas

### 1. Eksportas (saugu bet kada)

```bash
python3 .claude/skills/wispr-dict-trainer/scripts/wispr_export.py \
  --out /tmp/wispr-scan --chunks 5 [--since YYYY-MM-DD] [--lang lt|all]
```

Numatyta kalba `lt` (ima lietuvių ir nenustatytos kalbos įrašus, tinka mišriai LT + EN kalbai).
`--lang all` ima viską. Eksportuoja transkripcijas į `chunk1..N.json`. `--since` skirtas
prieauginiam skanavimui (pvz. nuo paskutinės treniruotės).

### 2. Analizė (agentų išsklaidymas)

Paleisk po vieną agentą kiekvienam chunk'ui lygiagrečiai. Kiekvienas skaito savo chunk'ą ir randa
pagal kontekstą akivaizdžiai iškraipytus žodžius. Prompt'o esmė (kalbą ir sritį pritaikyk vartotojui):

- Vartotojas kalba lietuviškai su įterptais angliškais tech terminais, o atpažinimas juos iškraipo
  į fonetinius netaisyklingus žodžius (pvz. „biznis sentral" = Business Central, „četas" = chat,
  „paverbį" = Power BI, „komitas" = commit, „dešbordas" = dashboard).
- Neįtrauk: normalių šnekamosios kalbos žodžių, filerių, teisingai atpažintų terminų.
- Grąžink gryną JSON: `[{"wrong", "intended", "count", "evidence", "dict_suggestion"}]`. Suliejamas
  skirtingas linksniuotes į vieną įrašą.

### 3. Sujungimas ir pasiūlymai

Pašalink dublikatus per kanoninį terminą, susumuok skaičius, rikiuok pagal dažnį. Sudaryk
`proposals.json`: `[{"phrase": "...", "replacement": null}]`.

Įrašų tipai:

- Tik `phrase`: pakreipia atpažinimą link šio žodžio. Tinka kanoniniams angliškiems terminams ir
  produktų pavadinimams (Business Central, Power BI, SharePoint, Playwright).
- `phrase` + `replacement`: teksto pakeitimas po transkripcijos. Tik stabilioms sisteminėms
  klaidoms, rizikinga žodžiams, kurie kartais būna teisėti.

Nededame kiekvienos linksniuotės, dedame kanoninį terminą (atpažinimo kreipimas yra fonetinis).
Pirmą partiją apribok vertingiausiais įrašais (dažnis >= 2 arba aiškiai svarbus pavadinimas),
500 įrašų žodynas praskiedžia kreipimą.

### 4. Peržiūra (žmogaus vartai, privaloma)

Parodyk vartotojui surikiuotą pasiūlymų lentelę. **Niekada nerašyk be patvirtinimo.**

### 5. Įrašymas

```bash
python3 .claude/skills/wispr-dict-trainer/scripts/wispr_dict_apply.py proposals.json          # dry-run
python3 .claude/skills/wispr-dict-trainer/scripts/wispr_dict_apply.py proposals.json --apply  # įrašo
```

Skripte įmontuoti saugikliai: atsisako dirbti, kol Wispr Flow paleista, prieš rašydamas pasidaro
pilną DB kopiją į `backups-manual/`, praleidžia jau esančias frazes, be `--apply` veikia dry-run.

## Pastabos

- `History.editedText` retai užpildytas (vartotojai retai taiso vietoje), tad mokomės iš konteksto,
  ne iš taisymų.
- `averageLogProb` History eilutėse žymi žemo pasitikėjimo transkripcijas, jei nori prioretizuoti.
- Kartok periodiškai su `--since`, kad žodynas neatsiliktų.
- Platformų keliai ir procesų tikrinimas skriptuose sutvarkyti automatiškai (macOS ir Windows).

## Susiję

- Wispr Flow naudojimas ir efektyvumo rekomendacijos: `../../../diegimas/wispr-flow.md`
- Visų įgūdžių sąrašas: `../../../metodas/skills-sarasas.md`
