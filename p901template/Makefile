# Set shape of the generated OID PNGs. Possible choices:
SHAPE=                               # Default: Generate red boxes.
#SHAPE="--shape box:WIDTH:HEIGHT:BORDER_WIDTH:BORDER_COLOR"   # All dimensions in 1/10 mm.
#SHAPE="--shape FILE"                  # Where file is a file in the ogg2gme/data directory (e.g. --shape stern_gelb.gif).

# Examples:
#SHAPE="--shape box:160:160:10:red"    # Default: Generate red boxes, 1.6 cm x 1.6 cm, 1 mm border width.
#SHAPE="--shape box:300:100:1:blue"    # Generate blue boxes, 3 cm x 1 cm, border width 0.1 mm (2 pixels at 600 dpi).
#SHAPE="--shape stern_gelb.gif"        # Generate yellow stars.


# Commands and options:
OGG2GME = ../ogg2gme/ogg2gme.py
OID_CMD = $(OGG2GME) -t --num-columns 3 --num-start-oid 3 --dpi 600d --num-additional-oids 10 -v


# Default target when invoking 'make'.
default: gme


# Print usage.
usage:
	@echo "make gme     (Rebuild just the *.gme file. Fast.)"
	@echo "make oid     (Rebuild the *.gme file and thge OID *.png files. Slow.)"
	@echo "make clean   (Remove automatically generated files, but keep the generated *.yaml files.)"


# Rebuild the *.gme file. Do not rebuild the OID PNGs. This is fast.
gme:
	$(OGG2GME)


# Rebuild the *.gme file and also rebuild the OID PNGs. This is slow.
oid:
	$(OID_CMD) $(SHAPE)


# Remove all automatically generated output files.
# Note: Especially the *.codes.yaml file must never be deleted as it contains the binding
# of the OID IDs with the scripts.#
clean:
	rm -rf oid_box oid_orig _oid-table*.png _p*.gme STOP.ogg *~


# These targets do not generate a file with the name of the target.
.PHONY: default usage gme oid clean

