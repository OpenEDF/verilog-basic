if { ![project_exists {ff_synchronous_reset}] } {
     project_new {ff_synchronous_reset}
} else {
     project_open {ff_synchronous_reset}
}
set_project_settings -cmp {ff_synchronous_reset}
if { ![project_settings_exist -sim ff_synchronous_reset] } {
        set_project_settings -sim ff_synchronous_reset
}
set_global_assignment -section_id {ff_synchronous_reset} -name {EDA_DESIGN_ENTRY_SYNTHESIS_TOOL} {PRECISION SYNTHESIS}
set_global_assignment -name {EDIF_FILE} {ff_synchronous_reset.edf}
set_global_assignment -name {USE_TIMEQUEST_TIMING_ANALYZER} {ON}
set_global_assignment -section_id {eda_design_synthesis} -name {EDA_USE_LMF} {mentor.lmf}
set_global_assignment -section_id {eda_design_synthesis} -name {EDA_INPUT_GND_NAME} {GND}
set_global_assignment -section_id {eda_design_synthesis} -name {EDA_INPUT_VCC_NAME} {VCC}
set_global_assignment -section_id {eda_design_synthesis} -name {EDA_SHOW_LMF_MAPPING_MESSAGES} {OFF}
set_global_assignment -section_id {eda_design_synthesis} -name {EDA_RUN_TOOL_AUTOMATICALLY} {OFF}
set_global_assignment -section_id {eda_design_synthesis} -name {EDA_INPUT_DATA_FORMAT} {EDIF}
set_global_assignment -section_id {eda_design_synthesis} -name {EDA_OUTPUT_DATA_FORMAT} {EDIF}
set_global_assignment -section_id {eda_simulation} -name {EDA_FLATTEN_BUSES} {OFF}
set_global_assignment -section_id {eda_timing_analysis} -name {EDA_FLATTEN_BUSES} {OFF}
set_global_assignment -section_id {eda_design_synthesis} -name {AUTO_SHIFT_REGISTER_RECOGNITION} {OFF}
set_global_assignment -section_id {eda_design_synthesis} -name {AUTO_RAM_RECOGNITION} {OFF}
set_global_assignment -section_id {eda_design_synthesis} -name {AUTO_ROM_RECOGNITION} {OFF}
set_global_assignment -name {BLOCK_RAM_TO_MLAB_CELL_CONVERSION} {OFF}
if { [file exists {ff_synchronous_reset_altera.prop}] } {
  source ff_synchronous_reset_altera.prop
}
set_global_assignment -name {FAMILY} {FLEX10K}
set_global_assignment -section_id {ff_synchronous_reset} -name {DEVICE} {EPF10K10LC84-3}
set_global_assignment -name {PROJECT_SHOW_ENTITY_NAME} {OFF}
set_global_assignment -name {SDC_FILE} {ff_synchronous_reset_pnr_constraints.sdc}
export_assignment_files
package require ::quartus::flow
if { [catch {execute_module -tool map} result] } {
  puts "Error running quartus_map $result"
} elseif { [catch {execute_module -tool fit} result] } {
  puts "Error running quartus_fit $result"
} elseif { [catch {execute_module -tool sta -args --do_report_timing} result] } {
  puts "Error running quartus_sta $result"
} elseif { [catch {execute_module -tool asm} result] } {
  puts "Error running quartus_asm $result"
}
project_close
