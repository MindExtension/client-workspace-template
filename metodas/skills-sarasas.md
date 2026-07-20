# Įgūdžių (skills) sąrašas

> ŠABLONAS. Diegdami klientui: palikite lentelėje tik tuos įgūdžius, kurie realiai įdiegti
> kliento bazės `.claude/skills/` aplanke, ir ištrinkite šitą pastabą.

Įgūdis (skill) yra agentui iš anksto įrašyta instrukcija: aprašai, ką ir kaip daryti, o agentas tą
pakartoja vienodai kiekvieną kartą. Kas yra įgūdžiai ir kaip susikurti savo, žr. [[skills-pavyzdys]].

Šitie įgūdžiai gyvena šitoje bazėje, aplanke `.claude/skills/`. Jie veikia automatiškai, kai atsidarai
Claude Code šitame repo. Nieko papildomo diegti nereikia. Užtenka paprašyti agento paprastais žodžiais,
jis pats parenka tinkamą įgūdį pagal tavo prašymą.

> Kalba: viskas veikia lietuviškai. Prašyti gali lietuviškai, agentas atsakys ir dokumentuos lietuviškai.

## Kas paruošta

| Įgūdis | Ką daro | Kaip paprašyti |
|---|---|---|
| **dienos-ataskaita** | Paruošia trumpą dienos būsenos suvestinę iš leidžiamų skaityti (read-only) šaltinių ir įrašo į bazę. | „paleisk dienos ataskaitą", „padaryk būsenos suvestinę" |
| **lt-verslo-teise** | Lietuvos ir ES verslo teisės konsultantas: analizuoja sutartis ir dokumentus, susiranda teisės aktus (e-tar.lt, EUR-Lex) ir teismų praktiką. Tik skaito ir analizuoja. | „išanalizuok šitą sutartį pagal lt-verslo-teise", „kokios rizikos šitame dokumente" |
| **prezentacijos** | Kuria verslo prezentacijas kaip HTML skaidres, atvaizduoja į PDF. Pats parenka vizualus pagal turinį ir laikosi firminio stiliaus. | „padaryk prezentaciją", „sukurk skaidres pasiūlymui" |
| **wispr-dict-trainer** | Treniruoja tavo Wispr Flow diktavimo žodyną: suranda pagal kontekstą iškraipytus žodžius (angliški terminai lietuviškoje kalboje) ir po patvirtinimo suveda į žodyną. Vyksta tavo kompiuteryje su tavo Wispr programa. | „patobulink mano Wispr žodyną", „paskanuok balso istoriją dėl klaidų" |
| **cleanup-workspace** | Išvalo užterštą kontekstą bazėje po pakeitimų (sujungtas PR, pervadinta rolė, pasikeitę skaičiai): seka pakeitimo bangą, taiso nuorodas, žymi nebeaktualu. Trina tik po patvirtinimo. | „išvalyk kontekstą", „sutvarkyk bazę po šito pakeitimo" |
| **refine** | Iteracinio tobulinimo ciklas bet kokiam darbui (prezentacijai, dokumentui, analizei): išskaido į vienetus, tobulina iš kelių perspektyvų, patikrina, kartoja. | „iteruok ir pagerink", „pereik viską ir pagerink" |
| **git-paprastai** | Paverčia paprastą lietuvišką prašymą į saugius git veiksmus: pasiimti naujausią versiją, išsaugoti ir atiduoti darbą, pasiimti kolegos šaką, atidaryti Pull Request. Dirba tik tavo šakoje, main neliečia. | „pasiimk naujausią", „atiduok mano darbą", „pasiimk iš kolegos šakos" |
| **tiesos-linteris** | Bazės sveikatos patikra: gaudo prieštaravimus tarp failų, pasenusius faktus, duplikatus ir DI taršą, siūlo taisymus kaip juodraštinį Pull Request. Main neliečia. | „patikrink bazės konsistenciją", „išvalyk bazę", „tiesos auditas" |
| **atlikta** | Užbaigtumo ritualas: kai baigei užduotį, prieš uždarant logiškai patikrina, kas realiai padaryta, ir vienodai užfiksuoja tavo `komanda/nariai/<vardas>/uzduotys.md` lentoje su data. | „pažymėk atlikta", „baigiau užduotį" |
| **lt-gramatika** | Patikrina lietuviško teksto gramatiką, skyrybą ir skaitomumą, išvalo DI rašysenos žymes, pasiūlo aiškesnį tekstą. Naudinga prieš siunčiant laišką ar dokumentą. | „patikrink gramatiką", „sutvarkyk šitą tekstą", „ar taisyklingas laiškas" |

## Kaip tai naudoti šitame repo

1. Atsidarai Claude Code šitame aplanke (repo šaknyje).
2. Paprašai agento paprastais žodžiais (žr. lentelės „Kaip paprašyti" stulpelį).
3. Agentas parenka tinkamą įgūdį ir jį įvykdo pagal savo taisykles.

Įgūdžiai keliauja kartu su repo (yra `.claude/skills/`), todėl kai patrauki (clone) ar atnaujini
(pull) bazę, gauni ir naujausius įgūdžius. Nauji įgūdžiai atsiranda čia, kai juos pridedam kartu su
mentoriumi.

## Saugumas galioja visiems įgūdžiams

- Įgūdžiai **skaito ir dokumentuoja**, į išorines sistemas be žmogaus patvirtinimo nerašo.
- Bet koks rašymas už bazės ribų (pvz. wispr-dict-trainer įrašo į tavo Wispr žodyną) turi **žmogaus
  patvirtinimą**, kaip reikalauja `.claude/CLAUDE.md`.
- Raktai ir slaptažodžiai į įrašus niekada neina.

## Susiję

- [[skills-pavyzdys]] - kaip veikia įgūdžiai ir kaip susikurti savo
- [[kaip-dirbam-su-baze]]
- [[di-saugumo-taisykles]]
