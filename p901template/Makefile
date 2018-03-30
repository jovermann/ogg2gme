
default: gme

gme:
	../ogg2gme.py
        
oid:
#	../ogg2gme.py -t --num-columns 3 --num-start-oid 3 --dpi 600d --num-additional-oids 10
#	../ogg2gme.py -t --num-columns 3 --num-start-oid 3 --dpi 600d --num-additional-oids 10 --shape box:300:100:1:blue
	../ogg2gme.py -t --num-columns 3 --num-start-oid 3 --dpi 600d --num-additional-oids 10 --shape box:100:300:1:blue
#	../ogg2gme.py -t --num-columns 3 --num-start-oid 3 --dpi 600d --num-additional-oids 10 --shape box:160:160:10:red
        
clean:
	rm -rf oid_box oid_orig _oid-table*.png _p*.gme STOP.ogg *~

.PHONY: default gme oid clean
