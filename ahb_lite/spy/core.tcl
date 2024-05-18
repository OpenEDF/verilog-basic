puts "#==============================================================================="
puts "# Opening project"
puts "#==============================================================================="
open_project spy/ahb_lite_top.prj

set SPYGLASS_GOALS lint/lint_rtl
puts ""
puts "#==============================================================================="
puts "# Running Goals"
puts "#==============================================================================="
set lGoal [split $SPYGLASS_GOALS ","]
foreach sGoal $lGoal {
   puts "Goal : $sGoal"
   run_goal -goal $sGoal
}

puts ""
puts "#==============================================================================="
puts "# Reports"
puts "#==============================================================================="

# By default reports go to $sProjectDir/core/<CompName>/html_reports
# Replicate the location that they go when run in batch mode.
write_aggregate_report datasheet -reportdir $sProjectDir/core/html_reports
write_aggregate_report dashboard -reportdir $sProjectDir/core/html_reports

puts ""
puts "#==============================================================================="
puts "# Exiting"
puts "#==============================================================================="
# Saving results in your core.prj being copied to core_<date>.prj and core.prj overwritten.
exit -force 0

