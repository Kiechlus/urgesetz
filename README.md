# Scannen und setzen eines Buches
Dieses Beispiel zeigt, wie ich ein Buch gescannt und wieder ein pdf daraus erstellt habe. Die folgende Tabelle zeigt eine Übersicht der verwendeten Technologien.

|Name |Beschreibung   |
|---|---|
|  tesseract |  Kostenloses OCR Programm um aus Bilddateien (.tiff) Text (.txt) zu erstennen.|
|VIM   | Beliebter Editor in UNIX zur Bearbeitung des Rohtexts. Stattdessen kann jeder andere Editor oder jede Skriptsprache verwendet werden, die mit "regular expressions" zurecht kommen.   |
|Latex  |Setzen des Buches zum Erstellen von pdf.   |

## Scannen

Es tut wohl jeder Scanner. Die großen Büroscanner erleichtern einem die Arbeit, weil sie sehr schnell sind und automatisiert mehrere Seiten an eine Emailadresse versenden können. Man braucht nur noch umblättern und auf Scannen drücken. 500 Seiten lassen sich so in einer Stunde bewerkstelligen.

|Einstellung |Beschreibung   |
|---|---|
|  tiff |  Als Outputformat des Scanners müssen .tiff Bilder verwendet werden. Die einzelnen Bilder oder Junks von Bildern am besten mit 1.tiff, 2.tiff, ... durchnummerieren.|
|400 dpi   | Diese feine Auflösung hat sich zum Scannen von schwarzweiß Büchern als optimal herausgestellt.  |
|Format |Wähle das richtige Format, falls der Scanner das unterstützt. Für ein A5 Buch wähle zum Beispiel A4 Querformat.|

## Aus Bildern Text erstellen

Texte müssen heute nicht mehr abgetippt werden. Sogenannte OCR Programme analysieren Bilder, die Text enthalten (Scan eines Buches) und erstellen daraus einen Rohtext.

### Optical Character Recognition (OCR)
Die kostenlose OCR Software ["Tesseract"](https://de.wikipedia.org/wiki/Tesseract_(Software)) von google liefert sehr gute Ergebnisse.

### Bearbeiten des Rohtextes

## Setzen

https://www.sharelatex.com/project/590b352cd50983d3138d1865