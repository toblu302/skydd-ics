# Samling av säkerhetslösningar byggda på öppen källkod för att skydda eller upptäcka hot i [SCADA]/[ICS]-miljö]

Detta programarkiv innehåller ett antal olika säkerhetslösningar, vissa för att skapa skydd, andra för att kunna fungera som logg/larm/övervakningsservrar, i ICS/SCADA-miljöer. Dessa säkerhetslösningar bygger i grund och botten på fria och öppna programvaror (s.k. [FOSS]).

Lösningen består av ett installations-media varifrån du kan välja att installera olika säkerhetsfunktioner på servrar. Bland de servrar du kan installera så finns exempelvis 

* en enkel logginsamlingsserver som tar emot syslog-trafik och har ett enkelt webbgränssnitt för att kunna söka efter strängar i insamlade loggar
* en larmserver som sätts upp som mottagare och hanterare av olika larm från övervakade tjänster och utrustning
* en nätverksinspelnings-nod som kan samla in nätverkstrafik
* en intrångsdetekterings-nod som kan agera på attackmönster på nätverksnivå

## Filstruktur

Filkatalogen **docs/** innehåller dokumentation skriven i markdown för de enskilda servrarna som går att installera, samt tillhörande stöddokumentation. Från denna grunddokumentation kan motsvarande dokumentation i HTML, pdf m.m. skapas. En sammanställd bok, kallad bok.pdf skapas också av alla dokumentationsfilerna.

Filkatalogen **image/** innehåller skript och konfigurationer för att skapa en avbildning som kan skrivas till en DVD eller en USB-minnessticka.

Filkatalogen **pictures/** innehåller bilder som används


# Vägledning för att bygga och använda lösningen


## För att skapa en installationsmedia, en s.k. [ISO]-fil på en dator med CentOS 7:

### Beroenden
* En virtualiseringsmiljö
  * [kvm]
  * vmware
  * [virtualbox]
* [Vagrant]

### Bygga installationsmedia
1. Hämta källkoden. Detta kan exempelvis göras genom att ladda ner ZIP-filen eller klona med HTTPS.
Länk till ZIP-fil och adress för kloning finns under "Clone or download"-knappen i detta GiHub repository:
![](/home/christian/Projects/fluffy-barnacle/pictures/klona.jpg) 

2. Starta ett terminal-fönster

3.
    ```console
    $ cd vagrant
    ```
4. 
    ```console
    $ vagrant up build
    ```
5. $ vagrant ssh build
6. $ sudo su -
7. $ cd /vagrant/image
8. $ curl -o centosdvd.iso [url till centos dvd installationsmedia]
9. Verifiera checksumman enligt https://wiki.centos.org/TipsAndTricks/sha256sum
10. $ mount -o loop centosdvd.iso DVD
11. $ ./download_packages.sh
12. $ ./create_iso.sh
13. $ den byggda iso:n finns i katalogen /vagrant/image

### Skapa en bootbar DVD/USB
Se den färdiga dokumentationen


## För att skapa/ändra dokumentation
1. I den katalog till vilken du laddat ner filerna, byt till underkatalogen med hjälp av kommandot **cd docs**
2. Ändra i de textfiler eller de bilder som ska ändras
3. I docs-katalogen, skriv **make all** för att bygga dokumentationen och för att test förändringarna som gjorts


# Att starta upp från installationsmediet (DVD eller USB-sticka) första gången

Sätt in installationsmediet (DVD eller USB) i den dator som du vill använda för att installera dessa program på. 
**Notera att hårddisken som sitter i datorn kommer att omformatteras i det fall du väljer att påbörja en installation. All information på den hårddisken kommer att skrivas över**

När man startar en dator från installationsmediet så går det att välja vilken typ av server som ska installeras. Därefter startas en så kallad [kickstart]installation, där installationsförfarandet av grundläggande systemkomponenter och många installationsval är automatiserade.

## Att starta upp datorn med de nyinstallerade tjänsterna första gången
Efter installationen är färdig, så ombeds du att starta om datorn, denna gång för att starta upp ifrån ditt nyinstallerade system. Ta ut USB-stickan eller DVD-skivan så att datorn inte försöker starta upp därifrån. I samband med omstart så ombeds du skapa en användare med tillhörande lösenord. När detta är klart så är systemet uppstartat och användaren är inloggad. 

Om installationen gått enligt plan, så är webläsaren [firefox] automatiskt startad. Startsidan för webbläsaren innehåller ytterliggare 
instruktioner för hur just den aktuella installationen används. Om du av misstag stänger ned webbläsaren, starta den på nytt via menyn "Application" -> "Favorites" -> "Firefox".

# Om något fel inträffar

Om installation inte slutfördes eller inte startades kan det vara så att just den datorn inte stöds utav den Linux-distribution som används.
Testa att installera på en annan dator, helst en annan modell och om möjligt en nyare årsmodell.

[kickstart]: https://docs.centos.org/en-US/centos/install-guide/Kickstart2/ "Ett sätt att installera ett operativsystem med programvara automatiskt"

[SCADA]: https://en.wikipedia.org/wiki/SCADA "Datormiljö som används för industriell automation."
[ICS]: https://en.wikipedia.org/wiki/Industrial_control_system "Datormiljö som används för industriell automation."

[FOSS]: https://en.wikipedia.org/wiki/Free_and_open-source_software "Free and Open-Source Software. Samlingsnamn för datorprogram som klassificeras som både fri (tillgänglighen är inte begränsad) och källkoden är tillgänglig för alla och envar att studera, kopiera, modifiera m.m."

[firefox]: https://en.wikipedia.org/wiki/Firefox "Fri webbläsare som har stor spridning i Linuxvärlden."

[ISO]: https://sv.wikipedia.org/wiki/ISO-avbild "En strukturerad fil som innehåller alla filer sammanställda till en stor sammanslagen fil, vilket är en avbildning av en CD/DVD-skiva"

[kvm]: https://www.linux-kvm.org/page/Main_Page "En virtualiseringsmodul i Linuxkärnan."

[virtualbox]: https://www.virtualbox.org/ "Programvara för virtualisering."

[Vagrant]: https://www.vagrantup.com "Verktyg för att konfigurera och hantera miljöer med virtuella datorer."
