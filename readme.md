# Samling av säkerhetslösningar byggda på öppen källkod för att skydda eller upptäcka hot i [SCADA/ICS-miljö]

Detta programarkiv innehåller ett antal olika säkerhetslösningar, vissa för att skapa skydd, andra för att kunna fungera som logg/larm/övervakningsservrar, i ICS/SCADA-miljöer. Dessa säkerhetslösningar bygger i grund och botten på fria och öppna programvaror (s.k. [FOSS]).

Lösningen består av ett installations-media varifrån du kan välja att installera olika säkerhetsfunktioner på servrar. Bland de servrar du kan installera så finns exempelvis 

* en enkel logginsamlingsserver som tar emot syslog-trafik och har ett enkelt webbgränssnitt för att kunna söka efter strängar i insamlade loggar
* en larmserver som sätts upp som mottagare och hanterare av olika larm från övervakade tjänster och utrustning
* en nätverksinspelnings-nod som kan samla in nätverkstrafik
* en intrångsdetekterings-nod som kan agera på attackmönster på nätverksnivå

## Filstruktur

Filkatalogen **docs/** innehåller dokumentation skriven i markdown för de enskilda servrarna som går att installera, samt tillhörande stöddokumentation. Från denna grunddokumentation kan motsvarande dokumentation i HTML, pdf mm skapas. En sammanställd bok, kallad bok.pdf skapas också av alla dokumentationsfilerna.

Filkatalogen **image/** innehåller skript och konfigurationer för att skapa en avbildning som kan skrivas till en DVD eller en USB-minnessticka.

Filkatalogen **pictures/** innehåller vissa bilder som används i lösningen

## För att komma igång

## För att skapa en installationsmedia, en s.k. [ISO]-fil på en dator med CentOS 7:
1. Starta ett terminal-fönster
2. Skapa dokumentationen
  1. I den katalog till vilken du laddat ner filerna, byt till underkatalogen med hjälp av kommandot **cd docs**
  2. I docs-katalogen, skriv **make all** för att bygga dokumentationen som krävs innan själv installationsmediet skapas
3. Ladda ner beroenden
  1. Säkerställ att alla *repositories* som krävs är aktiverade i byggdatorn,
      1. Lägg till repository *image/isolinux/postinstall/config/ids_server/rhscl-httpd24-epel-7-x86_64.repo*
	  2. Lägg till repository *image/isolinux/postinstall/config/ids_server/rhscl-v8314-epel-7-x86_64.repo*
	  3. Lägg till repository *image/isolinux/postinstall/config/ids_server/rhscl-rh-passenger40-epel-7-x86_64.repo*
	  4. Lägg till repository *image/isolinux/postinstall/config/monitor_server/icinga2.repo*
	  5. Lägg till publika signeringsnyckeln *image/isolinux/postinstall/config/monitor_server/RPM-GPG-KEY-icinga*
	  6. Lägg till repository *image/isolinux/postinstall/config/ids_server/rhscl-ruby193-epel-7-x86_64.repo*
	  7. EPEL, går att installera med **yum install epel-release**
  2. I den katalog till vilken du laddat ner filerna, byt till underkatalogen med hjälp av kommandot **cd image**
  3. I image-katalogen, kör det medföljande programmet **./download_packages.sh** (det här skriptet tog ca 10min att köra på en testdator)
4. Skapa installationsmedia
  1. I den katalog till vilken du laddat ner filerna, byt till underkatalogen med hjälp av kommandot **cd image** 
  2. I image-katalogen, kör det medföljande programmet **./create_iso.sh**  (det här skriptet tog ca 1min att köra på en testdator)

skriptet **download_packages.sh** som körs laddar ner alla programpaket som behövs i samma katalogen image/isolinux/Packages.

skriptet **create_iso.sh** som körs skapar en fil med namnet **foss.iso** i samma katalog. Detta är filen med installationsprogrammet som kan brännas till DVD eller installeras på en USB-minnessticka. 

Från DVD:n eller USB-enheten går det sedan att *[boota]* den aktuella datorn som installationen ska utföras på.


## Skapa en bootbar DVD

# Att starta upp från installationsmediet (DVD eller USB-sticka) första gången

Sätt in installationsmediet (DVD eller USB) i den dator som du vill använda för att installera dessa program på. 
**Notera att hårddisken som sitter i datorn kommer att omformatteras i det fall du väljer att påbörja en installation. All information på den hårddisken kommer att skrivas över**

När man startar en dator från installationsmediet så går det att välja vilken typ av server som ska installeras. Därefter 
startas en så kallad [kickstart]installation, där installationsförfarandet av grundläggande systemkomponenter och många installationsval är
automatiserade.

## Att starta upp datorn med de nyinstallerade tjänsterna första gången
Efter installationen är färdig, så ombeds du att starta om datorn, denna gång för att starta upp ifrån ditt nyinstallerade system. Ta ut USB-stickan eller DVD-skivan så att datorn inte försöker starta upp därifrån. I samband med omstart så ombeds du skapa en användare med tillhörande lösenord. När detta är klart så är systemet uppstartat och användaren är inloggad. 

Om installationen gått enligt plan, så är webläsaren [firefox] automatiskt startad. Startsidan för webbläsaren innehåller ytterliggare 
instruktioner för hur just den aktuella installationen används. Om du av misstag stänger ned webbläsaren, starta den på nytt via menyn "Application" -> "Favorites" -> "Firefox".

# Om något fel inträffar

Om installation inte slutfördes eller inte startades kan det vara så att just den datorn inte stöds utav den Linux-distribution som används.
Testa att installera på en annan dator, helst en annan modell och om möjligt en nyare årsmodell.

[kickstart]: "Ett sätt att installera ett operativsystem med programvara automatiskt"

[ISO-fil]: "En strukturerad fil som innehåller alla filer sammanställda till en stor sammanslagen fil, vilket är en avbildning av en CD/DVD-skiva"

[boota]: "Att starta upp en dator och göra initial programladdning, vilket oftast är operativsystemet eller annat grundläggande kontrollprogram"

[SCADA/ICS-miljö]: "Datormiljö som används för industriell automation."

[FOSS]: "Free and Open-Source Software. Samlingsnamn för datorprogram som klassificeras som både fri (tillgänglighen är inte begränsad) och källkoden är tillgänglig för alla och envar att studera, kopiera, modifiera mm"

[firefox]: "Fri webbläsare som har stor spridning i Linuxvärlden"

[ISO]: https://sv.wikipedia.org/wiki/ISO-avbild "Avbild av digitalt media"
