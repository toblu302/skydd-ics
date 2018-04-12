# Sammanfattning

Dokumentationen beskriver ett projekt som Svenska kraftnät bedrivit som en del i beredskapshöjande 
åtgärder inom svenska elsektorn. Projektet har tagit fram ett antal IT-säkerhetskomponenter anpassade för
användning elbolag i Sverige i deras SCADA- och industriella kontrollsystemsmiljöer. Komponenterna
är tänkta att fungera som byggklossar för att skapa en nivå av grundskydd.

Projektets leverabler skall vara alla elbolag till gagn. Det skall vara lätt att komma igång,
genom att det finns svensk dokumentation och att installationen har automatiserats och förenklats. 
Det skall gå att komma igång och använda även om man inte har någon stor budget, då det går att
starta med att återanvända någon avställd dator. Det skall vara enkelt att använda, så vi har
byggt eller integrerat olika grafiska användargränssnitt till de olika funktionerna, samt att
all dokumentation finns on-line i de installerade servrarna.

Den här dokumentationen är både projektdokumentation men än viktigare en fungerande bruksanvinsning.
Texten beskriver hur det går att hämta, installera och använda ett eller
fler av de verktyg som skapats för att tillhandahålla ett antal grundläggande säkerhetsfunktioner
anpassat för ICS/SCADA-miljöer. De säkerhetsfunktioner som tillhandahålls i programform är:

* loggserver
* larmserver
* nätverksanalysnod
* intrångsdetekteringssystem

Vidare finns det även dokumentation som beskriver andra säkerhetsfunktioner som inte
tillhandahålls i den här paketeringen. En sådan funktion är en brandvägg, [pfsense], 
baserad på öppen källkod.

Huvuddelen av arbetet har gått till att bygga och säkra upp ett antal existerande program av
öppen källkod. Vi har valt de senaste versionerna av programmen, lagt till säkerhetsprofiler 
och gjort testning av funktionerna. De utvalda programpaketen har i sin tur lags in på den 
senaste versionen av operativsystemet CenOS för att få en stabil grundplatta. Denna 
grundpaketering har sedan varit utgångspunkt för att bygga en egen installations-fil, 
från vilket logg/larm/nätanalys- och intrångsdetekteringsservrar kan installeras 
och sättas upp på ett enkelt sätt.

Vart och ett av funktionerna och verktygen finns närmare beskrivna i var sitt kapitel i dokumentet. 
I dessa kapitel beskrivs vilken funktionalitet som erbjuds, hur installation av verktygen utförs, 
hur verktygen används, med mera.

I kapitlet [Några kommentarer om hårdvara och hårdvarukrav] beskriver i närmare detalj kraven
som finns på den hårdvaran som kan användas där verktygen kan installeras. Den hårdvara som har
använts är standardkomponenter, såkallad [COTS]-utrustning, i form av PC-servers, PC-nätverkskort, etc.

I kapitlet [Licensiering och tillgång till programvaran] beskriver licenser för programvarornas 
användande/nyttjande och möjlighet till ändringar, för de olika modulerna som använts. Många av
licenserna är så kallade öppna licenser som tillåter att vem som helst har rätt att använda
programmen kostnadsfritt, att ta del av källkod, att göra ändringar, samt även kunna
vidaredistribuera programmen. Se detta kapitel eller de individuella programpaketen för 
specifika frågor rörande licenser.

I slutet av dokumentet finns en sammanställning av många vanliga frågor och svar
(inbland kallat *FAQ, frequently asked questions*) som ger fördjupande svar på frågor som kan tänkas uppkomma.

Som bilagor till dokumentet finns detaljbeskrivningar för hur de olika programpaketen har kompileras, konfigurerats 
och behövs ändras för att kunna bygga i den miljö vi skapat.

\clearpage
