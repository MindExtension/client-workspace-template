# Lietuvos teisės šaltiniai ir paieškos instrukcijos

## 1. Teisės aktų registras (TAR) - e-tar.lt

**Oficialus šaltinis** galiojančioms teisės aktų redakcijoms. Čia skelbiami visi Lietuvos teisės aktai nuo 2014 m. sausio 1 d.

### Paieška
- Teisės aktų paieška: `https://www.e-tar.lt/portal/lt/legalActSearch`
- Naujausių aktų sąrašas: `https://e-tar.lt/portal/lt/newLegalActs`
- Anglų kalba: `https://www.e-tar.lt/portal/en/index`

### WebSearch paieška
```
site:e-tar.lt [ieškomas įstatymas ar tema]
```
Pvz.: `site:e-tar.lt darbo kodeksas`, `site:e-tar.lt asmens duomenų apsauga`

### Atviri duomenys (API)
- Dataset: `https://data.gov.lt/datasets/2613/`
- API endpoint: `https://get.data.gov.lt/datasets/gov/lrsk/teises_aktai/Dokumentas`
- Du modeliai: **Dokumentas** (teisės aktai) ir **Summaries** (suvestinės redakcijos)
- Laukai: identifikacinis kodas, pavadinimas, priėmimo data, įsigaliojimo data, galiojimo statusas

### Aprėptis
- LR Konstitucija ir konstituciniai įstatymai
- Įstatymai
- Seimo nutarimai
- Tarptautinės sutartys
- Prezidento dekretai
- Vyriausybės nutarimai
- Ministrų norminiai aktai
- Savivaldybių teisės aktai

## 2. Seimo teisės aktų bazė - e-seimas.lrs.lt

**Patogi navigacija** ir istorinės redakcijos. Naudinga lygiagretė paieška su e-tar.lt.

### Paieška
- Paprasta paieška: `https://e-seimas.lrs.lt/portal/simpleSearch/lt`
- Išplėstinė paieška: `https://e-seimas.lrs.lt/portal/legalActSearch/lt`

### Tiesioginiai URL
Formatas: `https://e-seimas.lrs.lt/portal/legalAct/lt/TAD/TAIS.[numeris]`

Pagrindiniai TAIS numeriai:

| Teisės aktas | TAIS numeris |
|---|---|
| Civilinis kodeksas | TAIS.245495 |
| Darbo kodeksas | TAIS.191770 |
| Akcinių bendrovių įstatymas | TAIS.3418 |
| Mažųjų bendrijų įstatymas | TAIS.422965 |
| Individualių įmonių įstatymas | TAIS.4277 |
| PVM įstatymas | TAIS.73689 |
| GPM įstatymas | TAIS.71153 |
| Pelno mokesčio įstatymas | TAIS.73657 |
| Mokesčių administravimo įstatymas | TAIS.73600 |
| Asmens duomenų teisinės apsaugos įstatymas | TAIS.71505 |
| Autorių teisių įstatymas | TAIS.28607 |
| Prekių ženklų įstatymas | TAIS.10364 |
| Vartotojų teisių apsaugos įstatymas | TAIS.2891 |
| Konkurencijos įstatymas | TAIS.5765 |
| Viešųjų pirkimų įstatymas | TAIS.4348 |
| Kibernetinio saugumo įstatymas | TAIS.459486 |
| Elektroninio parašo įstatymas | TAIS.161648 |
| Elektroninės prekybos įstatymas | TAIS.176595 |
| Bankroto įstatymas (Nemokumo) | TAIS.394216 |
| Pinigų plovimo prevencijos įstatymas | TAIS.6695 |

### WebSearch paieška
```
site:e-seimas.lrs.lt [ieškomas įstatymas]
```

## 3. Teismų praktika

### LITEKO - Viešų sprendimų paieška
- Detali paieška: `https://liteko.teismai.lt/viesasprendimupaieska/detalipaieska.aspx?detali=2`
- Filtravimas pagal teismą: `?detali=2&tid=[teismo_id]`
- Individualus sprendimas: `https://liteko.teismai.lt/viesasprendimupaieska/paieska.aspx?card_id=[UUID]`

**Paieškos galimybės:**
- Pagal bylos numerį
- Pagal raktažodžius
- Pagal teisės akto straipsnį
- Pagal teismo pavadinimą
- Pagal datų intervalą

**WebSearch:** `site:liteko.teismai.lt [tema arba straipsnis]`

**Svarbu:** LITEKO neturi REST API - tai ASP.NET sistema su server-side form postback. Programinė prieiga reikalauja web scraping arba oficialios prieigos per Nacionalinę teismų administraciją.

### eteismai.lt - Naujesnis teismų portalas
- Paieška: `https://eteismai.lt/paieska`
- WebSearch: `site:eteismai.lt [tema]`

### Lietuvos Aukščiausiasis Teismas (LAT)
- Teismų praktika: `https://www.lat.lt/veikla/teismu-praktika/59`
- LAT specifinė praktika: `https://www.lat.lt/veikla/teismu-praktika/lat-praktika/60`
- WebSearch: `site:lat.lt [tema]`

**LAT apžvalgos** - publikuojamos reguliarios teismų praktikos apžvalgos pagal teisės sritis (civilinė, baudžiamoji). Naudingos norint suprasti bendrą teismų poziciją.

### Lietuvos vyriausiasis administracinis teismas (LVAT)
- Teismų praktika: `https://lvat.lt/veikla/teismu-praktika/204`
- WebSearch: `site:lvat.lt [tema]`

### Lietuvos Respublikos Konstitucinis Teismas
- `https://www.lrkt.lt/`
- Nutarimai: `https://www.lrkt.lt/lt/teismo-aktai/nutarimai/1`

## 4. ES teisės šaltiniai

### EUR-Lex
- `https://eur-lex.europa.eu/`
- WebSearch: `site:eur-lex.europa.eu [reglamento pavadinimas]`

### Svarbiausi ES teisės aktai verslui
| Aktas | Numeris |
|---|---|
| BDAR (GDPR) | Reglamentas 2016/679 |
| NIS2 direktyva | Direktyva 2022/2555 |
| DI aktas (AI Act) | Reglamentas 2024/1689 |
| DSA (Skaitmeninių paslaugų aktas) | Reglamentas 2022/2065 |
| DMA (Skaitmeninių rinkų aktas) | Reglamentas 2022/1925 |
| eIDAS | Reglamentas 910/2014 |

## 5. Kiti naudingi šaltiniai

### Institucijų svetainės
- **VMI** (mokesčiai): `https://www.vmi.lt/`
- **Sodra** (socialinis draudimas): `https://www.sodra.lt/`
- **VDAI** (duomenų apsauga): `https://vdai.lrv.lt/`
- **Konkurencijos taryba**: `https://kt.gov.lt/`
- **Registrų centras**: `https://www.registrucentras.lt/`
- **VPT** (viešieji pirkimai): `https://vpt.lrv.lt/`
- **Valstybinė darbo inspekcija (VDI)**: `https://www.vdi.lt/`

### Paieškos strategija
1. Pradėti nuo WebSearch su `site:` operatoriumi konkrečiam šaltiniui
2. Jei neranda - plati WebSearch be site: apribojimo
3. Jei reikia tikslaus straipsnio teksto - WebFetch konkrečiam e-tar.lt arba e-seimas.lrs.lt URL
4. Teismų praktikai - LITEKO ir eteismai.lt, papildomai LAT/LVAT apžvalgos
5. Visada patikrinti, ar teisės aktas dar galioja (nėra netekęs galios)
