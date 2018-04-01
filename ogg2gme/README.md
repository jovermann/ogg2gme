# ogg2gme
Convert a set of OGG audio files into a GME file suitable for Ravensburgers TipToi pen, and into a set of OID patterns which are recognized by this pen.

German README:

Mit diesem Paket kann man den TipToi Stift ohne gro�en Aufwand selbst
besprechen, z.B. zur Nachvertonung normaler B�cher.
Der Fokus liegt auf einfacher Bedienbarkeit.

Man muss nur Samples aufnehmen und per Doppelklick eine Batch-Datei
starten um eine GME-Datei f�r den Stift und OID-Etiketten zum Ausdrucken zu
erzeugen.

Der TipToi Stift spielt dann beim Zeigen auf einen bestimmtes OID-Etikett
immer das zugeordnete Sample ab. Dies eignet sich zum Beispiel, um normale
(Bilder-)B�cher nachtr�glich zu vertiptoien und zu vertonen, oder f�r
Weihnachtsgeschenk-Etiketten oder �hnliches.

F�r kompliziertere Projekte (mit Registern etc, z.B. Spiele) kann die
generierte YAML Datei von Hand editiert werden. Sie wird beim hinzuf�gen von
weiteren Samples und beim erneuten Generieren nicht �berschrieben.

Grundlage f�r dieses Paket ist tttool (Tip-Toi-Tool) von Joachim Breitner.
Siehe http://tttool.entropia.de.


# Installation

Die folgenden Programme m�ssen installiert sein 
(siehe Verzeichnis 'software' wenn vorhanden):
- Python 2.7 (wird vom oid2gme.py Skript gebraucht)
- ImageMagick (wird zum Erzeugen der OID-Etiketten gebraucht)
- Audacity (wird zum Aufnehmen der Samples gebraucht)
- Gimp (kann zum Ausdrucken bei exakt 600dpi verwendet werden)

Audacity bitte wie folgt konfigurieren:
Edit -> Preferences:
- Devices -> Channels -> 1 (Mono)
- Recording -> Overdub ausschhalten
- Quality -> Default Sample Rate -> 22050 Hz
- Quality -> Default Sample Format -> 16-Bit
- Tracks -> Default View Mode: Waveform (dB)
- Import / Export -> Show Metadata Editor prior to export step ausschalten
- Aufnahmelautst�rke immer auf Maximum

Beim Speichern von Samples beachten:
- Um ein Sample zu speichern muss man 'Export Audio ...' (Ctrl+Shift+E) 
  benutzen.
- OGG Format zum speichern verwenden (Audacity merkt sich das).
- Evtl. vor dem Speichern Effect -> Normalize ... -> Ok w�hlen um die 
  Lautst�rke zu maximieren.


# Neues Projekt erstellen

1. Das Projekt-Verzeichnis p901template kopieren und die Kopie wie folgt
umbenennen:
- Das "p" am Anfang bitte so lassen.
- "901" durch eine beliebige Zahl zwischen 900 und 970 einschliesslich
  ersetzen.
  Verschiedene Projekte m�ssen verschiedene Nummern haben, um gleichzeitig 
  auf dem selben Stift sein zu k�nnen.
- "template" durch den Projektnamen ersetzten.
- Keine Leerzeichen oder Sonderzeichen verwenden. Unterstrich ist erlaubt.
- In dieses Verzeichnis m�ssen alle Samples gespeichert werden
  (Projekt-Verzeichnis).

2. _welcome.ogg aufnehmen:
Mit Audacity das Anschalt-Sample aufnehmen und unter "_welcome.ogg" im
Projekt-Verzeichnis abspeichern. Dieses Sample wird abgespielt, wenn man auf
das Anschalt-Etikett (gr�ner Kreis) tippt.

(Hier sollte man keine wichtigen Sachen (z.B. Anleitung abspielen, da man 
das Anschalt Sample nach dem anschalten nie wieder abspielen kann, es sei 
denn man f�gt auch eine normale OID zum abspielen hinzu. Der Titel vom 
Buch ist z.B. sinnvoll.)

3. Samples aufnehmen:
Mit Audacity beliebig viele Samples f�r die einzelnen OID-Etiketten
aufnehmen und im Projekt-Verzeichnis speichern. Die Namen der Samples
(*.ogg Dateien) d�rfen nur Buchstaben, Zahlen und Unterstriche enthalten und
m�ssen mit einem Buchstaben beginnen.

4. GME-Datei und/oder OID-Tabelle generieren:
Doppelklick auf:
- build_gme.bat:
  Generiert nur die GME-Datei neu (geht schnell, 1 Sek.). Oder:
- build_gme_and_oid.bat:
  Generiert die GME-Datei und die OIDs (_oid-table0.png) (dauert ca. 1 
  Minute). Auf der OID-Tabelle sind immer mehr OID-Etiketten, als f�r die 
  Samples ben�tigt werden. Dadurch kann man sp�ter noch Samples hinzuf�gen 
  und die GME-Datei neu generieren, ohne neue OID-Etiketten drucken zu m�ssen.

5. GME-Datei auf den Stift kopieren:
- Stift mit Mini-B-USB Kabel and den Computer anschliessen
- Stift anschalten
- GME-Datei auf den Stift kopieren
- Stift auswerfen
- Kabel vom Stift abziehen und ausschalten

6. OIDs drucken:
(Muss nur beim ersten Durchlauf gemacht werden, oder wenn sehr viele Samples 
hinzugef�gt wurden.)
- Gimp starten.
- Datei _oid-table0.png �ffnen.
- File -> Print ...
- Page Setup -> Orientation -> Portrait
- Image Settings -> X resolution auf 600 stellen (Y resolution geht dann
  automatisch auf 600).
- Evtl. Qualit�t auf 600x600 dpi stellen.
- Drucken.

7. Weitere Samples hinzuf�gen:
- Schritte 3-4 (bzw. 3-5 oder 3-6) k�nnen beliebig oft wiederholt werden.
- Bereits zugewiesene OIDs werden dadurch nicht ver�ndert. OID-Etiketten
  m�ssen nach dem Hinzuf�gen von Samples nicht neu ausgedruckt werden
  (nur wenn weitere OID-Etiketten ben�tigt werden).

Konfigurations-Optionen zum Generieren der OIDs, siehe build_gme_and_oid.bat:
  -S NUM_START_OID, --num-start-oid=NUM_START_OID
                        For -t/--build-oid-table: Generate N START and N STOP
                        OIDs (e.g. to re-use the same product id for multiple
                        projects). Default is 3.
  -C NUM_COLUMNS, --num-columns=NUM_COLUMNS
                        For -t/--build-oid-table: Arrange OID labels in N
                        columns on each page. Default is 3.
  -N NUM_ADDITIONAL_OIDS, --num-additional-oids=NUM_ADDITIONAL_OIDS
                        For -t/--build-oid-table: This tool always fills whole
                        pages with additional OIDs (additional to the OIDs for
                        the named OIDs from the *.yaml file). This parameter
                        sets the minimum amount of additional OIDs. Default is
                        10.
  -d DPI, --dpi=DPI     For -t/--build-oid-table: DPI setting for tttool, used
                        to generate the OIDs. Must be either 600, 600d, 1200
                        or 1200d. The d variants double the pixel size.
                        Default is 600d.
  -p PRODUCT_ID, --product-id=PRODUCT_ID
                        Set product-id. This only has an effect when
                        generating the *.yaml file for the first time. Once
                        the *.yaml file exists please edit the product-id in
                        the *.yaml file directly.
  -s SHAPE, --shape=SHAPE
                        Set shape for objects. Must be either box (default) or
                        one of the files in 'data' (anleitung_gelb.gif
                        play_gelb.gif stern_gelb.gif stern_orange.gif).


# Siehe auch

- http://tttool.entropia.de
- https://github.com/entropia/tip-toi-reveng
- example.yaml


