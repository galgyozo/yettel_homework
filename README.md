# yettel_homework

Yettel e-matrica vásárló házi feladat.

Generáltam a nem UI fájlokhoz dokumentációt.

Továbbá csináltam egy nagyon egyszerű kezdő képernyőt, hogy ne egyből az e-matrica vásárlásba zuhanjunk.

## Amit nem volt egyértelmű

Normál esetben minden design kérdést egyeztetnék a grafikussal, de ennek hiányában a szimmetria és az egységesség kedvéért felülírtam több helyen a döntést.

## Anomáliák

- Kicsit eltér a modules-ban és a designban használt betűk stílusa (pl. heading 4s w600 vs w700?) Országos matricák w600, vármegyei pedig 700, de a szimmetria kedvéért w600-at használtam. Body-nál w100 van megadva figmában, de nem úgy néz ki, ezt felülírtam a végeredmény kedvéért. Elképzelhető, hogy a betűtípus miatt, de nem tudtam az általatok használtat leszedni.
- A user adatokat mutató card paddingje hibásnak tűnik, a többivel egységesre hoztam.
- Screen padding bal oldalnál 17, jobb oldalnál 16 néhány helyen. 16-tal haladtam tovább.
- A sima year ára kicsit alacsony, azonnal megvenném :)
- Designban az “Ellenőrizd a megyéket..” warning info ikon nem is igazán felül nem is középen van, középre rendeztem.
- A rendszerhasználati díj nem tudom honnan jön, így most egy konstansba raktam. Ideális esetben ez is a backendről jönne.

## Amivel tovább fejleszteném több idővel

- Külön témázni a widgeteket ThemeData-ban
- UI-kitet létrehozni Storybook-kal
- Lehetne további kisebb widgetekre bontani a fájlokat
- Lokalizáció, jelenleg beégetett magyar nyelv van, de ez ugye nem életszerű. Lokalizációra .arb fájlokat nem hoztam létre, de éles projekt esetén természetesen kellene.
- Unit, widget és integrációs tesztek
- Lehetne adatot cachelni, hogy ne legyen akár másodpercenkénti api hívás gyakori oda-vissza navigálásnál
- Lehetne autó típus alapján eltérő kép (feladat is írja). Mivel csak személyautóra van asset és a backend is csak azt adja vissza, így nem tudom mikre kellene megvalósítani. De több helyen is van erre példa, amikor típustól eltérően implementálok pl. TextStyle-t. Itt is enum extensionnel oldanám meg első ránézésre.
- Lehetne egy globális progressTracker minden hívásra, ami automatikusan kezeli a loading / error dialog megjelenítését.
- Yettel ikon és név beállítása az alkalmazásnak
- Ha egy teljes alkalmazás lenne és kosár kezelést alkalmaznánk, akkor egy odaillő provider kezelné a kosár tartalmát, nem pedig screen paraméterként lennének továbbadva.
- API feleslegesen adja vissza a megrendelést, ha úgysem használjuk semmire, ami felesleges modelleket igényel frontenden.
- Megfelelő adminisztrálás és verziókezelés (commitokkal és branchekkel), de idő hiányában ezt kihagytam
- Összetett alkalmazás esetén kellene újrahasznosítható komponenseket gyártani (pl success screen)
- Térképen a megyék színezését megoldani. Manuálisan felhelyezve a megyéket könnyű lenne színezni, de a felhelyezés extrém időigényes lenne. Mindenképp érdekelne ti milyen megoldást használnátok rá.
