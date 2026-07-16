---
name: tiesos-linteris
description: Žinių bazės tiesos linteris. Automatiškai gaudo bazėje susikaupusią taršą, atsiradusią dirbant su DI, ir bazę sutraukia iki fundamentalių tiesų. Gaudo prieštaravimus tarp failų (rolės, skaičiai, sistemų būsena, datos), pasenusius ir neišplitusius pataisymus (istorinio redagavimo likučius, spėjimą šalia patvirtinto fakto), sistemų faktų duplikatus, kurie pažeidžia vienintelio šaltinio taisyklę (organizacija/sistemos.md), nepatvirtintus teiginius pateiktus kaip faktą, ir proceso ar harnesso teršimą (kaip mes dirbam komentarai, DI sesijos artefaktai, redagavimo istorijos pasakojimas, įsivėlę į turinio dokumentus). Kiekvieną radinį patikrina prie failo eilutės, auto-taiso tik tai, kuo tikras, dviprasmiškus tik raportuoja, ir pateikia švarinimo KANDIDATĄ kaip juodraštinį GitHub Pull Request, niekada nesuliedamas ir tiesiogiai neliesdamas main. Naudoti, kai prašoma išvalyti ar patikrinti žinių bazės konsistenciją, sutraukti dokumentaciją iki fundamentalių tiesų, arba kaip kasdienis (per /schedule ar cron) bazės sveikatos patikrinimas. Trigger: tiesos linteris, išvalyk bazę, patikrink konsistenciją, tiesos auditas, truth lint, nelogiškumai, duplikatai, pasenę faktai, harnesso teršimas, linink dokumentaciją iki tiesos.
---

# Tiesos linteris

## Kam skirta

Dirbant su DI, į žinių bazę įsivelia tarša: tas pats faktas pasakomas skirtingai keliose vietose,
pataisymas išplinta ne visur, sistemų faktai kartojami vietoj nuorodos, spėjimai virsta faktais, o
proceso ir sesijos komentarai lieka turinio dokumentuose. Šitas skilas tą taršą gaudo, patikrina
prie failo eilutės, ir pateikia švarų taisymo KANDIDATĄ kaip juodraštinį Pull Request. Tikslas
vienas: nuolat linink dokumentaciją iki fundamentalių tiesų, kad faktas būtų pasakytas tiesiai ir
vienoje vietoje, be aplinkinių aiškinimų.

## Kada naudoti

- Kai prašoma patikrinti bazės konsistenciją, išvalyti nelogiškumus, duplikatus ar pasenusius faktus.
- Kaip kasdienis sveikatos patikrinimas (dienos režimas tikrina tik nuo praeito karto pakeistus failus).
- Po didesnės sesijos, kur daug redagavimų, kad tarša nepatektų giliau į bazę.

## Griežti saugikliai (visada galioja)

- **Niekada nesulieja ir tiesiogiai neliečia main.** Taisymai eina tik į atskirą kandidato šaką ir
  juodraštinį PR. Sprendžia žmogus per PR peržiūrą.
- **Netrina unikalios informacijos.** Dedublikuoja tik keisdamas kartojimą į `[[sistemos]]` tipo
  nuorodą; taiso tik pasenusį faktą, kurį keičia patvirtintas autoritetingas šaltinis.
- **Kiekvienas taisymas cituoja įrodymą:** failas:eilutė, kas negerai, ir autoritetingas šaltinis.
- **Tik tai, kuo tikras.** Dviprasmiškus radinius (pvz. neaiški rolė, du galimi teisingi variantai)
  NEtaiso, o surašo į PR skiltį „reikia žmogaus sprendimo".
- Gerbti repo skaitymo etapą (`.claude/CLAUDE.md`). Jokių ilgų brūkšnių, teisingos LT raidės,
  absoliučios datos.

## Eiga

### 1. Apimtis

- Pilnas režimas: visa markdown bazė (organizacija/, integracijos/, observability/, procesai/,
  vaidmenys/, komanda/, saugumas/, metodas/, data/). Praleisti `_mokymai-personal/`,
  `silotech-programa/prezentacijos/_*` ir kitus laikinus/gitignore aplankus.
- Dienos režimas: tik nuo praeito karto pakeisti failai. Rasti juos:
  `git log --since="<praeito karto data>" --name-only --pretty=format: | sort -u`, arba nuo paskutinės
  `tiesos-linteris/*` šakos taško.

### 2. Aptik (lęšiai)

Perskaityti `references/tarsos-lensai.md` ir pereiti KIEKVIENĄ iš šešių taršos klasių: prieštaravimai,
pasenę pataisymai, duplikatai vs vienintelis šaltinis, nepatvirtinti teiginiai, harnesso/proceso
teršimas, aplinkiniai aiškinimai. Ten yra konkretūs paieškos šablonai ir repo kanoninės taisyklės.

Didelei bazei galima fan-out kelis TIK SKAITYMO agentus (po vieną lęšiui ar sričiai). Kiekvienas
grąžina konkrečius radinius su failas:eilutė, ne apibendrinimą.

### 3. Patikrink (privaloma)

Kiekvieną radinį adversarialiai patikrinti perskaitant tikras failo eilutes. Išmesti false positive
(pvz. failas jau turi nuorodą; „spėjimas" tikrai pažymėtas kaip spėjimas; kontekstas leidžia). Į
kandidatą patenka TIK patvirtinti radiniai. Šis žingsnis saugo, kad pats linteris neužterštų bazės
nepatikrintais teiginiais.

### 4. Klasifikuok ir taisyk

Pagal `references/svarinimo-taisykles.md`:
- **HIGH-confidence (auto-taisom kandidate):** aiškiai pasenusi reikšmė, kurią keičia patvirtintas
  šaltinis; pažodinis sistemų fakto duplikatas, keičiamas į `[[sistemos]]` nuorodą; nepatvirtintas
  skaičius, gaunantis „nepatvirtinta" žymeklį; aiškus proceso/sesijos likutis turinio doke.
- **AMBIGUOUS (tik raportuojam):** reikia žmogaus sprendimo. Netaisom, tik surašom.

Taisyti tik HIGH-confidence, redaguojant tikslias eilutes. Fundamentali tiesa: faktas vienoje vietoje,
tiesiai, kiti tik nurodo.

### 5. Pateik kandidatą (PR)

Naudoti `scripts/kandidatas.sh` (jis atsisako dirbti ant main ir niekada nesulieja):

```bash
bash .claude/skills/tiesos-linteris/scripts/kandidatas.sh "<trumpas aprašas>"
```

Skriptas: sukuria šaką `tiesos-linteris/YYYY-MM-DD` nuo naujausio main, sucommitina JAU pritaikytus
taisymus, pushina ir atidaro JUODRAŠTINĮ PR. PR aprašą sudaryti pagal `references/svarinimo-taisykles.md`
šabloną: kiekvienas pakeitimas su failas:eilutė ir įrodymu, plius atskira „reikia žmogaus" skiltis
dviprasmiškiems radiniams. Kandidato pritaikymo eiga: pirma pritaikyk HIGH-confidence taisymus darbo
medyje, tada leisk skriptą.

## Kasdienis paleidimas

Dienos režimą galima paleisti automatiškai: per `/schedule` (cloud agentas cron tvarkaraščiu) arba
lokaliu cron, kuris tikrina nuo praeito karto pakeistus failus ir atidaro dienos PR kandidatą. Kadangi
main niekada neliečiamas ir viskas eina per juodraštinį PR, kasdienis paleidimas saugus.

## Kompozicija

Platesniam vienkartiniam auditui yra bendras `repo-truth-audit` skilas. Šitas skilas orientuotas į
šitą bazę (jos kanonines taisykles) ir į PR kandidato generavimą, tad tinka kaip nuolatinis linteris,
o `repo-truth-audit` kaip gilus vienkartinis šlavimas.
