### --------------------------------------------------------------------
### gtkwave.tcl
### Author: Macro
### Reference: [GTKWave Automation](https://ughe.github.io/2018/11/13/gtkwave-automation)
### --------------------------------------------------------------------

# Resources:
# Manual: http://gtkwave.sourceforge.net/gtkwave.pdf#Appendix-E-Tcl-Command-Syntax
# Also see the GTKWave source code file: examples/des.tcl

# Get env
set dumpname [ gtkwave::getDumpFileName ]
set dmt [ gtkwave::getDumpType ]
set nfacs [ gtkwave::getNumFacs ]

# Put env
puts "number of signals in dumpfile '$dumpname' of type $dmt: $nfacs"
set filterCondition "*.*.*"

# Add all signals
set all_facs [list]
set dup_sig [list]

for {set i 0} {$i < $nfacs } {incr i} {
    set facname [ gtkwave::getFacName $i ]
    if {[ string match $filterCondition $facname]} {
        lappend dup_sig "$facname"
    } else {
        lappend all_facs "$facname"
    }
    puts "$i: $facname"
}

# Add all signal
gtkwave::addSignalsFromList $all_facs

# Delete duplicate signal
gtkwave::deleteSignalsFromListIncludingDuplicates $dup_sig

# Filled High Values
gtkwave::/View/Show_Filled_High_Values

# Left Signal
#gtkwave::/View/Left_Justified_Signals
gtkwave::setLeftJustifySigs on

# zoom full
gtkwave::/Time/Zoom/Zoom_Full

# Print
#gtkwave::/File/Print_To_File PDF {Letter (8.5" x 11")} Minimal $dumpname.pdf
gtkwave::/File/Print_To_File PDF {A4 (11.68" x 8.26")} Minimal $dumpname.pdf
