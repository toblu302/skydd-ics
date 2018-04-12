# Terminal-åtkomst och kommandoraden

Ett annat sätt att arbeta med systemet, än via det grafiska gränssnittet och de 
vyer som vi förberett, är via den traditionella kommandoraden som görs tillgänglig
via ett terminalfönster. Via terminalfönstret och kommandoraden går det att
kontrollera systemet, systemets inställningar samt köra applikationer. 

För viss typ av åtkomst, såsom att utföra vissa systemförändringar, så är det
bästa sättet att arbeta via just terminalen och kommandoraden.

## Översikt

Terminal, ibland kallat terminalfönster eller terminalemulator, är ett program för att ge kommandoradsåtkomst 
till systemet och som finns för dig som användare via menyn ***Applications -> Utilities -> Terminal***. Bilden
nedan visar grafiskt var i menyerna man hittar terminal-alternativet:

![Menyval för att starta ett terminalfönster med kommandoradsåtkomst](images/terminal-start.png "Menyval för att starta ett terminalfönster")

Programet ger kommandoradsåtkomst via en textbaserad vy. Med hjälp av denna vy och via kommandoraden, så går det
att nå och använda många program av de program som följer med operativsystemet, men som inte är direkt åtkomliga
via det grafiska användargränssnittet. Det går till exempel att skapa eller redigera filer, att automatisera
olika programsteg via att skriva såkallade "skript". 

Bilden nedan visar hur ett terminalfönster ser ut och hur en kommandoradsprompt ser ut.

![Ett terminalfönster med kommandoradsåtkomst](images/terminal-pic1.png "Ett terminalfönster")

Via terminalfönstret kan man även utföra sådana göromål som att programmera och kompilera program egna program. 
Terminalen i Linux kan liknas med kommandotolken i Windows, men den har fler funktioner. Windows motsvarighet till
en Linuxterminal är *Powershell* som också finns i moderna Windowsinstallationer.

## Användning

Via terminalen kan man köra ett antal program eller systemkommandon som gör att man
får bättre kontroll på det installerade systemet.

Terminalen kan används för att få högre rättigheter i operativsystemet för att på så sett 
ändra i program som ägs av andra användare i systemet än den grafiskt inloggade personen som
enbart kan ändra, skapa och exekvera egna program eller filer och inte alla de program och
filer som följer med operativsystemet. Den aktuella installationen använder flera 
program/tjänster som ägs av olika typer av systemanvändare i operativsystemet för att 
uppnå en bättre säkerhet. 

Främsta anledningen till att använda terminalen är för att göra ytterliggare konfiguration eller
anpassning i den aktuella installationen. Terminalen kan även användas för bland annat felsökning
eller för att byta IP-adressen på datorn.

## Få hjälp i systemet
För utom att använda denna dokumentation, så finns det några andra sätt att få hjälp i hur man kan använda systemet.

1. använda ***man***-kommandot
2. Besöka CentOS webbaserade [dokumentation].
3. Använda Google för att söka efter annan dokumentation rörande CentOS, Linux, pfSense, Snort med mera.

Att använda den medföljande systemdokumentationen, så använd man-kommandot i ett terminalfönster. Ett enkelt sätt att börja är 
att söka dokumentation om man-kommandot självt, genom att helt enkelt skriva ***man man***. Det ger en lång 
lista med information. Scrolla frammåt i dokumentationen genom att trycka på mellanslag. Om man vill avbryta listningen,
skriv bokstaven 'q', som i *quit*, för att avbryta dokumentationsvisningen och återgå till kommandotolken.

Nedanstående bild visar hur man ger kommandot "man man":

![Ett terminalfönster med kommandot man](images/terminal-man_man.png "Ett terminalfönster med mankommandot")

Nedanstående bild visar hur fönstret blir när man skrivit man-kommandot och den visar resultatet av manualsidan:

![Ett terminalfönster med kommandot man](images/terminal-man_man-pic2.png "Ett terminalfönster med mankommandot")

Dokumentationen som finns tillgänglig på CentOS webbplats är omfattande och den är också tillgänglig på flera olika 
språk, inklusive att det finns dokumentation på svenska.

Vart och ett av de programpaket som ingår i denna paketering av säkerhetsprogram har även webbplatser där det finns
dokumentation, bloggar, källkod eller annan bakgrundsinformation.

## Högre rättigheter
Normal användning av systemet och dess medföljande applikationer är via att en användare automatiskt loggas in och
den grafiska miljön starta upp. Denna användare har en begränsad åtkomst i systemet. Det gör att en mängd saker inte
är åtkomliga eller, om dom är åtkomliga, så går dom inte att ändra av användaren. Till exempel går det normalt sett
inte att skriva i vissa inställningsfiler som tillhör systemet och som innehåller systeminställningar. För att kunna
göra sådana förändringar så krävs att temporärt få utökade behörigheter i systemet.

För att få högre rättigheter i det installerade systemet kan kommandot ***sudo*** användas. 
***sudo*** kan antigen skrivas framför ett kommando som skrivs i terminalen för utföra en funktion som
kräver högre rättigheter eller så kan det användas för att byta till en annnan användare, **root**, som är det konto 
som har de högsta rättigheterna i operativsystemet. För att bli root-användare kan kommandot 

```
    sudo su
```

användas. En förfrågan efter den aktuella användarens lösenord kommer att ställas när sudo används och om rätt 
lösenord skrivs in så kommer kommandot att ske med högsta behörighet.

Nedanstående bild visar hur fönstret blir när kommandot *sudo* exekveras:

![Ett terminalfönster med kommandot *sudo*](images/terminal-sudo-pic1.png "Ett terminalfönster med sudo-kommandot")



## Textredigeringsprogram

I systemet så finns det flera textredigeringsprogram, såkallade texteditorer, installerade och tillgängliga att välja mellan. Med hjälp av dessa editorer kan en fil skapas eller ändras. Exempelvis så är programmen *VI* (även VIM som har fler funktioner än den enklare varianten VI), *Emacs* (mg) och *nano* installerat. Det går även att installera ytterliggare textediteror om någon annan editor behövs.
Personer som är vana med att arbeta i Unixmiljöer kan med största sannolikhet använda antingen *vim* eller *emacs*, de som inte är vana med någon av dessa två brukar gilla kunna komma igång snabbare med *nano* då den exempelvis har visuell beskrivning av de vanligaste kommandona. Nano visar visuellt hur programmet kan stängas av eller hur en fil sparas, vilket inte är fallet med varken VIM eller Emacs då dessa förutsätter att användaren kan de kommandon som ska användas.

### NANO
För att editera en fil med nano i terminalen så används kommandot ***nano /sök_väg/till/filen***, kommandot avslutas med *enter*. När en fil har blivit vald för att editareas så finns det hjälptext längst ner i terminalfönstret. Alla funktioner som spara eller stäng visas med exempelvis ***^X*** där **^** syftar på control(ctrl) knappen och bokstaven till den tangent som ska tryckas ner samtidigt. För att navigera runt i textdokumentet så används piltangenter.

### VIM
VIM finns installerat och kan användas, för dokumentation om hur VIM kan användas så finns det i den inbyggda dokumentation i installationen som kan visas genom kommandot ***man vim*** i ett terminalfönster.

### Emacs
*Tiny Emacs-like editor* (mg) finns installerat och kan användas för att redigera text och filer.

För dokumentation om hur man använder *mg*, så går det att nyttja den medföljande dokumentation på servern som kan visas genom kommandot ***man mg*** i ett terminalfönster.

\clearpage

