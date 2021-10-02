### --------------------------------------------------------------------
### gtkwave.tcl
### Author: Macro
### Reference: [GTKWave Automation](https://ughe.github.io/2018/11/13/gtkwave-automation)
### --------------------------------------------------------------------

# Resources:
# Manual: http://gtkwave.sourceforge.net/gtkwave.pdf#Appendix-E-Tcl-Command-Syntax
# Also see the GTKWave source code file: examples/des.tcl

# Add all signals
set nfacs [ gtkwave::getNumFacs ]
set all_facs [list]
for {set i 0} {$i < $nfacs } {incr i} {
    set facname [ gtkwave::getFacName $i ]
    lappend all_facs "$facname"
}
set num_added [ gtkwave::addSignalsFromList $all_facs ]
puts "num signals added: $num_added"

# Filled High Values
gtkwave::/View/Show_Filled_High_Values

# Left Signal
gtkwave::/View/Left_Justified_Signals

# zoom full
gtkwave::/Time/Zoom/Zoom_Full

# Print
set dumpname [ gtkwave::getDumpFileName ]
gtkwave::/File/Print_To_File PDF {Letter (8.5" x 11")} Minimal $dumpname.pdf
