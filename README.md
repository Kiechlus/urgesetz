# Scannen und setzen des Buches
Dieses Beispiel zeigt, wie ein Buch gescannt und daraus ein pdf bzw. ein Ebook erstellt wird. Folgende Programme wurden verwendet:

|Name |Beschreibung   |
|---|---|
|  tesseract |  Kostenloses Programm zur Texterkennung, um aus Bilddateien (.tiff) Textdateien (.txt) zu erstellen.|
|Vim   | Beliebter Editor in UNIX zur Bearbeitung des Rohtexts. Stattdessen können jeder andere Editor oder jede Skriptsprache verwendet werden, die mit "regular expressions" zurecht kommen.   |
|Latex  |Setzen des Buches zum Erstellen von pdf.   |

**Inhalt**
1. [Scannen](#scannen)
2. [Texterkennung](#aus-bildern-text-erstellen)
3. [Setzen](#setzen)



## Scannen

Es tut wohl jeder Scanner. Die großen Büroscanner erleichtern einem die Arbeit, weil sie sehr schnell sind und automatisiert 
mehrere Seiten an eine Emailadresse versenden können. Man braucht nur noch umblättern und auf Scannen drücken. 500 Seiten 
lassen sich so in einer Stunde oder schneller bewerkstelligen.

|Einstellung |Beschreibung   |
|---|---|
|  tiff |  Als Outputformat des Scanners müssen .tiff Bilder verwendet werden. Die einzelnen Bilder oder Junks von Bildern am besten mit 1.tiff, 2.tiff, ... durchnummerieren.|
|400 dpi   | Diese feine Auflösung hat sich zum Scannen von schwarzweiß Büchern als optimal herausgestellt.  |
|Format |Wähle das richtige Format, falls der Scanner das unterstützt. Für ein A5 Buch wähle zum Beispiel A4 Querformat. So können immer zwei Buchseiten auf einmal gescannt werden.|

## Aus Bildern Text erstellen

Texte müssen heute nicht mehr abgetippt werden. Texterkennungsprogramme analysieren Bilder, die Text enthalten 
(Scan eines Buches) und erstellen daraus einen Rohtext.

### Texterkennung, engl. "Optical Character Recognition" (OCR)
Die kostenlose OCR Software ["Tesseract"](https://de.wikipedia.org/wiki/Tesseract_(Software)) von Google liefert sehr 
gute Ergebnisse. Die folgenden Anweisungen zeigen die Installation und Handhabung von Tesseract unter UNIX. Die Software 
ist jedoch auch für [Windows erhältlich](https://github.com/TesseractTeam/Tesseract/wiki/Installation-on-Windows).

#### Installation

* `sudo apt-get install tesseract-ocr`
* `sudo apt-get install tesseract-ocr-deu` Für deutsche Texte.

#### Handhabung

* Einzelnes Bild: `tesseract /path/to/image.tif output -l deu`. <br> Befinden wir uns im Ordner der 
gescannten Dateien, würde der Befehl <nobr>`tesseract 1.tif 1 -l deu`</nobr> aus der tif-Datei mit dem 
Namen `1.tif` eine Textdatei `1.txt` erstellen. Die language option `-l deu` legt fest, dass es sich um einen deutschen 
Text handelt (ohne werden z.B. keine Umlaute erkannt).
* Menge von Bildern:  `for i in {1..20}; do tesseract $i.tif $i -l deu; done` . <br>
  Angenommen, in einem Ordner befinden sich 20 tif-Dateien benannt mit 1.tif, 2.tif, ..., 20.tif. Dieser Befehl würde daraus 
  20 Textdateien mit dem erkannten Text erstellen.
* Zusammenfügen aller Textdateien in einem Ordner: `cat *.txt > mein_Buch.txt`.


### Bearbeiten des Rohtextes

OCR mit _tesseract_ funktioniert erstaunlich gut. Trotzdem kommt es zu Fehlern und außerdem müssen Silbentrennungen entfernt 
werden. Mithilfe sogenannter **Regulärer Ausdrücke** (engl. regular expressions) kann man hier viel erreichen. 

Im einfachsten Fall ist ein regulärer Ausdruck wie eine normale Textsuche. Zum beispiel würde `/haus/` das "haus" in Baumhaus finden. 
Mit regulären Ausdrücken kann jedoch nach jedem erdenklichen Muster in Texten gesucht werden. Zum Beispiel würde `/[Hh]aus/` 
sowohl auf Haus, wie auch auf Baumhaus passen.

[Diese Datei](./replacements.txt) zeigt alle regulären Ausdrücke, die zur Verbesserung des Rohtextes verwendet wurden. 
Es sind [Ersetzungsbefehle](http://vim.wikia.com/wiki/Search_and_replace) für den Texteditor _Vim_, die darin enthalten 
regulären Ausdrücke können jedoch auch in anderen Editoren oder in Programmiersprachen verwendet werden. 

|Regulärer Ausdruck |Beschreibung   |
|---|---|
| `%s/2u/zu/g`|Ersetze _2u_ mit _zu_ im ganzen Dokument.|
|`%s/und\./und/g`|Ersetze _und._ mit _und_ im ganzen Dokument. Da der Punkt in regulären Ausdrücken für jedes Zeichen steht, muss mit "\\" escaped werden, um den wirklichen Punkt zu suchen.| 
|`%s/\([a-zA-Z]\)1\([a-zA-Z]\)/\1i\2/g`|Oftmals erkannte tesseract innerhalb von Wörtern ein _i_ fälschlicherweise als _1_. Das wollen wir natürlich nicht, können aber auch nicht pauschal alle einsen mit _i_ ersetzen. Dieser Ausdruck sucht deshalb nach Wörtern die eine eins zwischen zwei Buchstaben haben und ersetzt diese entsprechend. Die runden Klammern in _([a..z])_ sind sogenannte "capture groups", die das gesuchte Zeichen speichern und die beim ersetzen mit _\\1_ (=1. capture group) referenziert werden können. Somit wird zum Beispiel _e1n_ zu _ein_ und _h1n_ zu _hin_.|
|<nobr>`%s/\([^ ]\+\)[-—«»"]\n\([^ ]\+\)/\r\1\2/g`</nobr>|Silbentrennungen sollen entfernt werden, und zwar so, dass vor dem getrennten Wort ein neuer Absatz eingefügt wird. Hier wird nach Wörtern gesucht, die eines der Trennzeichen _[-—«»"]_ gefolgt von einem Absatz enthalten. Das Trennzeichen wird entfernt und stattdessen wird vor dem Wort ein neuer Absatz eingefügt.|


## Setzen

Zum Setzen des Buches, also zur Erstellung von pdf oder andreren Formaten aus reinem Text, wird **Latex** verwendet.
Prinzipiell könnte man auch Word verwenden, das führt jedoch zu unschönerem Ergebnis und der Prozess ist nervenaufreibender.

Dank [Sharelatex](www.sharelatex.com) entfällt die manchmal aufwendige Latex Installation. Der Latex Satz dieses Beispielprojekts kann
hier im lesenden Modus abgerufen werden: https://www.sharelatex.com/project/590b352cd50983d3138d1865 . Die Datai _00_book.tex_ ist das 
 Hauptdokument, indem die meisten Einstellungen zu finden sind und von dem aus der eigentliche Text verlinkt ist (Referenzen
 zu anderen .tex Dataien).
 
 Die wichtigsten Befehle werden direkt als Kommentar erklärt (work-in-progress).