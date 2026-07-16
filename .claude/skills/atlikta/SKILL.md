---
name: atlikta
description: >
  Užbaigtumo ritualas komandos nariams. Kai narys sako, kad užduotį padarė, šitas skillas prieš
  uždarant DAR KARTĄ logiškai patikrina, kas realiai padaryta (kas pasikeitė šakoje, ar tai
  atitinka užduoties aprašą ir jos „kada atlikta" kriterijų, ar neliko abejotinų dalykų), tada
  vienodai užfiksuoja užduotį nario `komanda/nariai/<vardas>/uzduotys.md` faile: perkelia žymę
  iš `[ ]` į `[x]`, įrašo eilutę į „Atlikta" su šios dienos data ir trumpu aprašymu, susieja su
  commit'u ir pasiūlo atiduoti darbą per git-paprastai. Abejotinus dalykus iškelia, ne nutyli.
  Naudoti kai narys sako, kad kažką baigė, nori pažymėti atlikta arba uždaro pokalbį po darbo.
  Trigger: atlikta, pažymėk atlikta, baigiau, užbaigiau, padariau, patvirtinu kad padariau,
  užfiksuok užduotį, uždaryk užduotį, uždarom, pabaigiam, uždaryk pokalbį, finalizuok, /atlikta.
---

# Atlikta (užduoties užbaigimas su patikra)

Skirta komandos nariams. Tikslas: vienas ritualas, kad kiekviena užduotis gautų aiškų galą, o „atlikta" būtų žymima vienodai ir tik tada, kai darbas tikrai atrodo padarytas. Be šito vieni nariai žymi, kiti realiai dirba, bet nepažymi, ir būsena tampa nepatikima.

## Kaip veikia

1. **Nustatyk, kas narys.** `git branch --show-current` duoda šaką, ji yra nario vardas (pvz. `Vardas`). Nario aplankas `komanda/nariai/` viduje prasideda tuo pačiu vardu (pvz. šaka `Vardas` -> aplankas `vardas-pavarde`). Jei pagal vardą tinka daugiau nei vienas aplankas arba nė vienas, paklausk žmogaus, nespėk.
2. **Parodyk atviras užduotis.** Perskaityk to nario `uzduotys.md` ir išvardink visus atvirus `[ ]` punktus iš „Vykdoma / atviros užduotys" ir iš „Bendra programa (pamokos)". Sunumeruok.
3. **Paklausk, kurią patvirtina.** Narys pasako numerį ar kelis. Žymim TIK tai, ką jis aiškiai patvirtina, nieko nespėliojam.
4. **Patikrink prieš uždarydamas (logikos peržiūra).** Kiekvienai patvirtintai užduočiai, prieš dedant žymę:
   - Pasižiūrėk, kas realiai pasikeitė: `git status`, `git diff` ir `git log` nario šakoje. Jei darbas vyko šitame pačiame pokalbyje, remkis ir tuo, ką kartu darėte.
   - Palygink su užduoties aprašu: ar padaryta tai, kas parašyta, ar visos dalys. Jei užduotis ar pamoka turi skiltį „Kada atlikta", tikrink pagal ją.
   - Greitai patikrink pagrindus: ar nauji failai atsidaro ir turi turinį, ar `[[nuorodos]]` veda į egzistuojančius failus, ar faktai nesikerta su tiesos šaltiniu ([[sistemos]] ir kanoniniais failais), ar dokumentuose neliko darbinių šiukšlių (TODO žymos, sesijos pastabos, laikini failai).
   - Trumpai pasakyk nariui, ką patikrinai ir kas sueina: konkrečiai, ne bendrai.
5. **Abejotinus dalykus iškelk, ne nutylėk.** Jei kažkas pusiau padaryta, prieštarauja kitiems failams ar tiesiog kelia abejonę, išvardink aiškiai: čia gerai, čia gerai, o štai šitas atrodo abejotinai ir kodėl. Smulkų mechaninį dalyką (kabančią nuorodą, datą, žymę) pasiūlyk pataisyti iškart ir, nariui sutikus, pataisyk. Didesnio trūkumo neužglaistom: arba narys pabaigia dabar, arba užfiksuojat likutį kaip atskirą atvirą `[ ]` punktą jo `uzduotys.md`. Tokiu atveju pačios užduoties atlikta NEžymim.
6. **Užfiksuok kiekvieną patikrą praėjusią užduotį:**
   - Perkelk žymę `[ ]` -> `[x]` prie to punkto.
   - Į „Atlikta" skiltį pridėk eilutę formatu `- [YYYY-MM-DD] <trumpas ką padarė>`. Data yra šios dienos.
   - Jei žinai susijusį commit'ą (`git log`), pridėk trumpą nuorodą (pvz. „PR #7" arba commit tema).
7. **Pasiūlyk atiduoti.** Paklausk, ar atiduoti pakeitimą per [[git-paprastai]] („atiduok darbą"). Jei taip, jis užfiksuoja ir atiduoda peržiūrai. Ritualas baigiasi ne žyme, o atidavimu: kol darbas neatiduotas, komanda jo nemato.
8. **Pranešk paprastai:** ką patikrinai, ką pažymėjai atlikta, kas liko atvira.

## Taisyklės

- **Viena tiesos vieta:** užbaigimą žymim to paties nario `uzduotys.md` faile (žymė `[x]` + eilutė „Atlikta"), ne kur nors atskirai. Jokio trečio sąrašo.
- **Patikra yra pagalba, ne egzaminas.** Tonas draugiškas: tikslas, kad narys atiduotų darbą ramia galva, o ne jaustųsi tikrinamas.
- **Neuždaryk to, kas nepraeina patikros.** Geriau atviras punktas su aiškiu likučiu negu žymė ant pusiau padaryto darbo.
- **Datos formatas visada** `[YYYY-MM-DD]`, kad visų narių failai atrodytų vienodai.
- **Tik savo failą.** Narys žymi tik savo `komanda/nariai/<vardas>/uzduotys.md`. Kito nario užduočių nežymim.
- **Tik patvirtinta.** Nepažymim „atlikta" to, ko narys aiškiai nepatvirtino, net jei atrodo padaryta.
- **Neišgalvok.** Jei „Atlikta" eilutei trūksta detalės, paklausk nario vieno sakinio, ką padarė.

## Kodėl tai svarbu

Užduotys negali kauptis be galo. Kai kiekvienas baigimas pereina tą pačią patikrą ir užfiksuojamas vienodai, vadovas ir komanda mato tikrą būseną be klausinėjimo, commit'ai ir žymėjimas nustoja prasilenkti, o klaidos pagaunamos tada, kai jas pigiausia pataisyti: dar neatidavus darbo.

## Susiję

- [[uzduoties-uzdarymas]] (05 pamoka apie šį ritualą)
- [[git-paprastai]]
- [[komandos-uzduotys]]
- [[github]]
