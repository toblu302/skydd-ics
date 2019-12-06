# Licensiering och tillgång till programvaran

Detta kapitel beskriver licenskrav, licensformer och andra formella saker som
behövs för att uppfylla olika krav som ställs för att kunna förpacka och
tillhandahålla dessa programpaket.

### Programpaket som inte tillåter distribution

När vi inte kunnat avgöra licensformen eller där licensformen inte tillåter direkt återdistribution av programvaran, finns textbeskrivningar i distributionen som beskriver hur en användare själv kan
hämta dessa moduler eller programpaket och installera i denna modul, vilket är
acceptabelt enligt licensmodellerna.

## Licenser

En central licens som förekommer i de flesta programpaket som ingår i denna programdistribution är Gnu Public License (GPL) version 2 samt version 3. Dessa licenser finns närmare beskrivna här: [gnulicens].

### Efterlevnad av GPL-krav

För att följa de krav som Gnu Public Licenses (GPL) och varianter därav (t.ex. LGPL)
har, främst krav på tillgänglighet av källkoden, kommer denna att göras tillgänglig för allmänheten genom distribution via publika kanaler, till exempel [GitHub](https://github.com/CS-CY/skydd-ics) och via länkar på [informationssakerhet.se](https://www.informationssakerhet.se).

## Egenutvecklad kod

Paketeringen innehåller mer än enbart programvara skapad av andra parter. De skript och de
program som vi utvecklat som en del av detta projekt är släppt under GPL-licens //TODO: Ange GPL version//, vilket innebär
att vem som helst får ta del av, modifiera och vidaredistribuera källkoden så länge de vidareför dessa licenskrav
i ytterligare led mot andra personer och parter.

## Egenutvecklad dokumentation

Den dokumentation som är framtagen för detta projekt (exempelvis denna text) är fritt tillgänglig under
[Creative Commons](https://creativecommons.org/licenses/by/4.0/legalcode) Attribution 4.0 International.

Denna licens ger fria möjligheter att vidaredistribuera och att använda dokumentationen.

## Distribution

Nedan redovisas och listas olika programpaket och programdistributioner med tillhörande licenser.

### Centos Linux

CenOS och dess olika beståndsdelar består till stor del av operativsystemets kärna (Linuxkärnan), systemkommandon och verktyg, kodbibliotek, konfigurationsfiler, subsystem och applikationer. Merparten, om inte alla dessa, är licensierade under GPL. Förutom att programvarulicensen är GPL, finns följande tillägg rörande just namnet CentOS:

Från [centoslicens]

```
	You may use the Word Mark, but not the Logos, to truthfully describe
	the origin of the software that you are providing but not the software
	itself, where what you are distributing is modified official CentOS
	source code or is a build compiled from modified official CentOS
	source code.

	You may say, for example: “This software is derived from the source code
	for the CentOS distribution.” However, you may not say that the software
	is CentOS.
```
<https://www.centos.org/>


### Icinga

Larm- och övervakningsprogramvaran Icinga ingår i paketeringen. Icinga är licensierad enligt
GPL version 2.
```
	License  
	Icinga 2 and the Icinga 2 documentation are licensed under the terms
	of the GNU General Public License Version 2. You will find a copy of
	this license in the LICENSE file included in the source package.
```

För det grafiska gränssittet används icingaweb2 som även den är licenserad enligt GPL verision 2.
<https://icinga.com/>  
<https://icinga.com/docs/icinga2/latest/#license>  
<https://github.com/Icinga/icinga2/blob/master/COPYING>
<https://github.com/Icinga/icingaweb2/blob/master/COPYING>

### Snort
Snort ägs av Cisco och består av två huvudkomponenter. Dessa är detekteringsprogramvaran och en uppsättning regler. Reglerna är uppdelade i *Community Snort Rules* och *Proprietary Snort Rules*.  
Detekteringsprogramvaran och *Community Snort Rules* är [GPL]-licensierad enligt version 2.  *Proprietary Snort Rules* är licensierade enligt en speciell icke-kommersiell licens. Snorts olika licenser finns närmare beskrivna på [snortlicens].
//TODO: Synka med kommentarer från RÄTTS.

### Quickdraw
Quickdraw är en samling protokollbeskrivningar, regler och IDS/IPS-specifika beskrivningar av ICS/SCADA-protokoll.
Samlingen är framtagen av företaget DigitalBond och är släppt under så kallad MIT-licens, vilket ger stora friheter
att använda, ändra och vidaredistribuera reglerna. För mer detaljerad information, se [quickdrawlicense].
```
	The MIT License (MIT)

	Copyright (c) 2015 Digital Bond

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.
```
https://github.com/digitalbond/Quickdraw-Snort  
https://github.com/digitalbond/Quickdraw-Snort/blob/master/LICENSE

### Emerging Threats

Emerging Threats SCADA-regler är en samling protokollbeskrivningar, regler och IDS/IPS-specifika beskrivningar av ICS/SCADA-protokoll.
Samlingen är framtagen av företaget Emerging Threats Inc. Emerging Threats regler kan lyda under 2 olika licenser, GPL version 2 eller BSD.
För mer detaljerad information, se [emergingthreats].

```
	Emerging Threats

	This distribution may contain rules under two different licenses.

	Rules with sids 1 through 3464, and 100000000 through 100000908 are under the GPLv2.
	A copy of that license is available at http://www.gnu.org/licenses/gpl-2.0.html

	Rules with sids 2000000 through 2799999 are from Emerging Threats and are covered under the BSD License
	as follows:

	Copyright (c) 2003-2019, Emerging Threats
	All rights reserved.

	Redistribution and use in source and binary forms, with or without modification, are permitted provided that the
	following conditions are met:

	* Redistributions of source code must retain the above copyright notice,
	  this list of conditions and the following disclaimer.
	* Redistributions in binary form must reproduce the above copyright notice,
	  this list of conditions and the following disclaimer in the documentation
	  and/or other materials provided with the distribution.
	* Neither the name of the nor the names of its contributors may be used to
	  endorse or promote products derived from this software without specific prior
	  written permission.

	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS AS IS AND ANY EXPRESS OR IMPLIED WARRANTIES,
	INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
	DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
	SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
	SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
	WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
	USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```
<https://rules.emergingthreats.net/open/snort-2.9.0/rules/LICENSE>  
<https://opensource.org/licenses/BSD-3-Clause>  
<https://en.wikipedia.org/wiki/BSD_licenses>

### Snorby

Programvaran *Snorby* som ingår som en komponent i IDS-lösningen Snort är licensierad enligt GPL version 3.
Det medför därmed inga problem att vidaredistribuera snorbykomponenten i plattformen.  
För mer information, se [snorbylicens].

```
	Snorby - All About Simplicity.

	Copyright (c) 2013 Threat Stack, Inc (support@threatstack.com)

	Snorby is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	Snorby is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with Snorby.  If not, see <http://www.gnu.org/licenses/>.

	Neither the names of Licensor, nor the names of any contributors to
	the Original Work, nor any of their trademarks or service marks, may
	be used to endorse or promote products derived from this Original Work
	without express prior permission of the Licensor. No license is granted
	to the trademarks of Licensor even if such marks are included in the
	Original Work.

	The above copyright notice and this permission notice shall be included
	in all copies or substantial portions of the Software. Not limited to but
	including the Software's footer, Web URL and Author Names.

	**Notice**
	The snorby source code is 100% free and open source however we use highcharts
	for metrics and reporting. Please make sure you review the
	[highcharts](http://www.highcharts.com) licensing in detail
	[here](http://www.highcharts.com/license). The license above
	only applies to snorby source code (contact the Dustin Willis
	Webber if you have futher questions).
```
<https://github.com/Snorby/snorby>  
<https://github.com/Snorby/snorby/blob/master/LICENSE>


Snorby innehåller en komponent kallad "highcharts" som är licensierad enligt Creative Common
Attribution Non-commercial för redistribution i icke vinstdrivande syfte. För mer information, se [CCBYNC3]  
<https://www.highcharts.com/>  
<https://www.highcharts.com/license>  
//TODO: Kan vi verkligen använda denna komponent?
(https://shop.highsoft.com/faq#Non-Commercial-0). Förslag från Joachim är att ha komponenten avaktiverad från start och användarna får välja om den ska aktiveras.

### Barnyard

Programvaran Barnyard som ingår som en komponent i IDS-lösningen Snort är licensierad enligt GPL2.
Det medför därmed inga problem att vidaredistribuera Barnyardkomponenten i plattformen.

För mer information, se [barnyardlicens].  
<https://github.com/firnsy/barnyard2>
<https://github.com/firnsy/barnyard2/blob/master/LICENSE>

### Tcpdump

Vi har använt oss av programvaran tcpdump för att kunna spela in nätverkstrafik.
Tcpdump använder sig av en så kallad *3-clause BSD license*, vilket är en väldigt
öppen och flexibel mjukvarulicens.

För detaljinformation om programvarans licensbestämmelser, se [tcpdumplicens].  
<http://www.tcpdump.org/>  
<http://www.tcpdump.org/license.html>  

### OSA ikoner

Flera av diagrammen i dokumentationen använder sig av ikoner från OSA [Icon Library](https://www.opensecurityarchitecture.org/cms/library/icon-library). OSA tillhandahåller ikonerna och övrigt material på <https://www.opensecurityarchitecture.org> enligt 	[Creative Commons](https://creativecommons.org/licenses/by-sa/3.0/) share-alike.
För mer information se [OSA-licens](https://www.opensecurityarchitecture.org/cms/about/license-terms).

\clearpage
