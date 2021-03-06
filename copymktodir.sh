#!/bin/bash
#
# Macro test
# Written for Digital Design and FPGA learn
#
#variables!
mkfile=./tools/builder/Makefile
TARFILE=$1
#find or new file
echo "Destination path: $TARFILE"
if [ ! -e ./$TARFILE ]; then
	echo "$TARFILE not found! But system will NEW $TARFILE"
	mkdir ./$TARFILE
fi

#copy the file
echo "Copying iVerilog Makfile"
if [ -r $mkfile ]; then
	cp $mkfile ./$TARFILE
	chmod u+w ./$TARFILE/Makefile
	echo "Makefile copied"
	cd ./$TARFILE
	$SHELL	#exit to current directory
else
	echo "You don't have the Makefile at $mkfile"
fi
############## END ##############
