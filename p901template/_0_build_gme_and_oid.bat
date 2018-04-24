:: Set shape of the generated OID PNGs. Possible choices:
::
:: Default: Generate red boxes:
set SHAPE=--shape box
:: Generate custom box with a coloured border. All dimensions in 1/10 mm:
:: set SHAPE=--shape box:WIDTH:HEIGHT:BORDER_WIDTH:BORDER_COLOR
:: Generate shape from file in ogg2gme/data directory (e.g. --shape stern_gelb.gif):
:: set SHAPE=--shape FILE
::
:: Examples:
:: Default: Generate red boxes, 1.6 cm x 1.6 cm, 1 mm border width:
:: set SHAPE=--shape box:160:160:10:red
:: Generate blue boxes, 3 cm x 1 cm, border width 0.1 mm (2 pixels at 600 dpi):
:: set SHAPE=--shape box:300:100:1:blue
:: Generate yellow stars:
:: set SHAPE=--shape stern_gelb.gif
::
..\ogg2gme\ogg2gme.py -t --num-columns 3 --num-start-oid 3 --dpi 600d --num-additional-oids 10 -v %SHAPE%
if NOT ["%errorlevel%"]==["0"] pause
