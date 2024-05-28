# Begin_DVE_Session_Save_Info
# DVE view(Wave.1 ) session
# Saved on Fri Mar 14 14:31:03 2014
# Designs open: 1
#   V1: vcdplus.vpd
# Toplevel windows open: 2
# 	TopLevel.1
# 	TopLevel.2
#   Wave.1: 9 signals
# End_DVE_Session_Save_Info

# DVE version: H-2013.06
# DVE build date: May 30 2013 23:12:01


#<Session mode="View" path="/remote/us01home25/aoza/courses/SystemVerilog_Testbench/SVTB2014.03/verdi/verdi_ces_svtb_2014.03/labs/lab1/top_io.tcl" type="Debug">

#<Database>

# DVE Open design session: 

if { ![gui_is_db_opened -db {vcdplus.vpd}] } {
	gui_open_db -design V1 -file vcdplus.vpd -nosource
}
gui_set_precision 100ps
gui_set_time_units 100ps
#</Database>

# DVE View/pane content session: 

# Begin_DVE_Session_Save_Info (Wave.1)
# DVE wave signals session
# Saved on Fri Mar 14 14:31:03 2014
# 9 signals
# End_DVE_Session_Save_Info

# DVE version: H-2013.06
# DVE build date: May 30 2013 23:12:01


#Add ncecessay scopes
gui_load_child_values {router_test_top.top_io}


set _wave_session_group_1 top_io
if {[gui_sg_is_group -name "$_wave_session_group_1"]} {
    set _wave_session_group_1 [gui_sg_generate_new_name]
}
set Group1 "$_wave_session_group_1"

gui_sg_addsignal -group "$_wave_session_group_1" { {V1:router_test_top.top_io.clock} {V1:router_test_top.top_io.reset_n} {V1:router_test_top.top_io.din} {V1:router_test_top.top_io.frame_n} {V1:router_test_top.top_io.valid_n} {V1:router_test_top.top_io.dout} {V1:router_test_top.top_io.valido_n} {V1:router_test_top.top_io.busy_n} {V1:router_test_top.top_io.frameo_n} }
if {![info exists useOldWindow]} { 
	set useOldWindow true
}
if {$useOldWindow && [string first "Wave" [gui_get_current_window -view]]==0} { 
	set Wave.1 [gui_get_current_window -view] 
} else {
	gui_open_window Wave
set Wave.1 [ gui_get_current_window -view ]
}
set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_marker_set_ref -id ${Wave.1}  C1
gui_wv_zoom_timerange -id ${Wave.1} 0 16500
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group1}]
gui_seek_criteria -id ${Wave.1} {Any Edge}


gui_set_pref_value -category Wave -key exclusiveSG -value $groupExD
gui_list_set_height -id Wave -height $origWaveHeight
if {$origGroupCreationState} {
	gui_list_create_group_when_add -wave -enable
}
if { $groupExD } {
 gui_msg_report -code DVWW028
}
gui_list_set_filter -id ${Wave.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {Parameter 1} {All 1} {Aggregate 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Wave.1} -text {*}
gui_list_set_insertion_bar  -id ${Wave.1} -group ${Group1}  -position in

gui_marker_move -id ${Wave.1} {C1} 0
gui_view_scroll -id ${Wave.1} -vertical -set 0
gui_show_grid -id ${Wave.1} -enable false
#</Session>

