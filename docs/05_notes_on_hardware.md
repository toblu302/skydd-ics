# Några kommentarer om hårdvara och hårdvarukrav

Detta kapitel beskriver kort några av de förutsättningar som krävs för att kunna använda de paketerade
funktionerna och att sätta upp servrar.

En av tankarna är att man skall kunna installera programmen på såväl gamla utrangerad utrustning som på
nyinköpt och för ändamålet avsedd hårdvara. Det skall fungera lika bra att kunna bygga en budgetlösning
med sina gamla datorer som att inskaffa nya servrar.

## Hårdvaruarkitektur

För de hårdvaruarkitekturer vi stödjer (Intel, AMD) så finns det ett antal grundläggande hårdvarukrav rörande prestanda, storlek, mm. framtagna. Dessa egenskaper, miniminivåer samt rekommenderade nivåer finns  närmare beskrivna i detta dokument.

Som regel så har den hårdvara som varit målmiljö i detta projekt varit en Intelbaserad dator av PC-typ av modernt snitt. Mer om detta nedan där arkitekturkrav finns närmare beskrivna.

## Fysisk eller virtuell hårdvara
Programvarudistributionen har installerats och testats på både virtuell och fysisk hårdvara. Så både fysisk och logiska installationer har verifierats fungera.

Detta sagt, så gäller det för många av de paket och funktioner levereras i detta installationspaket att flera av funktionerna, till exempel nätverksinspelningsfunktion, fungerar bäst på fysisk hårdvara då de kräver åtkomst till Ethernet-portar på ett sådant sätt som kan vara problematiskt i en virtuell miljö.

Andra av funktionerna och uppsättningarna av programvarudistributionen, såsom enkel loggserver, fungerar lika bra på virtuell som fysisk hårdvara.

## 32- och 64-bitars hårdvara

Intel har haft 64-bitarsversioner av sina CPUer sedan i början av 2000 (2003 närmare bestämt). Likaså så finns det 32-bitars och 64-bitarsversioner av det operativsystem, [Linux](http://www.linux.org/), som vi har valt att använda i projektet. Modern hård- och mjukvara är bättre anpassad till att använda 64-bitarsersionerna. Vi har också valt att dra en gräns för hur gammal hårdvara vi kan supportera.
**Därför har vi valt att bara skapa 64-bitarsversioner av de programpaket som vi tagit fram**

## Primärminnesutrymme

De paketerade systemen kräver 1GB RAM-minne för att fungera. Mer minne är dock att rekommendera, gärna 4 eller 8GB.

## Lagringsutrymme
Det går att installera systemet på så små diskar som 20GB men då de flesta system bygger på
att samla in data är det rekommenderat att ha betydligt mycket mer i lagringsutrymme. Det faktiska
storleken beror på hur mycket data som det är tänkt att samla in i de olika systemen.

## CD och DVD eller USB-masslagring
Det går att används såväl DVD och USB-minnen för att skapa en installationsdisk. Denna installationsdisk används sedan för att installera
systemet på en hårddisk för permanent användning av programvaran. För installation på en virtuell dator så går det bra att använda 
ISO-filen direkt i det virtualiseringsprogram som används.

## Nätverksanslutning

Alla komponenterna (loggserver, IDS-server, larmserver, nätverksinspelningsserver, brandvägg) kräver 
nätverksanslutningar för att vara användbara i verkliga scenarion, då de oftast har ett behov 
av att inhämta trafik eller få saker skickats till sig via nätverket.

De tester som gjorts har utförts med virtuell och fysisk hårdvara där Ethernetkort har används!

Tester har gjorts mot Ethernetkopplingar med 10- och 100Mbit anslutningar.

\clearpage
