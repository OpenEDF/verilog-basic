# Copyright (C) 1994-2016 Synopsys, Inc. This Synopsys software and all associated documentation are proprietary to Synopsys, Inc. and may only be used pursuant to the terms and conditions of a written license agreement with Synopsys, Inc. All other use, reproduction, modification, or distribution of the Synopsys software or the associated documentation is strictly prohibited.
############### RUN_VIVADO.TCL ##################
### Purpose: Default TCL script for Integrated 
### Vivado Place and Route run.
### Target Vivado Release: Vivado 2016.3/Vivado 2017.2/Vivado 2018.1
### History: 
### Added Switch statements for Strategy mode to replace If statements
### Added write_bitstream_enable variable to enable/disable bitstream generation
### Added Property to Promte/Demote Warning/Error message 
### Improved Incremental Flow commands for readability
### $Header: //synplicity/uirc/misc/run_vivado_template.tcl#60 $
### End History
################################################# 	
#################################################
###     SET DESIGN VARIABLES      ###
#################################################
set DesignName  	"idc_test"
set FamilyName  	"KINTEX7"
set DeviceName  	"XC7K325T"
set PackageName 	"FBG676"
set SpeedGrade  	"-2"
set TopModule   	"led_stream"
set PartName    	"XC7K325TFBG676-2"
set DcpFile			""
set VivadoOptionFiles ""
set InputMode   	"EDIF"
set Flow			"Standard" ;#Flow can be set to "Incremental" or "Standard"
set StrategyMode	"default";
#StrategyMode can be set to "timing_qor","fast_turn_around" or "default" 
#Only one StrategyMode can be specified at a time

#################################################
###     SETUP STRATEGY AND FLAGS    ###
#################################################
puts "StrategyMode is ${StrategyMode}"
switch -- $StrategyMode {
    "timing_qor" {
        set opt_design_flags    "-directive Explore"
        set place_design_flags  "-directive Explore"
        set route_design_flags  "-directive Explore"
    }
    "fast_turn_around" {
        set opt_design_flags    "-directive RuntimeOptimized"
        set place_design_flags  "-directive RuntimeOptimized"
        set route_design_flags  "-directive RuntimeOptimized"
    }
    default {
        set opt_design_flags    ""
        set place_design_flags  ""
        set route_design_flags  ""
    }
}
set write_bitstream_enable  "0"

#Adding additional steps to modify read_xdc and link_design due to Vivado Buffer constraint issue (Xilinx CR-981618) with Vivado version 201[7|8].[1|2|2.1|3|3.1|4]
# Rename 
if {[regexp {^201[7-8]\.[1-4].*} [version -short]]} {
set XdcList {}
catch {rename read_xdc read_xdc_vivado}
catch {rename link_design link_design_vivado}

proc read_xdc { xdc } {
                global XdcList
                puts "Appending $xdc to xdclist"
                lappend XdcList $xdc
}

proc link_design { args } {
                global XdcList
                puts "Evaluating link_design"
                eval link_design_vivado $args
                if {"$XdcList"==""} { 
                puts "No xdc file to read"
                } else {
                puts "Reading xdc $XdcList"
                read_xdc_vivado $XdcList
                }
                puts "Restoring original commands"
                rename read_xdc ""
                rename link_design ""
                rename read_xdc_vivado read_xdc
                rename link_design_vivado link_design
                set XdcList {}
}
}

#################################################
###     SETUP DESIGN     ###
#################################################
set_property target_part ${PartName} [current_fileset -constrset]
set_property design_mode GateLvl [current_fileset]

### Turn off a restriction on the number of clock objects allowed in a list for create_*clock commands
catch {set_param sta.maxSourcesPerClock -1}

### Suppresses warning about multiple objects in a clock list
catch {set_msg_config -id {Constraints 18-633} -suppress}

### Suppresses warning about changing SEVERITY below
catch {set_msg_config -id {Vivado 12-4430} -suppress}

### Demotes error to warning about GTGREFCLK_ACTIVE inserted for multiview instrumentation
catch {set_property SEVERITY {warning} [get_drc_checks REQP-46]}
catch {set_property SEVERITY {warning} [get_drc_checks REQP-56]}

### Promotes critical warning on unroutability to an error
catch {set_msg_config -id {Route 35-162} -new_severity ERROR}

if {${InputMode} == "EDIF"} {
     set_property edif_top_file ${DesignName}.edf [current_fileset]
     if {[file exists ${DesignName}.edf]} { read_edif ${DesignName}.edf }    
     if {[file exists ${DesignName}_edif.xdc]} { read_xdc ${DesignName}_edif.xdc } 
     if {[file exists ${DesignName}_floorplan.xdc]} { read_xdc ${DesignName}_floorplan.xdc }   
     set TopModule [find_top]
} 

if {${InputMode} == "VM"} {
     if {[file exists ${DesignName}.vm]} { read_verilog ${DesignName}.vm }    
     if {[file exists ${DesignName}.xdc]} { read_xdc ${DesignName}.xdc }  
     if {[file exists ${DesignName}_floorplan.xdc]} { read_xdc ${DesignName}_floorplan.xdc }  
     set TopModule [find_top]
     set_property top ${TopModule} [current_fileset] 
}

#################################################
###     SOURCE OPTION FILES IF THEY EXISTS ###
#################################################
foreach parOptionFile $VivadoOptionFiles {
	if {[file exists $parOptionFile]} {
		source $parOptionFile
	}
}

#################################################
###    RUN DESIGN     ###
#################################################
#run link_design
link_design
if {[file exists "clock_groups.tcl"]} {source clock_groups.tcl}
#Evaluate options and run opt_design
eval opt_design $opt_design_flags

###     FOR INCREMENTAL FLOW     ###
puts "Flow is ${Flow}"
if {${Flow} == "Incremental"} {
	#Use DCP from previous P&R run for Incremental Flow
	if {[file exists "${DesignName}.dcp"]} {
	puts "Using ${DesignName}.dcp for Incremental Place and Route" 
	read_checkpoint -incremental ${DesignName}.dcp
	report_incremental_reuse
	} else {
	puts "${DesignName}.dcp does not exist. Running Place and Route" 
	}
}
#Evaluate options and run place_design
eval place_design $place_design_flags
write_checkpoint -force post_place.dcp

if {${StrategyMode} == "timing_qor"} {
#run phys_opt_design
phys_opt_design
write_checkpoint -force post_place_phys_opt.dcp
}
	
#Evaluate options and run route_design
eval route_design $route_design_flags
#set_property BITSTREAM.General.UnconstrainedPins {Allow} [current_design]
write_checkpoint -force ${DesignName}.dcp

if {${StrategyMode} == "timing_qor"} {
#run phys_opt_design
phys_opt_design
write_checkpoint -force post_route_phys_opt.dcp
}

#################################################
###     GENERATE REPORTS     ###
#################################################
report_utilization -file area.txt
report_utilization -slr -file slr.txt
report_timing_summary -setup -nworst 3 -max_paths 3
report_timing_summary -hold  -nworst 3 -max_paths 3
report_clock_utilization -verbose -file clock_utilization.txt
report_io -file pinloc.txt
report_drc -file post_route_drc.txt
report_clock_interaction -file ${DesignName}_clock_interaction.rpt 
write_xdc -no_fixed_only -constraints valid -exclude_timing -force ${DesignName}_post_par.xdc

#################################################
###     SAVE VIVADO PROJECT     ###
#################################################
save_project_as -force ${DesignName}
save_constraints_as ${DesignName}_vivado

#################################################
###     GENERATE BITSTREAM     ###
#################################################
if {${write_bitstream_enable} == "1"} {
	### Xilinx recommends to turn off multi-threading for write_bitstream 
	if {[regexp {^2016\.[123].*} [version -short]]} { set_param bitgen.maxThreads 1 }
	if { (${DeviceName} == "XCKU040") || (${DeviceName} == "XCVU440") } {
		set_property BITSTREAM.CONFIG.OVERTEMPSHUTDOWN {Enable} [current_design]
	} else {
		set_property BITSTREAM.CONFIG.OVERTEMPPOWERDOWN {Enable} [current_design]
	}
	set_property BITSTREAM.GENERAL.COMPRESS {True} [current_design]
	#run write_bitstream
	write_bitstream -force ${DesignName}.bit
}
