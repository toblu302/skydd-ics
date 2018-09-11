# FAQ: Vanliga frågor och svar
Denna text är en sammanställning av många vanliga frågor och svar som
rör denna programvaruuppsättning.

1. Bakgrund och översiktsfrågor 
     * [Varför har SvK tagit fram dessa verktyg?]
     * [Vem är målgruppen för att använda dessa vertyg?]
     * [Hur kommer dessa verktyg underhållas?]

2. Detaljfrågor
    * Kända problem
        * [Jag har satt upp allt, men får inga larm i övervakningsservern, vad kan ha hänt?]
        * [Jag har precis installerat en server, men jag kan inte nå webbgränssnittet. Vad är fel?]
    * Paketering
        * [Vad är skillnaden mellan den här paketeringen och Security Onion?]
        * [Finns det skillnader i paketeringen av de olika funktionerna?]
    * Operativsystem
        * [Vilken version och distribution av Linux används?]
        * [Varför har man valt denna Linux?]
        * [Varför har ni två olika operativsystem?]
    * Installation
        * [Vilka hårdvarukrav ställs på den utrustning som skall användas?]
        * [Hur hanterar programvaran att min dator har flera nätverkskort och Ethernetanslutningar?]
        * [Servern jag installerat hittar ingen nätverksadress. Vad kan vara fel?]
        * [Kan jag köra flera av funktionerna på en och samma server?]
    * Systemadministration och avancerad användning
        * [Åtkomst till webbgränssnitt via nätverket]
        * [Kan jag uppdatera systemet?]
        * [Har servrarna stöd för IPv6?]
        * [Servern har vill inte starta operativsystemet. Finns det något jag kan göra?]
    * Källkod och byggmiljö
        * [Vart finns källkoden till alla programmoduler och paket?]
        * [Jag vill skapa en egen installations-fil utifrån källkoden, hur gör jag?]
    * Användning
        * [Hur stänger jag av en server?]
        * [Texten är så liten på skärmen, kan jag ändra teckenstorlek?]
        * [Hur gör jag för att sätta webbläsaren i fullskärmsläge?]
        * [Upplösningen på skärmen är låg. Kan jag ändra till en högre upplösning?]
    * Säkerhet
        * [Hur har lösningen säkrats upp?]
        * [SELinux omnämns hela tiden, hur har ni använt det?]
    * IDS
        * [Vilka regler aktiverade i IDS-lösningen?]
        * [Finns det andra SCADA-regler, som inte är medpaketerade?]
        * [Hur ser regelverket ut, finns det något exempel på hur IDS-reglerna är utformade?]
        * [IDS-lösningen larmar väldigt mycket, varför gör den det?]
        * [IDS-lösningen larmar väldigt mycket, kan jag göra något åt det?]
      	* [Vad är skillnaden mellan den här paketeringen och Security Onion?]
        * [Förutom snort, finns det andra moduler på IDS-systemet jag kan använda mig av?]
        * [Snorby dashboard summeringen uppdateras inte]
    * Loggservern
        * [Kan jag söka efter en textsträng i alla loggar?]
        * [När jag listar innehållet i en logg, kan jag söka efter en textsträng då?]
    * Nätverksinspelning
        * [Förutom tcpdump, finns det andra moduler på nätverksinspelnings-systemet jag kan använda mig av?]
        * [Hur hanteras diskutrymmet på nätinspelningsservern?]
      	* [Hur kan jag spara undan nätverksinspelningar från nätverksinspelningsservern?]
    * Övervaknings- och larmserver
        * [Kan jag använda övervakningsservern för att övervaka de andra servrarna som ingår i den paketerade lösningen?]
        * [Kan jag använda övervakningsservern för att övervaka ICS/SCADA-utrustning?]
        * [Kan jag använda övervakningsservern för att övervaka annan infrasrukturutrustning, såsom exempelvis kylsystem eller avbrottsfri ström?]

## Bakgrund och översiktsfrågor 

### Varför har SvK tagit fram dessa verktyg?
Verktygen har tagits fram för att det finns ett behov av standardverktyg, som inte kostar pengar, 
och som kan ingå i ett grundskydd, för svenska elbolag.

### Vem är målgruppen för att använda dessa vertyg?
IT-säkerhetsansvariga, IT-ansvariga, processingenjörer, driftchefer med flera som vill förändra och
förbättre IT-miljöer i de industriella automationslösningar som förekommer på svenska elbolag.

### Hur kommer dessa verktyg underhållas?
Allt släpps som öppen källkod, och bygger till stora delar på öppen källkod. 
Det innebär flera saker och betyder bland annat:

* Många av de komponenter eller verktyg som detta projekt sammanställt och paketerat
  har redan befintliga grupper, enskilda personer, organisationer eller företag som 
  står bakom och underhåller.
* All nyutvecklad källkod finns tillgänglig för allmänheten. Det gör det möjligt för vem som helst att 
  granska, förändra, förbättre, underhålla eller på annat sätt arbeta med filer och information
  som tagits fram under projektet.
* Att det är fritt fram för enskilda personer eller företag att ta på sig en roll för 
  att underhålla verktygen.

## Detaljfrågor

### Jag har satt upp allt, men får inga larm i övervakningsservern, vad kan ha hänt?

Det kan bero på att tiden inte är korrekt mellan det system som genererar larmet och larm/övervakningsservern.

En lösning är att försöka sätta klockan till korrekt till samt att sätta tidszonen till UTC-tidzon.

### Jag har precis installerat en server, men jag kan inte nå webbgränssnittet. Vad är fel?


### Vad är skillnaden mellan den här paketeringen och Security Onion?

[Security Onion] är en annan paketering av nätverksövervakningsverktyg. Nedan
görs en kort sammanfattning av några skillnader mellan dessa två paket. 

Följande fördelar jämfört med SecurityOnion finns det med de paketerade
verktygen som ingår i denna dokumenterde lösning:

* Utförlig dokumentation som hjälper till för att en användare skall kunna komma igång
* All dokumentation på svenska
* Modernt operativsystem
* Särskild fokus på att få ett härdat grundsystem
* Särskild fokus på att säkra upp användningen av de applikationer som används
* Speciella säkerhetsfunktioner installerade (SELlinux-policies anpassade för ändamålet)
* Anpassade funktioner för ICS/SCADA-användning
* Bifogade IDS-regler för ICS/SCADA

### Finns det skillnader i paketeringen av de olika funktionerna?

Många grundfunktioner och grundläggande program delas och nyttjas av alla programpaketen. Det finns dock
vissa skillnader i hur de olika servrarna sedan installeras och vilka programpaket som installeras.

Till exempel så används den väldigt enkla webbservern lighttpd för nätverksinspelning- och loggservern. 
Detta för att minska attackyta och komplexitet. Medans det för larmservern (icinga) och
intrångsdetekteringsservern (snort) används webbservern [Apache]. Apache används för att 
dessa servrar kräver extramoduler och mer avancerad funktionalitet från webbservern.

### Vilka hårdvarukrav ställs på den utrustning som skall användas?

De krav som finns på den hårdvara som skall användas som plattform för installation av 
dessa programpaket finns närmare beskrivna i kapitlet [Några kommentarer om hårdvara och hårdvarukrav].


### Vilken version och distribution av Linux används?

Som bas för de paketeringen har [CentOS] 7 använts. 

### Varför har man valt denna Linux?
Valet av Centos är baserat på flera kriterier:

* Det är en mogen plattform
* Den är en fri plattform, för vilken man inte behöver köpa supportkontrakt eller teckna licenser och därtill hörande kostnader
* Det finns en relaterade kommersiell variant, RedHat Enterprise Linux, vilket någon som har stora behov av supportkontrakt
  kan använda istället. Det är bara att flytta över alla programpaket och uppsättningar till RHEL-miljön istället för
  CentOS och använda istället.
* De flesta programpaket som vi ville använda fanns redan porterade till plattformen, så att det gick att använda
  programpaket istället för att bygga dom ifrån källkodsform.
* Säkerhetsmekanismen SELinux finns i CentOS/RedHat. Det är en funktion som vi använt i paketeringen

### Varför har ni två olika operativsystem?

Den plattform som vi valt använder sig av CentOS Linux version 7. Alla programmodulerna vi själva
utformat bygger på detta. Brandväggen pfSense som vi också inkluderat, men som är ett färdigt 
paket som vi inte själva bygger utan bara dokumenterar, är baserat på operativsystemet [FreeBSD].


### Hur hanterar programvaran att min dator har flera nätverkskort och Ethernetanslutningar?
Såsom vi byggt och paketerat de olika lösningarna, tex nätverksinspelningsserver eller 
IDS-lösning, så skall de fungera automatiskt med flera nätverkskort och nätverksanslutningar.

### Servern jag installerat hittar ingen nätverksadress. Vad kan vara fel?
Detta fel kan uppstå när man glömmer att sätta IP-adresser när systemet installeras.
Likaså att felet kan uppstå ifall man glömmer att klicka i valet "anslut automatiskt till detta nätverk när det är tillgängligt" i samband med installation. Hur denna inställningsruta ser ut går att se i nedanstående bild.

![Aktivera IP konfiguration](images/installation_val_av_nat_ipv4_enable.png "Aktivera IP konfiguration")


### Hur stänger jag av en server?

Längst upp det övre högra hörnet på den grafiska användargränssnittet finns det en knapp för att visa en 
meny med diverse kommandon som berör användaren eller systemet. Ta fram den menyn och välj alternativet "Stäng av".

![Logga ut och stänga av CentOS](images/centos-turnoff.png "Stänga av CentOS")

### Texten är så liten på skärmen, kan jag ändra teckenstorlek?

Ja, teckenstorleken i webbläsaren går att ändra. Genom att trycka på ctrl-'+' (kontrolltangenten samt '+' samtidigt) 
så ökas teckenstorleken. För att minska teckenstorleken, tryck ctrl-'-' (kontrolltangenten samt '-' samtidigt) 

### Hur gör jag för att sätta webbläsaren i fullskärmsläge?

Ja. Om du har startat webbläsaren, så kan du trycka F11 (funktionstangent nr 11), vilket 
ställer om webbläsaren firefox mellan att vara i fullskärmsläge eller ej.

### Upplösningen på skärmen är låg. Kan jag ändra till en högre upplösning?

Ja, det går enkelt att ändra upplösningen på den grafiska miljön genom att ändra i systeminställningarna. I applikationsmenyn, välj "systemverktyg" och där välj "Settings", se nästa bild.

![Välj "settings i systemverktygsmenyn" i applikationsmenyn](images/foss-screensize-pic1.png "Ändra skärminställningar")

När fönstret för "Settings" visas, välj alternativet "skärmar", se nästa bild.

![Välj "settings" i applikationsmenyn](images/foss-screensize-pic2.png "Ändra skärminställningar")

Fönstet för "skärmar" visas. Där går det att ändra flera inställningar, bland annat "upplösning" i en rullmeny.

![Välj "settings" i applikationsmenyn](images/foss-screensize-pic3.png "Ändra skärminställningar")

Ifrån rullmenyn för "upplösning", välj en upplösning som bör fungera med det grafikkort som finns i datorn.

![Välj "settings" i applikationsmenyn](images/foss-screensize-pic4.png "Ändra skärminställningar")

Om valet av den nya grafikupplösningen fungerar, kommer ett nytt fönster att bli synligt på skärmen. Detta fönster
är en kontrollfråga för att se ifall den valda skärmupplösningen fungerar. Om du ser frågan på skärmen och är nöjd med upplösningen, välj alternativet *"Behåll denna konfiguration"*

![Välj "settings" i applikationsmenyn](images/foss-screensize-pic5.png "Ändra skärminställningar")

### Kan jag uppdatera systemet?

Ja, genom att köra kommandot *yum update* med högsta behörighet på systemet kan du uppdatera de programpaket som finns installerade. 
Dvs i ett terminalfönster kör kommandot:

```
	sudo yum update
```

Om du är osäker på hur man gör detta, se detaljbeskrivning i kapitlet [Terminal-åtkomst och kommandoraden].

För att detta skall fungera, så krävs dock att servern har åtkomst till en fungerande DNS och att den har internetåtkomst.

### Har servrarna stöd för IPv6?

Ja, operativsystemet CentOS har stöd för IPv6. De flesta funktionerna som används i denna paketering har också inbyggt 
grundstöd för IPv6. Exempelvis så kan loggservern ta emot loggar skickade via IPv6, nätverksinspelningsservern spela 
in IPv6-trafik, med mera. 

För att IPv6 skall fungera korrekt, så kan du behöva sätta en IPv6-adress på nätverkskorten som är
aktiverade i servern via [NetworkManager].

### Kan jag köra flera av funktionerna på en och samma server?

Nej, varje funktion (loggserver, larmserver, övervakningsserver, nätverksinspelningsserver, brandvägg) 
kräver en anpassad och dedikerad installation.

### Åtkomst till webbgränssnitt via nätverket

För paketen nätverksinspelningsserver och loggserver går det att ändra inställningarna
så att det går att få fjärråtkomst till systemen. Se nedanstående beskrivning hur man gör.

Som standard så går webbgränssnittet enbart att nå via den egna datorn, via lokalt ansluten
skärm och tangentbord. När servern kommer igång så startar det grafiska gränssnittet lokalt.
Via denna grafiska miljö kan man via en lokalt startad webbläsare komma åt gränssnittet.
Det går alltså inte att nå webbtjänsten direkt via nätverket. Orsaken till detta är att
standardinstallationen skall vara så säkert uppsatt som möjlig.

Om det finns behov av att kunna nå nätverksinspelningsservern från en annan dator måste
konfigurationen för webbservern ändras så att den även är åtkomlig på det externa nätverksinterface.
Då måste kryptering av webbtrafiken samt authenticering av åtkomst till webbsidan aktiveras.
Detta behövs för att skydda den potentiellt känsliga trafiken inte kan ses av någon obehörig,
eller att serven kan nås av, och loggas in i, av någon obehörig.

Vid första uppstarten av systemet genererades *för installationen unika* så kallat "dummy-cert" för webbservern.
Dessa certifikat finns sparade i filerna **/etc/pki/tls/certs/dummy.cert** och **/etc/pki/tls/private/dummy.key**.
Dessa certifikat kan användas i test-syfte. Om du vill testa att aktivera nätverksåtkomst till
webbtjänsten så kan du undersöka den existerande konfigurationsfilen **/etc/lighttpd/lighttpd.conf**.
Där finns ett utkommenterat exempel på hur det är möjligt att aktivera en server som dels lyssnar på en
extern address och dels använder kryptering för att skydda trafiken. För att kunna redigera filen,
för att ta bort kommenteringen och kanske sätta en annan IP-adress,  starta programmet
*Terminal* via menyn "Applications". I det öppnade terminalfönstret skriv kommandot:

```
              sudo nano /etc/lighttpd/lighttpd.conf
```

Där nano är namnet på ett textredigeringsprogram som medföljer. Använd nano, vi eller mg efter önskemål.
*För hjälp att förstå hur man använder textredigeringsprogram eller hur man använder sig av terminal-programmet,
se närmare detaljinformation i kapitlet [Terminal-åtkomst och kommandoraden].*

Förutom att aktivera nätåtkomst till webbserverdelen samt aktivera TLS-kryptering, så måste också
brandväggen öppnas. Liknande redigeringen av webbserverkonfigurationen ovan, så finns det redan utkommenterade
brandväggsinställningar för att underlätta för öppnandet av brandväggsportar och åtkomst till webbservern.
Starta programmet *Terminal* från menyn "Applications". Ta bort kommentarstecknet för raden med
hänvisning till *HTTPS* i filen **/etc/sysconfig/iptables**. Gör det med textredigeringsprogram enligt nedanstående
exempel:

```
              sudo nano /etc/sysconfig/iptables
```

När brandväggsreglerna är ändrade och nedsparade, ladda sedan om brandväggsreglerna med
kommandot

```
              sudo iptables-restore /etc/sysconfig/iptables
```

### Kan jag söka efter en textsträng i alla loggar?

Genom att skriva in ett sökuttryck på förstasidan (http://127.0.0.1/sok.html) så kan du söka efter om
en textsträng förekommer i någon av de sparade loggfilerna.

### När jag listar innehållet i en logg, kan jag söka efter en textsträng då?

Webbläsaren firefox har en inbyggd sökfunktion som du kan använda för att söka efter en
text på en webbsida genom att trycka ctrl-f (Kontrolltangenten + 'F'). Detta ger en sökruta nere i vänstra hörnet


### Vilka regler aktiverade i IDS-lösningen?

Som standard i denna paketering av en IDS-sensor och medföljande grafiskt gränssnitt så är följande IDS-regler aktiverade:

* Snort:s community-regler
* Digital Bonds Quickdraw SCADA-regler
* Extra regler för Siemens S7
* Enkel regel för icmp echo, för att möjliggöra testning med "ping"

Dessa är installerade för att göra lösningen användbar i en SCADA/ICS-miljö.

Det bör dock noteras, att med denna mängd regler och signaturer, som är ett smörgåsbord av 
beskrivningar av olika nätverksattacker, så kommer många signaturer eller attackmönster 
inte att vara aktuella för den IT-miljö som de installeras i.

### Finns det andra SCADA-regler, som inte är medpaketerade?

Exempelvis så finns Emerging Threats SCADA-regler. De är inte medpaketerade, då vi inte hunnit
göra extra testning med dessa regler. De kan dock hämtas hem ifrån [EmergingThreats] webbplats
och läggas till i IDS-sensorn.

### Hur ser regelverket ut, finns det något exempel på hur IDS-reglerna är utformade?

Följande exempelregler är framtagna för att användas i SvK:s demonstrator för att visa på att det går 
att skriva regler för att detektera att styrkommandon skickas till PLC-utrustningen från andra
IP-adresser än den kontrollrumsdator som normalt skall skicka styrkommandon.

I exemplet finns två IP-adresser fördefinierade:

* IP-adressen för PLC-utrustningen
* IP-addressområdet (nätet) för kontrollrummet

Följande snort-regler larmar för olika typer av ändringar i PLC eller access. 

*Notera att raderna är brutna i detta dokument för att kunna visa dessa regler, då dessa normalt sett
är enstaka långa rader*

```
ipvar SVKDEMO_KONTROLLRUM 10.10.10.0/24
ipvar SVKDEMO_PLC 10.10.10.10

# Alert on gateopen cmd from unauthorized client
alert tcp !$SVKDEMO_KONTROLLRUM any -> $SVKDEMO_PLC 102 \
(msg: "S7 Communication from Unauthorized Client";sid:1111305;priority:1;rev:1;)

# write var, open gate
alert tcp !$SVKDEMO_KONTROLLRUM any -> $SVKDEMO_PLC 102 \
(content: "|03 00|"; within: 200; pcre: \
"/\x32\x01\x00\x00\x02\x06\x00\x12\x00\x05\x05\x01\x12\x0e\xb2\xff\x00\x00\x00\x52
 \x78\x04\x1f\x0f\x40\x00\x00\x11\xff\x03\x00\x01\x01/";\
msg: "S7 Write Open Gate from Unauthorized Client";sid:1111306;priority:1;rev:1;)

# write var, close gate
alert tcp !$SVKDEMO_KONTROLLRUM any -> $SVKDEMO_PLC 102 \
(content: "|03 00|"; within: 200; pcre: \
"/\x32\x01\x00\x00\x02\x06\x00\x12\x00\x05\x05\x01\x12\x0e\xb2\xff\x00\x00\x00\x52
 \x78\x04\x1f\x0f\x40\x00\x00\x11\xff\x03\x00\x01\x00/";\
msg: "S7 Write Close Gate from Unauthorized Client";sid:1111307;priority:1;rev:1;)

# write var, open generator
alert tcp !$SVKDEMO_KONTROLLRUM any -> $SVKDEMO_PLC 102 \
(content: "|03 00|"; within: 200; pcre: \
"/\x32\x01\x00\x00\x02\x03\x00\x12\x00\x05\x05\x01\x12\x0e\xb2\xff\x00\x00\x00\x52
 \xea\x2d\xb0\xd9\x40\x00\x00\x10\xff\x03\x00\x01\x01/";\
msg: "S7 Write Open Generator from Unauthorized Client";sid:1111308;priority:1;rev:1;)

# write var, close generator
alert tcp !$SVKDEMO_KONTROLLRUM any -> $SVKDEMO_PLC 102 \
(content: "|03 00|"; within: 200; pcre: \
"/\x32\x01\x00\x00\x02\x02\x00\x12\x00\x05\x05\x01\x12\x0e\xb2\xff\x00\x00\x00\x52
 \xea\x2d\xb0\xd9\x40\x00\x00\x10\xff\x03\x00\x01\x00/";\
msg: "S7 Write Close Generator from Unauthorized Client";sid:1111309;priority:1;rev:1;)
```


### IDS-lösningen larmar väldigt mycket, varför gör den det?

De regler som kallas för "snort community rules" är väldigt omfattande till antal och resulterar ofta i att det larmar. 
Speciellt om du sätter IDS-sensor på ett nätverk där det går mycket trafik, dvs inte sitter på ett processnät, utan på 
på ett kontorsnät eller ut mot internet.

### IDS-lösningen larmar väldigt mycket, kan jag göra något åt det?

Under katalogen /etc/snort/rules/ finns alla regler som används av Snort. Öppna dem och kommentera ut de regler med 
en brädgård som du tycker larmar för mycket eller inte är rätt för din miljö.

### Förutom snort, finns det andra moduler på IDS-systemet jag kan använda mig av?

Förutom Snort kan du installera Suricata från <http://suricata-ids.org/> och konfigurera Barnyard2 så att den
läser ifrån Suricata istället.

### Förutom tcpdump, finns det andra moduler på nätverksinspelnings-systemet jag kan använda mig av?

Wireshark är ett annat verktyg för att se på nätverkstrafik och har ett grafiskt gränssnitt men rekommenderas inte för
att titta på okänd trafik.

### Snorby dashboard summeringen uppdateras inte

Om det är så att siffrorna aldrig uppdateras kan det bero på ett par olika saker:

* Att klockan inte går korrekt.
* Att det finns saker i snorbys cache som är fel.

Ett sätt att tillfälligt lösa det är att se till att Snorbys cache i MySQL rensas:

    $ sudo -i
    $ mysql -uroot -p$(</root/.mariadb_pass)
    mariadb> use snorby;
    mariadb> truncate table caches;

Nu gå till Dashboarden, välj meny Administration, "Workers & Job Queue" och radera Cache-jobbet och skapa sedant ett nytt.

En annan lösning är att försöka sätta klockan till korrekt till samt att sätta tidszonen till UTC-tidzon.

### Hur hanteras diskutrymmet på nätinspelningsservern?

På nätverksinspelningsservern finns ett speciell serverprogram kallat "reaper.py" installerat som
håller reda på att disken inte fylls upp av den inspelade trafiken. Programmet kontrollerar 
diskutrymmet i samband med att nya filer skapas i filsystemet där den inspelade nätverkstrafiken
sparas. Som standard så ser den till att det skall finnas ca 20% ledigt diskutrymme innan den
börjar radera de äldsta inspelningarna.

### Hur kan jag spara undan nätverksinspelningar från nätverksinspelningsservern?

I webbgränssnittet för servern så finns det möjlighet att välja "ladda ner pcap-fil". Denna
pcap-fil innehåller inspelad trafik. Servern delar upp inspelad trafik i flera filer, för
att hålla ner filstorleken. Välj en eller flera filer att ladda ner och analysera med andra
verktyg, exempelvis Wireshark 2, på en lokal dator.

### Hur har lösningen säkrats upp?

Operativsystemet och de olika applikationerna som vi använder där
har härdats för att ha så liten exponering som möjlig. Det innebär bland annat
att vi började installationen från en minimal operativsystemsinstallation till
vilken vi lagt till programpaket. Detta för att inte ha med onödiga tjänster och
funktioner.

De olika programmen som används i systemet har också fått egna användare, för att
minska möjligheten för ett program att påverka andra delar av systemet.

En annan säkerhetsbarriär som använts är SELinux. De olika tjänster som vi använder i
systemet har fått SELinux-policies skrivna som låser ner de körande programmens
åtkomst till olika delar i systemet.

### SELinux omnämns hela tiden, hur har ni använt det?

Vi har utvecklat SELinux-profiler för de olika modulerna som vi kör, såsom för
webbservrar som visar upp resultat eller runt program som hämtar in information
från nätverket, exempelvis tcpdump.

SELinux är satt i s.k. enforcing-läge, vilket medför att alla överträdelser mot SELinux-policyn 
automatiskt innebär att det program som gör överträdelsen stängs ner av operativsystemet.


### Kan jag använda övervakningsservern för att övervaka de andra servrarna som ingår i den paketerade lösningen?

Ja, men det förutsätter ett par saker:

1. Att servern som skall övervakas sitter på en nätverksport som går att nå (dvs inte via en span-port eller via en nätverkstap). Detta gäller främst för nätverksinspelningsservern eller IDS-servern
2. Att servern som skall övervakas har en IP-adress
3. Att servern har är tillgänglig via "ping" (dvs ICMP). Brandväggsreglerna är som standard satta att tillåta att servrarna blir ping:ade.

### Kan jag använda övervakningsservern för att övervaka ICS/SCADA-utrustning?

Ja, men det förutsätter ett par saker:

1. Att ICS/SCADA-utrustningen som skall övervakas sitter på ett nätverk som går att nå.
2. Att ICS/SCADA-utrustningen som skall övervakas har en IP-adress
3. Att ICS/SCADA-utrustningen är tillgänglig via "ping" (dvs ICMP). Kontrollera att utrustningen har stöd för ping.

Om mer avancerad övervakning önskas, exempelvis via SNMP, så kan övervakningsservern även konfigureras att göra det.

### Kan jag använda övervakningsservern för att övervaka annan infrastrukturutrustning, såsom exempelvis kylsystem eller enheter för avbrottsfri ström?

Ja, men det förutsätter ett par saker:

1. Att infrastruktur-utrustningen som skall övervakas sitter på ett nätverk som går att nå.
2. Att infrastruktur-utrustningen som skall övervakas har en IP-adress
3. Att infrastruktur-utrustningen är tillgänglig via "ping" (dvs ICMP). Kontrollera att utrustningen har stöd för ping.

Om mer avancerad övervakning önskas, exempelvis	via SNMP, så kan övervakningsservern även konfigureras att göra det.

### Servern har vill inte starta operativsystemet. Finns det något jag kan göra?

Starta upp servern på det installationsmedia som användes, tex en USB-sticka eller DVD-skiva. Men istället för att
göra en installation, välj alternativet *"felsökning"* i menyn som visas i samband med att systemt startar. Se nedanstående bild.

![Välj "Felsökning" i menyn som visas vid systemstart](images/foss-troubleshooting-pic1.png "Välj felsökning")

Från felsökningsmenyn, välj "Rescue a CentOS system" för att starta upp systemet i ett specielt felsökningsläge, se nedanstående skärmavbildning:

![Välj "Rescue a CentOS system" i felsöknings-menyn](images/foss-troubleshooting-pic2.png "Rescue a CentOS system")

Därefter startas ett nytt program upp, varifrån en speciellt återställningsmiljö är tillgänglig där man kan försöka
läsa ut existerande filer eller exekvera vissa felsöknings- och felavhjälpningskommandon.

![Rescue-meny](images/foss-troubleshooting-pic3.png "Rescue a CentOS system")

För mer dokumentation och information hur man gör systemåterställning eller akut administration av så hänvisar vi till RedHats egen dokumentation om ämnet: <https://www.centos.org/docs/5/html/Installation_Guide-en-US/ch-rescuemode.html>

### Vart finns källkoden till alla programmoduler och paket?

Källkoden till alla paket kommer att vara tillgänglig. Sök via Energisäkerhetsportalen i första hand
eller via Github i andra hand.

### Jag vill skapa en egen installations-fil utifrån källkoden, hur gör jag?

Hämta hem den kompletta källkoden, alla filer som ingår i paketeringen. Det finns ett relativt
kort och enkelt skript kallat **create_iso.sh** i paketet. Filen är ett såkallat shellskript 
som är en sammansättning av kommandon. Kommandona i skriptet automatiserar ett antal steg för
att färdigställa ett antal moduler, exempelvis dokumentationen, och sedan skapa ett filsystem
med alla nödvändigt innehåll.

För att lyckas bygga installationsfilen, så måste ett antal förutsättningar uppfyllas:

* Detta shellskript kräver en Linux-miljö, sannolikt ett CentOS 7-system, för att kunna fungera korrekt. 
* Dokumentationen måste kunna skapas. För detta krävs **pandoc**. Eller om Makefilen i dokumentationskatalogen ändras, annat verktyg för att förvandla dokumentation skriven i markdown till pdf, html mm.
* Internetåtkomst, för att kunna hämta de RPM-paket som behövs till installationen

Nedan följer en detaljerad beskrivning hur detta går till:

1. Starta ett terminal-fönster (Om du är osäker på hur man gör detta, se detaljbeskrivning i kapitlet [Terminal-åtkomst och kommandoraden]) 
2. Skapa dokumentationen
3. I den katalog till vilken du laddat ner filerna, byt till underkatalogen med hjälp av kommandot *cd docs*
4. I docs-katalogen, skriv *make all* för att bygga dokumentationen som krävs innan själv installationsmediet skapas
5. Ladda ner beroenden
6. Säkerställ att alla repositories som krävs är aktiverade i byggdatorn,
        1. Installera centos-release-scl-rh
        2. Lägg till repository image/isolinux/postinstall/config/monitor_server/icinga2.repo
        3. Lägg till publika signeringsnyckeln image/isolinux/postinstall/config/monitor_server/RPM-GPG-KEY-icinga
        4. EPEL, går att installera med yum install epel-release
7. I den katalog till vilken du laddat ner filerna, byt till underkatalogen med hjälp av kommandot cd image
8. I image-katalogen, kör det medföljande programmet ./download_packages.sh (det här skriptet tog ca 10min att köra på en testdator)
9. Skapa installationsmedia
10. I den katalog till vilken du laddat ner filerna, byt till underkatalogen med hjälp av kommandot cd image
11. I image-katalogen, kör det medföljande programmet ./create_iso.sh (det här skriptet tog ca 1min att köra på en testdator)

skriptet *download_packages.sh* som körs, laddar ner alla programpaket som behövs i samma katalogen *image/isolinux/Packages*.

skriptet *create_iso.sh* som körs skapar en fil med namnet foss.iso i samma katalog. Detta är filen med installationsprogrammet som kan brännas till DVD eller installeras på en USB-minnessticka.

Från DVD:n eller USB-enheten går det sedan att boota den aktuella datorn som installationen ska utföras på.


\clearpage
