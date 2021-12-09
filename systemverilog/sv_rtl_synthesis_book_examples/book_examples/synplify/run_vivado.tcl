	
#################################################
###     SET DESIGN VARIABLES      ###
#################################################
set DesignName  	"proj_1"
set FamilyName  	"VIRTEX7"
set DeviceName  	"XC7VX485T"
set PackageName 	"FFG1157"
set SpeedGrade  	"-1"
set TopModule   	""
set PartName    	"XC7VX485TFFG1157-1"
set InputMode   	"EDIF"
set Flow   		"Standard" ;#Flow can be set to "Incremental" or "Standard"


#################################################
###     SETUP DESIGN     ###
#################################################
set_property target_part ${PartName} [current_fileset -constrset]
set_property design_mode GateLvl [current_fileset]

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
###    RUN DESIGN     ###
#################################################
link_design
if {[file exists "clock_groups.tcl"]} {source clock_groups.tcl}
opt_design -retarget

if {${Flow} == "Incremental"} {
	puts "Flow is ${Flow}"

	if {[file exists "post_route.dcp"]} {
	puts "post_route.dcp exists. Running Incremental Placer"
	read_checkpoint -incremental post_route.dcp
	report_incremental_reuse
	place_design -incremental post_route.dcp} else {

	puts "post_route.dcp does not exist. Running Placer" 
	place_design}

	write_checkpoint -force post_place
 
	if {[file exists "post_route.dcp"]} {
	puts "post_route.dcp exists . Running Incremental Routing" 
	route_design -incremental} else {

	puts "post_route.dcp does not exist. Running Routing" 
	route_design}

	#set_property BITSTREAM.General.UnconstrainedPins {Allow} [current_design]
	write_checkpoint -force post_route

} elseif {${Flow} == "Standard"} {
	puts "Flow is ${Flow}"
	place_design 
	write_checkpoint -force post_place
	route_design
	#set_property BITSTREAM.General.UnconstrainedPins {Allow} [current_design]
	write_checkpoint -force post_route
}
#################################################
###     GENERATE REPORTS     ###
#################################################
report_utilization -file area.txt
report_utilization -slr -file slr.txt
report_timing_summary -nworst 3 -max_paths 3
report_io -file pinloc.txt
report_drc -file post_route_drc.txt 
write_xdc -no_fixed_only -constraints valid -force ${DesignName}_post_par.xdc

#################################################
###     SAVE VIVADO PROJECT     ###
#################################################
save_project_as -force ${DesignName}
save_constraints -force

#################################################
###     GENERATE BITSTREAM     ###
#################################################
#set_property BITSTREAM.CONFIG.OVERTEMPPOWERDOWN {Enable} [current_design]
#set_property BITSTREAM.GENERAL.COMPRESS {True} [current_design]
#write_bitstream -force ${DesignName}.bit