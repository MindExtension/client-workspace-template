# Šakos ir sujungimas

> ŠABLONAS. Diegdami klientui: įrašykite tikrus žmones, jų GitHub vardus ir šakas, nurodykite, kas
> sujungia į `main`, ir ištrinkite šitą pastabą. Lentelės stulpelių tvarkos nekeiskite: ją skaito
> `git-paprastai` būsenos skriptas.

Atnaujinta: [UŽPILDYTI data].

Šitas failas yra vienintelė vieta, kur surašyta, kas kurioje šakoje dirba ir kaip darbas patenka į
bendrą versiją. DI agentas jį skaito kiekvienos sesijos pradžioje ir prieš kiekvieną git veiksmą.

## Kas kurioje šakoje

| Žmogus | GitHub vardas | Asmeninė šaka | Ką daro su baze |
|---|---|---|---|
| [Vardas Pavardė] | [github-vardas] | `vardas` | Pildo savo sritį, atiduoda per PR |
| [Peržiūrėtojas] | [github-vardas] | `vardas` | Peržiūri ir sujungia į `main` |

Sujungimo tvarka: asmeninė šaka, tada PR, tada `main`. Į `main` sujungia [UŽPILDYTI: peržiūrėtojas].

## Kaip darbas keliauja

```
  savo šaka (vardas)  --- atiduok (PR) --->  main (bendra priimta versija)
        ^                                         |
        +--------- pasiimk naujausią -------------+
```

1. Kiekvienas dirba tik savo šakoje. `main` niekas nekeičia tiesiogiai.
2. „Išsaugok“: pakeitimai įrašomi ir įkeliami į tavo šaką GitHub'e. Jie saugūs, bet kiti jų dar nemato bendroje versijoje.
3. „Atiduok“: iš tavo šakos atidaromas PR (prašymas sujungti) į `main`.
4. Peržiūrėtojas peržiūri ir sujungia. Tik tada pakeitimas yra bendroje versijoje.
5. Visi kiti „pasiima naujausią“: `main` įsilieja į jų šakas.

Sujungiama įprastu sujungimu (`gh pr merge --merge`), ne suspaudimu: asmeninės šakos gyvena ilgai,
o suspaustas sujungimas kitą kartą parodytų tuos pačius pakeitimus iš naujo.

## Kada šaka ne asmeninė

Trumpam darbui galima atskira temos šaka `vardas-tema-YYYYMMDD` (pvz. mokymo pratimui ar dideliam
pakeitimui, kurį norima atiduoti atskirai). Ji kuriama iš naujausio `origin/main` ir po sujungimo
nebenaudojama. Įrašyti jos į lentelę nereikia: skriptas rodo ją pagal pirmą vardo dalį.

## Kur žymimos užduotys

[UŽPILDYTI: pvz. `komanda/nariai/<vardas>/uzduotys.md`. Čia jas žymi `atlikta` įgūdis.]

## Naujas žmogus

1. Bazės savininkas pakviečia jį į GitHub saugyklą.
2. Agentas įrašo eilutę į lentelę aukščiau ir sukuria šaką iš `origin/main`.
3. Pakeitimas atiduodamas per PR, kaip ir bet kuris kitas.
