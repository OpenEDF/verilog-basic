# Synopsys Customer Education Services
#
# Tcl procedures to simplify life...

puts "\#\#\# Processing procs.tcl..."

create_command_group CES_procs
set TOOLS_VIEW_PATH "../ref/tools"

# Get command results/reports in separate graphical tk window
# This expects view.tk to be in the path, which is the other half
# of this procedure!
# Examples: view man compile,  view report_timing -max_paths 20
#======================================================  
proc view {args} {
        global TOOLS_VIEW_PATH
        set VIEW_COMMAND $TOOLS_VIEW_PATH/view.tk
        if {$args == ""} {
                puts "view: Please provide a command."
                return
        }

        if { [catch {open "| $VIEW_COMMAND \"$args\"" w} PIPE] } {
                return "Can't open pipe for '$VIEW_COMMAND'"
        }
        #fconfigure $PIPE -blocking 0
        redirect -channel $PIPE {uplevel $args}
        flush $PIPE
        # don't perform close - otherwise we will block until the child finishes
        # Alternatively, we can set the channel to non-blocking
        #close $PIPE
}
define_proc_attributes view \
	-info "Display output of any command in a separate Tk window." \
	-command_group CES_procs \
	-define_args {
		{args "Command with arguments" args}
	}
alias v view


# Generates statistics on the current session:
#   hostname
#   uname -a
#   date
#   location of current exec
proc host_stats {} {
	uplevel {
	puts "##### Session information:"
	puts "hostname:  [exec hostname]"
	puts "uname -a:  [exec uname -a]"
	puts "date:      [date]"
	puts "bin path:  $bin_path"
	puts "##### End session information\n"
	}
}
define_proc_attributes host_stats \
	-info "Display statistics of the current host (server)" \
	-command_group CES_procs


# Generates timing, constraint and qor reports in the "reports/" directory
# under the current dir.
proc gen_reports {args} {

	# Defaults:
	set procargs(-verbose) false
	set procargs(-dir) "./reports"

	parse_proc_arguments -args $args procargs
	set verbose $procargs(-verbose)
	set prefix $procargs(-prefix)
	set dir $procargs(-dir)

	file mkdir $dir
	update_timing
	if ($verbose) { puts "##### Writing $dir/$prefix.constraint" }
	redirect $dir/$prefix.constraint {report_constraint -nosplit -all} 
	if ($verbose) { puts "##### Writing $dir/$prefix.timing" }
	redirect $dir/$prefix.timing {report_timing -nosplit}
	if ($verbose) { puts "##### Writing $dir/$prefix.min.timing" }
	redirect $dir/$prefix.min.timing {report_timing -delay min -nosplit}
	if ($verbose) { puts "##### Writing $dir/$prefix.qor" }
	redirect $dir/$prefix.qor {report_qor}
}

define_proc_attributes gen_reports \
	-info "Generates min/max timing, constraint and qor reports" \
	-command_group CES_procs \
	-define_args {
		{-prefix "Prefix for report files" "<name>" string required}
		{-verbose "Be verbose!" "" boolean optional}
		{-dir "Destination directory. Default: ./reports" "dest_dir" string optional}
	}


proc reset_timer {timer_name} {
    global $timer_name
    redirect /dev/null {set $timer_name [clock seconds]}
}
define_proc_attributes reset_timer \
	-info "Resets a named timer" \
	-command_group CES_procs \
	-define_args {
		{timer_name "Name of timer" timer_name}
	}

proc report_timer {timer_name message} {
    upvar $timer_name time

    set mins [expr ([clock seconds] - $time) / 60]
    set secs [expr ([clock seconds] - $time) % 60]
    echo [format "####----#### Runtime: %3d:%02d minutes for \"$message\"" $mins $secs]
}
define_proc_attributes report_timer \
	-info "report the elapsed time of a named timer" \
	-command_group CES_procs \
	-define_args {
		{timer_name "Name of timer" timer_name}
		{message "message to display with the value of the timer" message}
	}


proc measure_time {args} {
    set time [clock seconds]
	set command [join $args]
    echo "##### Started timer for command \"$command\""
    uplevel $args
    set mins [expr ([clock seconds] - $time) / 60]
    set secs [expr ([clock seconds] - $time) % 60]
    echo [format "####----#### Runtime: %3d:%02d minutes for command \"$command\"" $mins $secs]
}
define_proc_attributes measure_time \
	-info "Run a command while measuring the time it takes" \
	-command_group CES_procs \
	-define_args {
		{script "Tcl-commands to time (and run)" args}
	}

proc gui {} {
	uplevel {
		if {$in_gui_session == false} {
			gui_start
		} else {
			gui_stop
			echo "... or just 'gui'"
		}
	}
}
define_proc_attributes gui \
	-info "Start or stop the GUI" \
	-command_group CES_procs

proc vman {cmd} {
	if {$::in_gui_session == false} {
		view man $cmd
	} else {
		gui_show_man_page $cmd
	}
}
define_proc_attributes vman \
	-info "Display a man page using the GUI man reader or Tcl/TK." \
	-dont_abbrev \
	-command_group CES_procs \
	-define_args {
		{cmd "command-name" cmd}
	}



#
# Always Ask
# This useful procedure is on solvnet, Doc Id  012959
#
proc aa {args} {

   parse_proc_arguments -args $args results

   echo "*********  Commands **********"
   help *$results(pattern)*

   echo "********* Variables **********"
   uplevel "printvar *$results(pattern)*"

   if {[info exists results(-verbose)]} {
      echo "********* -help *************"
      apropos *$results(pattern)*
   }
}; # end proc

define_proc_attributes aa -info "always ask - Searches Synopsys help for both commands and variables" \
	-command_group CES_procs \
	-define_args {
		{pattern "Pattern to search for" pattern string required}
		{-verbose "Search -help as well" "" boolean optional}
	}


proc all_isolation_cells_plus_els {} {
    set isolation_cells [get_cells * -hier -filter "is_isolation_cell==true"]
    set levelshifter_cells [get_cells * -hier -filter "is_level_shifter==true"]
    foreach_in_collection ls $levelshifter_cells {
       
       set tmp [get_pins -of $ls -filter "level_shifter_enable_pin==true"]
       if {[sizeof_collection $tmp] > 0} {
           set isolation_cells [add_to_collection $isolation_cells $ls]     
       }             
    }
    return $isolation_cells
}
define_proc_attributes all_isolation_cells_plus_els -info "return a collection of isolation cells and enable level shifters" \
	-command_group CES_procs \
	-define_args {
	}


# Display all customer procedures:
echo "The following procedures are defined for use in this workshop."
echo "They are NOT standard Design Compiler commands."
help CES_procs
