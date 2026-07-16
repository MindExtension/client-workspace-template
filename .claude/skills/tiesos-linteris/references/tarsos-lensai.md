# Taršos lęšiai (ką gaudo tiesos linteris)

Pereiti KIEKVIENĄ klasę. Kiekvienam radiniui fiksuoti failas:eilutė, tikslų tekstą, ir kodėl tai
tarša. Pavyzdžiai anonimizuoti iš tikrų žinių bazių auditų, tad tinka kaip kalibravimas.

## Repo kanoninės taisyklės (pamatas visiems lęšiams)

- **Vienintelis sistemų šaltinis:** `organizacija/sistemos.md` laiko visų sistemų ir integracijų
  faktus (aprašas, prieigos būsena, architektūra, API, read-only apimtis). Kiti failai jų NEKARTOJA,
  tik deda `[[sistemos]]` nuorodą. Gilus setup gyvena `integracijos/*.md` (jiems detalė leidžiama).
- **Valstybės sistemų kanoninis sąrašas** (VMI i.SAF, i.VAZ, SAF-T, Sodra EDAS, Intrastat, GPAIS)
  apibrėžtas TIK `sistemos.md`; kiti nurodo į jį.
- **Autoritetingi skaičiai** ateina iš įvardyto kliento šaltinio (pvz. generalinis direktorius). Jie
  keičia ankstesnius spėjimus. Kur spėjimas ir patvirtintas skaičius sugyvena, spėjimas yra tarša.
- Absoliučios datos, teisingos LT raidės, jokių ilgų brūkšnių.

## 1. Prieštaravimai (tas pats faktas skirtingai)

Tas pats objektas apibūdinamas nesutampančiai dviejose vietose. Ypač tikrinti:
- Žmonių rolės ir rangai. Pvz. `komanda.md` sako narė „buhalterė", o `vaidmenys/finansu-vadovas.md`
  ir `org-medis.md` sako „Vyriausioji finansininkė / Vadovas". Vienas žmogus, du skirtingi rangai.
- Skaičiai. Pvz. apžvalgos failas sako „apie 140 darbuotojų", o `etatai.md` sako „160 (patvirtinta)".
  Keli skirtingi skaičiai bazėje apie tą patį dalyką.
- Sistemų būsena (prijungta vs laukiam), datos, pavadinimai, padalinių struktūra.

Paieška: grep tų pačių tikrinių (vardai, sistemos, skaičiai) per visą bazę ir lyginti reikšmes.
Radus, nurodyti KELIAS konfliktuojančias vietas ir kuri iš jų autoritetinga.

## 2. Pasenę pataisymai ir istorinio redagavimo likučiai

Faktas buvo pataisytas, bet taisymas išplito ne visur, arba doke liko pasakojimas apie patį taisymą.
Signalai (grep): `klaidingai buvo`, `pataisyta`, `pataisytas ankstesnis netikslumas`, `pripažintas
faktas`, `anksčiau ... klaidingai`, `nebeaktualu`, `senas`, `TODO pataisyti`. Taip pat spėjimas šalia
patvirtinto (`~140` vs `160`). Pvz. dienos ataskaita sako „narė klaidingai buvo priskirta prie
eilinio buhalterio", bet `komanda.md` vis dar rodo seną rolę, tai neišplitęs taisymas.

Skirti: dokumentuotas evoliucijos įrašas su data (leistina istorija) vs tas pats faktas dviejose
vietose skirtingai (tarša).

## 3. Duplikatai vs vienintelis šaltinis

Sistemų ar valstybės sistemų faktai perrašyti kitame faile vietoj `[[sistemos]]` nuorodos. Signalai:
- Ta pati techninė detalė (versijos, serveriai, tenant ID, scopes, auth būdas) keliose vietose. Pvz.
  apskaitos sistemos architektūra (versija, serveris, auth būdas) ir `sistemos.md`, ir
  `integracijos/<sistema>.md`; tas pats tenant ID keliuose failuose.
- Valstybės sistemų aprašai (kas yra i.SAF, i.VAZ ir t.t.) perrašyti rolių/departamentų failuose.

Niuansas: `integracijos/*.md` yra teisinga vieta giliam setupui. Jei detalė kartojasi TARP `sistemos.md`
ir integracijos failo, taisytina pusė paprastai yra `sistemos.md` (turi likti santrauka + nuoroda).
Jei rolės/departamento failas kartoja sistemos faktą, jį keisti į `[[sistemos]]` nuorodą.

## 4. Nepatvirtinti teiginiai kaip faktas

Konkretus faktas pateiktas be šaltinio arba su prielaidos žodžiu, bet skaitomas kaip tiesa. Signalai:
`tikėtina`, `greičiausiai`, `galbūt`, `panašu`, `apie` prie svarbaus skaičiaus, `[užpildyti]`,
`[patikslinti]`, `TODO`, `dar nepatikslinta`, `preliminaru`, `tikslintina`. Pvz. svarbus procentas ir
iš jo paskaičiuota suma, paskaičiuoti iš lentelių, kurių laikotarpis pačiame faile „tikėtina"; arba
struktūros žemėlapis „tikėtina apima ...". Skaičius, kuris keliauja toliau kaip faktas, o pamatas
spėjamas, yra rizika.

Taisymo kryptis (4 skyrius svarinimo-taisyklese): pridėti aiškų „nepatvirtinta" žymeklį prie teiginio,
ne trinti informaciją.

## 5. Harnesso ir proceso teršimas (svarbu dirbant su DI)

Į turinio (fakto) dokumentus įsivėlę komentarai apie tai, KAIP dirbam, DI sesijos artefaktai ar
redagavimo istorija. Tai priklauso proceso dokams (`metodas/`, `komanda/`, dienos ataskaitoms), ne
kanoniniam faktui. Signalai: `šioje sesijoje`, `šie pakeitimai dar neįrašyti`, `laukia patvirtinimo`,
`per šį pokalbį`, `paprašiau DI`, `agentas`, `promptas`, `Claude`, `commit`, `PR`, redagavimo dienoraštis
faktų dokumento viduryje. Pvz. kanoninio doko viduryje sakinys „šie pakeitimai (8 failai) dar neįrašyti
į git" yra proceso būsena, ne organizacijos faktas.

Taisymo kryptis: perkelti į proceso doką arba pašalinti iš fakto doko, palikti tik gryną faktą.

## 6. Aplinkiniai aiškinimai (ne fundamentali tiesa)

Faktas paaiškinamas per aplinkui, per istoriją ar per pateisinimą, o ne pasakomas tiesiai. Signalai:
ilgas įvadas prieš pasakant faktą, `dėl to, kad ... galima daryti prielaidą, jog`, pasikartojantis
konteksto atpasakojimas, faktas paslėptas sakinio gale. Tikslas: viena aiški teiginio eilutė, kurią
agentas gali pacituoti be papildomo aiškinimo.

Šis lęšis subtiliausias, tad HIGH-confidence taisymui tinka tik akivaizdūs atvejai; kitus raportuoti.
