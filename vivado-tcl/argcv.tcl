###-----------------------------------------------------------------
### vivado tcl argc and argv test
### Author: Macro
### Use: vivado -mode batch -source argcv.tcl -tclargs first sencond 23
### 

puts "This is a test!"
puts $argc
puts $argv0
puts [lindex $argv 0]
puts [lindex $argv 1]
puts [lindex $argv 2]

### output result
# 
# ****** Vivado v2019.2 (64-bit)
#   **** SW Build 2708876 on Wed Nov  6 21:40:23 MST 2019
#   **** IP Build 2700528 on Thu Nov  7 00:09:20 MST 2019
#     ** Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
# 
# source argcv.tcl
# # puts "This is a test!"
# This is a test!
# # puts $argc
# 3
# # puts $argv0
# argcv.tcl
# # puts [lindex $argv 0]
# first
# # puts [lindex $argv 1]
# sencond
# # puts [lindex $argv 2]
# 23

###-----------------------------------------------------------------