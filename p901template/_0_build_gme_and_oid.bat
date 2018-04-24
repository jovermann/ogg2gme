rem Set shape of the generated OID PNGs. Possible choices:
set SHAPE=""                              rem Default: Generate red boxes.
rem set SHAPE="--shape box:WIDTH:HEIGHT:BORDER_WIDTH:BORDER_COLOR"   rem All dimensions in 1/10 mm.
rem set SHAPE="--shape FILE"                  rem Where file is a file in the ogg2gme/data directory (e.g. --shape stern_gelb.gif).

rem Examples:
rem set SHAPE="--shape box:160:160:10:red"    rem Default: Generate red boxes, 1.6 cm x 1.6 cm, 1 mm border width.
rem set SHAPE="--shape box:300:100:1:blue"    rem Generate blue boxes, 3 cm x 1 cm, border width 0.1 mm (2 pixels at 600 dpi).
rem set SHAPE="--shape stern_gelb.gif"        rem Generate yellow stars.

..\ogg2gme\ogg2gme.py -t --num-columns 3 --num-start-oid 3 --dpi 600d --num-additional-oids 10 -v %SHAPE%
if NOT ["%errorlevel%"]==["0"] pause
