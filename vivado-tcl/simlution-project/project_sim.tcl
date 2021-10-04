###-----------------------------------------------------------------
### vivado tcl file for Project mode sim， only create project and 
### entry the sim gui
### Author: Macro
### Resources: Vivado Design Suite User Guide Design Flows Overview
### 

puts "-------------------------- Start --------------------------"
###
# Brief: create the project
# name: create_projects
# parameter: pro_path: project path
#          : pro_name: project name
#          : pro_chip: fpga chip for project
# return : None
proc create_projects { pro_path pro_name pro_chip } {
    create_project -part $pro_chip $pro_name $pro_path 
    set_property DESIGN_MODE RTL [current_fileset]
}

###
# Brief: add source file to project
# name: add_src_project
# parameter: veriogsrc: project path
#          : simsrc: project name
# return : None
proc add_src_project { veriogsrc simsrc } {
    add_files -fileset sources_1 $veriogsrc
    add_files -fileset sim_1 $simsrc
    update_compile_order -fileset sources_1
    update_compile_order -fileset sim_1
}

###
# Brief: launch the simulation
# name: launch_sim
# parameter: None
# return : None
proc launch_sim { } {
    set_property -name {xsim.simulate.runtime} -value {5000ns} -objects [get_filesets sim_1]
    launch_simulation      
}

###
# Brief: create the project or directly launch simulation
# name: main
# parameter: None
# return : None
proc main { } {
    # Set sources file
    set verilog_src [list]
    lappend verilog_src ./sources/flowled.v
    set sim_src ./sources/flowled_tb.v

    # Set the FPGA chip
    set xilinx_fpga_chip xc7a35tfgg484-2
    set project_path [pwd]
    set project_name "flowled"
    set project $project_name.xpr

    # judge the exits the project is wether exists
    if {[file exists $project]} {
        puts "The $project exist and will start the simulation directly."
        open_project $project
        launch_sim
    } else {
        puts "The project does not exist, $project will be created."
        [ create_projects $project_path $project_name $xilinx_fpga_chip]
        [ add_src_project $verilog_src $sim_src]
        launch_sim
    }

    # open vivado gui
    start_gui
} 

# run main script
main

# Close the simulation windows
# close_sim -force
# stop_gui
# close_project

###-----------------------------------------------------------------