# <Klientas> saugyklos taisyklės agentams

> ŠABLONAS. Diegiant pakeisk `<Klientas>` ir ištrink šitą pastabą.

Ši saugykla yra klientui matoma darbo erdvė. Jei kyla neaiškumų, nieko nekelk:

- Dirbk tik su <Klientas> turiniu. Neskaityk ir neimportuok kitų klientų ar gretimų saugyklų duomenų.
- Niekada nekurk šioje saugykloje ir į Git nekelk tiekėjo HQ korespondencijos,
  pilnų laiškų ar pašto metaduomenų, vidinių pastabų, CRM ir pardavimų duomenų, kainodaros ar
  maržų, komandos užduočių, perdavimo dokumentų, agentų sesijų telemetrijos ar valdymo sistemos momentinių kopijų.
- Šioje saugykloje nekurk jokio tiekėjo ir kliento komunikacijos įrašo ar atsakymo juodraščio net
  kaip vietinio, laikino ar `gitignore` failo. Suvestinę ar siūlomą atsakymą rodyk tik sesijoje.
- Čia nelaikyk tiekėjo ir kliento susitikimo įrašo, pilno transkripto, protokolo ar iš jo išvestų
  tiekėjo vidinių užduočių. Kliento vidinis susitikimas be tiekėjo dalyvių nėra ši išimtis.
- Tiekėjo ir kliento komunikacijos žurnalas bei išsaugomi juodraščiai kuriami tik tiekėjo HQ
  kanoniniame kliento kelyje. Jei užduotis reikalauja failo, sustok ir perduok ją tęsti HQ.
- Į saugyklą gali patekti tik aiškiai <Klientas> darbui skirta ir įgalioto <Klientas> atstovo patvirtinta medžiaga.
- Prieš fiksuodamas ar siųsdamas Git pakeitimus peržiūrėk `git status --short`, `git diff` ir `git diff --cached`.
  Su `git add` įtrauk tik konkrečius patvirtintus kelius; nenaudok `git add -A`.
- Jei šaltinis, paskirtis ar leidimas neaiškūs, sustok ir klausk žmogaus. Nieko nesiųsk į Git.
