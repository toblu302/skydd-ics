# Introduktion

## Bakgrund

Under 2015 initierade Svenska kraftnät, inom ramen för sitt säkerhetshöjande arbete inom den svenska elbranschen, ett projekt för att skapa ett antal säkerhetskomponenter baserade på öppen källkod, alltså fria att använda utan kostnad. Primära målgruppen var svenska elbolag som av ekonomiska eller andra skäl saknar möjlighet att skaffa tekniska skyddsmekanismer. Dessa skulle då kunna skaffa sig ett grundskydd i sina ICS- och SCADA-miljöer samt få tillgång till verktyg för att enkelt och snabbt komma igång med säkerhetshöjande åtgärder. Svenska kraftnät gav 2014 ut en vägledning om IT-sakerhetsarkitektur. I denna beskrivs ett antal säkerhetskomponenter, säkerhetskontroller och funktionaliteter som bör finnas i en IT-miljö för att hålla en viss nivå av grundskydd. Relationsdiagrammet nedan visar vad IT-säkerhetsarkitektur är för något och hur det i sin tur relaterar till, och i vissa fall styr, andra delar av IT.


De programpaket [O4]som tagits fram – paketering av mjukvara som kan installeras på en PC-server – är tänkta att underlätta för svenska elbolag att upprätta och förvalta en IT-säkerhetsarkitektur, såsom den beskrivs i vägledningen från 2014, med fokus på säkerhetskontroller, det vill säga olika säkerhetsmekanismer och tekniska skydd. 
Eftersom detta programpaket är värdefullt även för andra branscher än elbranschen har Myndigheten för samhällsskydd och beredskap (MSB) valt att ansvara för förvaltning och spridning till motsvarande målgrupper inom övriga branscher i Sverige. Målsättningen är att höja säkerhetsnivån hos de bolag som av ekonomiska eller andra skäl saknar möjlighet att på annat vis skaffa tekniska skyddsmekanismer.

## Relationsdiagram mellan olika viktiga begrepp.
Detta dokument beskriver hur man installerar och använder de ingående komponenterna, samt deras syfte och funktionalitet.
Några kommentarer om hårdvara och hårdvarukrav
Detta kapitel beskriver kort några av de förutsättningar som krävs för att kunna använda funktionerna och att sätta upp servrar.
En av tankarna är att man ska kunna installera programmen på såväl gammal utrustning som på nyköpt. Det ska fungera lika bra att kunna bygga en budgetlösning med sina gamla datorer som att införskaffa nya servrar.

## Hårdvaruarkitektur
För de hårdvaruarkitekturer vi stödjer (Intel, AMD) finns det ett antal grundläggande hårdvarukrav rörande prestanda, storlek med mera framtagna. Dessa egenskaper, miniminivåer samt rekommenderade nivåer finns närmare beskrivna i detta dokument.
Som regel är dock den hårdvara som är tänkt målmiljö en Intelbaserad dator av PC-typ av modernt snitt. Mer information om arkitekturkrav beskrivs i följande kapitel. 

### Fysisk eller virtuell hårdvara
Programvarudistributionen har installerats och testats på både virtuell och fysisk hårdvara. 
Många av de paket och funktioner som levereras i detta installationspaket har funktioner, till exempel nätverksinspelningsfunktion, som fungerar bäst på fysisk hårdvara eftersom de kräver åtkomst till Ethernet-portar på ett sådant sätt som kan vara problematiskt i en virtuell miljö. En del andra funktioner och uppsättningarna av programvarudistributionen, såsom enkel loggserver, fungerar lika bra på virtuell som fysisk hårdvara.

### 32- och 64-bitars hårdvara
Intel har haft 64-bitarsversioner av sina CPU:er sedan i början av 2000 (2003 närmare bestämt). Likaså finns det 32-bitars och 64-bitarsversioner av det operativsystem, Linux, som vi har valt att använda i projektet. Modern hård- och mjukvara är bättre anpassad till att använda 64-bitarsersionerna. Vi har också valt att dra en gräns för hur gammal hårdvara vi kan stödja. Därför har vi valt att bara skapa 64-bitarsversioner av de programpaket som vi tagit fram.

### Primärminnesutrymme
De paketerade systemen kräver 1GB RAM-minne för att fungera. Mer minne är dock att rekommendera, gärna 4 eller 8GB.

### Lagringsutrymme
Det går att installera systemet på så små diskar som 20GB men eftersom de flesta system bygger på att samla in data är det rekommenderat att ha betydligt mycket mer i lagringsutrymme. Vilken storlek som behövs avgörs av hur mycket data det är tänkt att samla in i de olika systemen.

### CD och DVD eller USB-masslagring
Det går att används såväl DVD och USB-minnen för att skapa en installationsdisk. Denna installationsdisk används sedan för att installera systemet på en hårddisk för permanent användning av programvaran. För installation på en virtuell dator går det bra att använda ISO-filen direkt i det virtualiseringsprogram som används.

### Nätverksanslutning
Alla komponenter (loggserver, IDS-server, larmserver, nätverksinspelningsserver, brandvägg) kräver nätverksanslutningar för att vara användbara i verkliga scenarion, detta eftersom de oftast har ett behov av att behöver inhämta trafik eller få saker skickade till sig via nätverket.[O5]

## Testning
Olika tester har utförsts för att kontrollera att de olika servertyperna, de olika funktionerna och de olika inställningarna skall fungera såsom det är tänkt.

Testerna har utförts med både med virtuell hårdvara och fysisk hårdvara där Ethernetkort har använts.

Testerna gjordes  mot Ethernetkopplingar med 10Mbit- och 100Mbit-anslutningar.





# Sammanställning av de olika servertyperna

Det här är en sammanställning av de olika varianter av servrar som går att installera med hjälp av de guider och instruktioner för de olika avbilderna av installationsmedia som skapats.[O6]
Alla installationsmoment är gjorda så att själva installationen är så automatiserad som möjligt. För de installationer där manuell konfiguration behövs är det antingen av säkerhetsrelaterade skäl eller av den enkla anledningen att det måste ske en anpassning till den aktuella nätverksmiljön.

Nedan beskrivs på ett mer övergripande sätt de olika typer av tjänster och servrar som ingår.

## Logginsamlingsserver
Den här servertypen är till för att samla in loggar (spårdata) från andra datorer. En loggserver är mycket användbar både för felsökning och vid incidenthantering, dessutom kan en dedikerad[O7], extern loggserver krävas för att ingen ska kunna missbruka en server. Det går att lösa genom att vanliga serveradministratörer inte får åtkomst till den centrala loggservern.

Principskiss loggserver[O8].
En enkel loggserver klarar att ta emot och samla in loggar från andra system. Den ser också till att loggmeddelanden finns tillgängliga över tid genom att spara ner dem på disk. För vissa ändamål kan det krävas en mer avancerat server för att kunna ha bättre kontroll av de händelser som sker i en miljö. Dock är den här servertypen en mycket bra start ifall det inte finns någon central loggserver.

## Nätverksinspelningsserver
Den här servertypen är till för att på ett enkelt sätt kunna spela in nätverkstrafik och spara information om den. För att spela in trafik kopplar man in en nätverkskabel till den nätverksport där inspelning ska ske. För att relevant trafik ska komma till den aktuella porten behövs antingen en nätverkstapp eller en switch som är konfigurerad med en så kallad monitoreringsport eller SPAN-port.

Principskiss nätverksinspelningsserver[O9].

## Larmserver
Den här servertypen är till för att kunna övervaka andra servar, andra infrastrukturkomponenter samt de tjänster som finns på dem. Den kan till exempel upptäcka och larma om att lagringsutrymmet håller på att ta slut och att lasten på servern (hur nedtyngd servern är) är för hög.

Principskiss larmserver[O10].
Installationen av servern i sig är automatisk, men för att funktionen ska kunna vara verkningsfull, krävs att den konfigureras mot den miljö som ska övervakas.

## IDS-server
Den här servertypen är till för att kunna agera på beteenden i nätverk genom att lyssna på och analysera nätverkstrafik för att hitta signaturer eller mönster som tyder på intrång, policyöverträdelser, med mera. Servern ansluts på en sådan nättopologisk [O11]plats att den kan se nätverkstrafik där det finns behov av larm vid onormala beteenden.

Principskiss intrångsdetekteringssystem.

## Brandvägg för SCADA- och ICS-miljö[O12]
Den brandvägg som valts heter pfsense. Den är en mogen och beprövad lösning som sedan tidigare har en färdig paketering. Pfsense har också många säkerhetsfunktioner, exempelvis inbyggt stöd för skydd mot överlastningsattacker, loggning av trafik, möjlighet att sätta i klustrat högtillgänglighetsläge, normalisering (tvätt) av överförda nätverkspaket, med mera.
Eftersom Pfsense sedan tidigare har en paketering har den inte ompaketerats. För den här servertypen har dock en installation- och användarguide på svenska framställts. Nedanstående bild visar hur en brandvägg fungerar i princip. I datorsammanhang och i IT-säkerhetssammanhang är en brandvägg en kontrollfunktion med filtrerings- och spårbarhetsmöjlighet som styr datortrafik som passerar mellan olika nätverk. Bilden visar att viss typ av trafik, den gröna pilen, släpps igenom brandväggen medan den brandgula pilen visar trafik som blockeras från att passera brandväggen. Förekomsten av blockerad eller genomsläppt trafik kan loggas och därmed bli spårdata som går att analysera, sammanställa och ta fram rapporter eller statistik från.

Principskiss brandvägg.
Nästa bild visar att en brandvägg kan bestå av flera anslutningspunkter. Vissa mer okontrollerade nät finns på en sida och ett internt nätverk – i detta fall ett processkontrollnät finns på den andra sidan som här kallas "insidan" och ett eller flera så kallade DMZ-nät som sitter i den demilitariserade zonen.

Principskiss brandvägg – uppdelning av in- och utsida samt DMZ-nät.
I geografiskt utspridda organisationer, till exempel elbolag med lokalkontor, olika anläggningar för distribution och produktion, med mera, kan det finnas behov av att installera flera interna brandväggar för att dela upp nätverket i mindre delar som har åtkomstbegränsningar från varandra. Nästa bild visar översiktligt behovet av att dela in ett koncernnät i olika delar, där de olika process-, ICS- eller SCADA-miljöerna är utseparerade från det sammanhållande koncernnätet. Detta för att skydda processnäten från obehörig åtkomst eller misstag med it-teknik som kan påverka tillgänglighet och produktion.

Principskiss brandvägg – användning av flera interna brandväggar för olika nät.

Notera att eftersom Pfsense inte ompaketerats hämtas själva installationsfilen ner från tillverkaren på adress pfsensedl.
Placering av de olika säkerhetslösningarna
Det finns många alternativ på var i ett nät en komponent kan vara placerad. Vad som är rätt beror på hur det aktuella nätverket ser ut. Ibland kan det även vara bra att gör en ny design på nätverket för att uppnå bättre säkerhet. För att visa hur de olika komponenterna skulle kunna ge en bättre kontroll och säkerhet utan att påverka den aktuella designen används i exemplet nedan en fiktiv nätverksmiljö som inte är designad utifrån säkerheten. 

### Enkel nätverksdesign.
Med en nätverksmiljö som den ovanstående beskrivna är det möjligt att med relativt små medel, till exempel de gratisverktyg som erbjuds i den här paketeringen, bygga in säkerhetskomponenter som kan förbättra säkerheten och kontrollen i nätverket avsevärt.

### Enkel nätverksdesign med skydd.
Kostnaden för att uppnå det förstärka skyddet, med hjälp av de extra komponenterna och de extra skydd som dessa kan ge, bör ställas i relation till arbetsinsatser och investeringar. Om man till exempel lyckas återanvända en redan existerande dator, om gammal hårdvara återanvänds, och till detta lägger någon dag eller en veckas arbete, kan det i många fall vara en god investering som kan ge en mycket bra utdelning.
