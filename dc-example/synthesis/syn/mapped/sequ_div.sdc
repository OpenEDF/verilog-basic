###################################################################

# Created by write_sdc on Sun Aug 13 22:09:51 2023

###################################################################
set sdc_version 1.7

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions typical -library typical
set_wire_load_mode enclosed
set_wire_load_model -name smic18_wl10 -library typical
set_max_area 0
set_driving_cell -lib_cell INVX1 -pin Y [get_ports clk]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports rst_n]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[31]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[30]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[29]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[28]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[27]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[26]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[25]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[24]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[23]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[22]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[21]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[20]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[19]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[18]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[17]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[16]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[15]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[14]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[13]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[12]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[11]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[10]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[9]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[8]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[7]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[6]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[5]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[4]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[3]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[2]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[1]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {divider[0]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[31]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[30]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[29]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[28]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[27]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[26]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[25]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[24]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[23]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[22]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[21]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[20]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[19]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[18]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[17]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[16]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[15]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[14]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[13]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[12]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[11]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[10]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[9]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[8]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[7]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[6]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[5]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[4]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[3]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[2]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[1]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports {dividend[0]}]
set_driving_cell -lib_cell INVX1 -pin Y [get_ports start]
set_load -pin_load 0.83331 [get_ports {quotient[31]}]
set_load -pin_load 0.83331 [get_ports {quotient[30]}]
set_load -pin_load 0.83331 [get_ports {quotient[29]}]
set_load -pin_load 0.83331 [get_ports {quotient[28]}]
set_load -pin_load 0.83331 [get_ports {quotient[27]}]
set_load -pin_load 0.83331 [get_ports {quotient[26]}]
set_load -pin_load 0.83331 [get_ports {quotient[25]}]
set_load -pin_load 0.83331 [get_ports {quotient[24]}]
set_load -pin_load 0.83331 [get_ports {quotient[23]}]
set_load -pin_load 0.83331 [get_ports {quotient[22]}]
set_load -pin_load 0.83331 [get_ports {quotient[21]}]
set_load -pin_load 0.83331 [get_ports {quotient[20]}]
set_load -pin_load 0.83331 [get_ports {quotient[19]}]
set_load -pin_load 0.83331 [get_ports {quotient[18]}]
set_load -pin_load 0.83331 [get_ports {quotient[17]}]
set_load -pin_load 0.83331 [get_ports {quotient[16]}]
set_load -pin_load 0.83331 [get_ports {quotient[15]}]
set_load -pin_load 0.83331 [get_ports {quotient[14]}]
set_load -pin_load 0.83331 [get_ports {quotient[13]}]
set_load -pin_load 0.83331 [get_ports {quotient[12]}]
set_load -pin_load 0.83331 [get_ports {quotient[11]}]
set_load -pin_load 0.83331 [get_ports {quotient[10]}]
set_load -pin_load 0.83331 [get_ports {quotient[9]}]
set_load -pin_load 0.83331 [get_ports {quotient[8]}]
set_load -pin_load 0.83331 [get_ports {quotient[7]}]
set_load -pin_load 0.83331 [get_ports {quotient[6]}]
set_load -pin_load 0.83331 [get_ports {quotient[5]}]
set_load -pin_load 0.83331 [get_ports {quotient[4]}]
set_load -pin_load 0.83331 [get_ports {quotient[3]}]
set_load -pin_load 0.83331 [get_ports {quotient[2]}]
set_load -pin_load 0.83331 [get_ports {quotient[1]}]
set_load -pin_load 0.83331 [get_ports {quotient[0]}]
set_load -pin_load 0.83331 [get_ports {remainder[31]}]
set_load -pin_load 0.83331 [get_ports {remainder[30]}]
set_load -pin_load 0.83331 [get_ports {remainder[29]}]
set_load -pin_load 0.83331 [get_ports {remainder[28]}]
set_load -pin_load 0.83331 [get_ports {remainder[27]}]
set_load -pin_load 0.83331 [get_ports {remainder[26]}]
set_load -pin_load 0.83331 [get_ports {remainder[25]}]
set_load -pin_load 0.83331 [get_ports {remainder[24]}]
set_load -pin_load 0.83331 [get_ports {remainder[23]}]
set_load -pin_load 0.83331 [get_ports {remainder[22]}]
set_load -pin_load 0.83331 [get_ports {remainder[21]}]
set_load -pin_load 0.83331 [get_ports {remainder[20]}]
set_load -pin_load 0.83331 [get_ports {remainder[19]}]
set_load -pin_load 0.83331 [get_ports {remainder[18]}]
set_load -pin_load 0.83331 [get_ports {remainder[17]}]
set_load -pin_load 0.83331 [get_ports {remainder[16]}]
set_load -pin_load 0.83331 [get_ports {remainder[15]}]
set_load -pin_load 0.83331 [get_ports {remainder[14]}]
set_load -pin_load 0.83331 [get_ports {remainder[13]}]
set_load -pin_load 0.83331 [get_ports {remainder[12]}]
set_load -pin_load 0.83331 [get_ports {remainder[11]}]
set_load -pin_load 0.83331 [get_ports {remainder[10]}]
set_load -pin_load 0.83331 [get_ports {remainder[9]}]
set_load -pin_load 0.83331 [get_ports {remainder[8]}]
set_load -pin_load 0.83331 [get_ports {remainder[7]}]
set_load -pin_load 0.83331 [get_ports {remainder[6]}]
set_load -pin_load 0.83331 [get_ports {remainder[5]}]
set_load -pin_load 0.83331 [get_ports {remainder[4]}]
set_load -pin_load 0.83331 [get_ports {remainder[3]}]
set_load -pin_load 0.83331 [get_ports {remainder[2]}]
set_load -pin_load 0.83331 [get_ports {remainder[1]}]
set_load -pin_load 0.83331 [get_ports {remainder[0]}]
set_load -pin_load 0.83331 [get_ports ready]
set_load -pin_load 0.83331 [get_ports illegal_divider_zero]
set_ideal_network [get_ports clk]
set_ideal_network [get_ports rst_n]
create_clock [get_ports clk]  -period 10  -waveform {0 5}
set_clock_latency -max 1  [get_clocks clk]
set_clock_latency -source -max 1  [get_clocks clk]
set_clock_uncertainty -setup 0.5  [get_clocks clk]
set_clock_transition -max -rise 0.1 [get_clocks clk]
set_clock_transition -max -fall 0.1 [get_clocks clk]
group_path -weight 5  -name clk  -to [get_clocks clk]
group_path -name COMB  -from [list [get_ports clk] [get_ports rst_n] [get_ports {divider[31]}]       \
[get_ports {divider[30]}] [get_ports {divider[29]}] [get_ports {divider[28]}]  \
[get_ports {divider[27]}] [get_ports {divider[26]}] [get_ports {divider[25]}]  \
[get_ports {divider[24]}] [get_ports {divider[23]}] [get_ports {divider[22]}]  \
[get_ports {divider[21]}] [get_ports {divider[20]}] [get_ports {divider[19]}]  \
[get_ports {divider[18]}] [get_ports {divider[17]}] [get_ports {divider[16]}]  \
[get_ports {divider[15]}] [get_ports {divider[14]}] [get_ports {divider[13]}]  \
[get_ports {divider[12]}] [get_ports {divider[11]}] [get_ports {divider[10]}]  \
[get_ports {divider[9]}] [get_ports {divider[8]}] [get_ports {divider[7]}]     \
[get_ports {divider[6]}] [get_ports {divider[5]}] [get_ports {divider[4]}]     \
[get_ports {divider[3]}] [get_ports {divider[2]}] [get_ports {divider[1]}]     \
[get_ports {divider[0]}] [get_ports {dividend[31]}] [get_ports {dividend[30]}] \
[get_ports {dividend[29]}] [get_ports {dividend[28]}] [get_ports               \
{dividend[27]}] [get_ports {dividend[26]}] [get_ports {dividend[25]}]          \
[get_ports {dividend[24]}] [get_ports {dividend[23]}] [get_ports               \
{dividend[22]}] [get_ports {dividend[21]}] [get_ports {dividend[20]}]          \
[get_ports {dividend[19]}] [get_ports {dividend[18]}] [get_ports               \
{dividend[17]}] [get_ports {dividend[16]}] [get_ports {dividend[15]}]          \
[get_ports {dividend[14]}] [get_ports {dividend[13]}] [get_ports               \
{dividend[12]}] [get_ports {dividend[11]}] [get_ports {dividend[10]}]          \
[get_ports {dividend[9]}] [get_ports {dividend[8]}] [get_ports {dividend[7]}]  \
[get_ports {dividend[6]}] [get_ports {dividend[5]}] [get_ports {dividend[4]}]  \
[get_ports {dividend[3]}] [get_ports {dividend[2]}] [get_ports {dividend[1]}]  \
[get_ports {dividend[0]}] [get_ports start]]  -to [list [get_ports {quotient[31]}] [get_ports {quotient[30]}] [get_ports    \
{quotient[29]}] [get_ports {quotient[28]}] [get_ports {quotient[27]}]          \
[get_ports {quotient[26]}] [get_ports {quotient[25]}] [get_ports               \
{quotient[24]}] [get_ports {quotient[23]}] [get_ports {quotient[22]}]          \
[get_ports {quotient[21]}] [get_ports {quotient[20]}] [get_ports               \
{quotient[19]}] [get_ports {quotient[18]}] [get_ports {quotient[17]}]          \
[get_ports {quotient[16]}] [get_ports {quotient[15]}] [get_ports               \
{quotient[14]}] [get_ports {quotient[13]}] [get_ports {quotient[12]}]          \
[get_ports {quotient[11]}] [get_ports {quotient[10]}] [get_ports               \
{quotient[9]}] [get_ports {quotient[8]}] [get_ports {quotient[7]}] [get_ports  \
{quotient[6]}] [get_ports {quotient[5]}] [get_ports {quotient[4]}] [get_ports  \
{quotient[3]}] [get_ports {quotient[2]}] [get_ports {quotient[1]}] [get_ports  \
{quotient[0]}] [get_ports {remainder[31]}] [get_ports {remainder[30]}]         \
[get_ports {remainder[29]}] [get_ports {remainder[28]}] [get_ports             \
{remainder[27]}] [get_ports {remainder[26]}] [get_ports {remainder[25]}]       \
[get_ports {remainder[24]}] [get_ports {remainder[23]}] [get_ports             \
{remainder[22]}] [get_ports {remainder[21]}] [get_ports {remainder[20]}]       \
[get_ports {remainder[19]}] [get_ports {remainder[18]}] [get_ports             \
{remainder[17]}] [get_ports {remainder[16]}] [get_ports {remainder[15]}]       \
[get_ports {remainder[14]}] [get_ports {remainder[13]}] [get_ports             \
{remainder[12]}] [get_ports {remainder[11]}] [get_ports {remainder[10]}]       \
[get_ports {remainder[9]}] [get_ports {remainder[8]}] [get_ports               \
{remainder[7]}] [get_ports {remainder[6]}] [get_ports {remainder[5]}]          \
[get_ports {remainder[4]}] [get_ports {remainder[3]}] [get_ports               \
{remainder[2]}] [get_ports {remainder[1]}] [get_ports {remainder[0]}]          \
[get_ports ready] [get_ports illegal_divider_zero]]
group_path -name INPUTS  -from [list [get_ports clk] [get_ports rst_n] [get_ports {divider[31]}]       \
[get_ports {divider[30]}] [get_ports {divider[29]}] [get_ports {divider[28]}]  \
[get_ports {divider[27]}] [get_ports {divider[26]}] [get_ports {divider[25]}]  \
[get_ports {divider[24]}] [get_ports {divider[23]}] [get_ports {divider[22]}]  \
[get_ports {divider[21]}] [get_ports {divider[20]}] [get_ports {divider[19]}]  \
[get_ports {divider[18]}] [get_ports {divider[17]}] [get_ports {divider[16]}]  \
[get_ports {divider[15]}] [get_ports {divider[14]}] [get_ports {divider[13]}]  \
[get_ports {divider[12]}] [get_ports {divider[11]}] [get_ports {divider[10]}]  \
[get_ports {divider[9]}] [get_ports {divider[8]}] [get_ports {divider[7]}]     \
[get_ports {divider[6]}] [get_ports {divider[5]}] [get_ports {divider[4]}]     \
[get_ports {divider[3]}] [get_ports {divider[2]}] [get_ports {divider[1]}]     \
[get_ports {divider[0]}] [get_ports {dividend[31]}] [get_ports {dividend[30]}] \
[get_ports {dividend[29]}] [get_ports {dividend[28]}] [get_ports               \
{dividend[27]}] [get_ports {dividend[26]}] [get_ports {dividend[25]}]          \
[get_ports {dividend[24]}] [get_ports {dividend[23]}] [get_ports               \
{dividend[22]}] [get_ports {dividend[21]}] [get_ports {dividend[20]}]          \
[get_ports {dividend[19]}] [get_ports {dividend[18]}] [get_ports               \
{dividend[17]}] [get_ports {dividend[16]}] [get_ports {dividend[15]}]          \
[get_ports {dividend[14]}] [get_ports {dividend[13]}] [get_ports               \
{dividend[12]}] [get_ports {dividend[11]}] [get_ports {dividend[10]}]          \
[get_ports {dividend[9]}] [get_ports {dividend[8]}] [get_ports {dividend[7]}]  \
[get_ports {dividend[6]}] [get_ports {dividend[5]}] [get_ports {dividend[4]}]  \
[get_ports {dividend[3]}] [get_ports {dividend[2]}] [get_ports {dividend[1]}]  \
[get_ports {dividend[0]}] [get_ports start]]
group_path -name OUTPUTS  -to [list [get_ports {quotient[31]}] [get_ports {quotient[30]}] [get_ports    \
{quotient[29]}] [get_ports {quotient[28]}] [get_ports {quotient[27]}]          \
[get_ports {quotient[26]}] [get_ports {quotient[25]}] [get_ports               \
{quotient[24]}] [get_ports {quotient[23]}] [get_ports {quotient[22]}]          \
[get_ports {quotient[21]}] [get_ports {quotient[20]}] [get_ports               \
{quotient[19]}] [get_ports {quotient[18]}] [get_ports {quotient[17]}]          \
[get_ports {quotient[16]}] [get_ports {quotient[15]}] [get_ports               \
{quotient[14]}] [get_ports {quotient[13]}] [get_ports {quotient[12]}]          \
[get_ports {quotient[11]}] [get_ports {quotient[10]}] [get_ports               \
{quotient[9]}] [get_ports {quotient[8]}] [get_ports {quotient[7]}] [get_ports  \
{quotient[6]}] [get_ports {quotient[5]}] [get_ports {quotient[4]}] [get_ports  \
{quotient[3]}] [get_ports {quotient[2]}] [get_ports {quotient[1]}] [get_ports  \
{quotient[0]}] [get_ports {remainder[31]}] [get_ports {remainder[30]}]         \
[get_ports {remainder[29]}] [get_ports {remainder[28]}] [get_ports             \
{remainder[27]}] [get_ports {remainder[26]}] [get_ports {remainder[25]}]       \
[get_ports {remainder[24]}] [get_ports {remainder[23]}] [get_ports             \
{remainder[22]}] [get_ports {remainder[21]}] [get_ports {remainder[20]}]       \
[get_ports {remainder[19]}] [get_ports {remainder[18]}] [get_ports             \
{remainder[17]}] [get_ports {remainder[16]}] [get_ports {remainder[15]}]       \
[get_ports {remainder[14]}] [get_ports {remainder[13]}] [get_ports             \
{remainder[12]}] [get_ports {remainder[11]}] [get_ports {remainder[10]}]       \
[get_ports {remainder[9]}] [get_ports {remainder[8]}] [get_ports               \
{remainder[7]}] [get_ports {remainder[6]}] [get_ports {remainder[5]}]          \
[get_ports {remainder[4]}] [get_ports {remainder[3]}] [get_ports               \
{remainder[2]}] [get_ports {remainder[1]}] [get_ports {remainder[0]}]          \
[get_ports ready] [get_ports illegal_divider_zero]]
set_input_delay -clock clk  1  [get_ports clk]
set_input_delay -clock clk  1  [get_ports rst_n]
set_input_delay -clock clk  1  [get_ports {divider[31]}]
set_input_delay -clock clk  1  [get_ports {divider[30]}]
set_input_delay -clock clk  1  [get_ports {divider[29]}]
set_input_delay -clock clk  1  [get_ports {divider[28]}]
set_input_delay -clock clk  1  [get_ports {divider[27]}]
set_input_delay -clock clk  1  [get_ports {divider[26]}]
set_input_delay -clock clk  1  [get_ports {divider[25]}]
set_input_delay -clock clk  1  [get_ports {divider[24]}]
set_input_delay -clock clk  1  [get_ports {divider[23]}]
set_input_delay -clock clk  1  [get_ports {divider[22]}]
set_input_delay -clock clk  1  [get_ports {divider[21]}]
set_input_delay -clock clk  1  [get_ports {divider[20]}]
set_input_delay -clock clk  1  [get_ports {divider[19]}]
set_input_delay -clock clk  1  [get_ports {divider[18]}]
set_input_delay -clock clk  1  [get_ports {divider[17]}]
set_input_delay -clock clk  1  [get_ports {divider[16]}]
set_input_delay -clock clk  1  [get_ports {divider[15]}]
set_input_delay -clock clk  1  [get_ports {divider[14]}]
set_input_delay -clock clk  1  [get_ports {divider[13]}]
set_input_delay -clock clk  1  [get_ports {divider[12]}]
set_input_delay -clock clk  1  [get_ports {divider[11]}]
set_input_delay -clock clk  1  [get_ports {divider[10]}]
set_input_delay -clock clk  1  [get_ports {divider[9]}]
set_input_delay -clock clk  1  [get_ports {divider[8]}]
set_input_delay -clock clk  1  [get_ports {divider[7]}]
set_input_delay -clock clk  1  [get_ports {divider[6]}]
set_input_delay -clock clk  1  [get_ports {divider[5]}]
set_input_delay -clock clk  1  [get_ports {divider[4]}]
set_input_delay -clock clk  1  [get_ports {divider[3]}]
set_input_delay -clock clk  1  [get_ports {divider[2]}]
set_input_delay -clock clk  1  [get_ports {divider[1]}]
set_input_delay -clock clk  1  [get_ports {divider[0]}]
set_input_delay -clock clk  1  [get_ports {dividend[31]}]
set_input_delay -clock clk  1  [get_ports {dividend[30]}]
set_input_delay -clock clk  1  [get_ports {dividend[29]}]
set_input_delay -clock clk  1  [get_ports {dividend[28]}]
set_input_delay -clock clk  1  [get_ports {dividend[27]}]
set_input_delay -clock clk  1  [get_ports {dividend[26]}]
set_input_delay -clock clk  1  [get_ports {dividend[25]}]
set_input_delay -clock clk  1  [get_ports {dividend[24]}]
set_input_delay -clock clk  1  [get_ports {dividend[23]}]
set_input_delay -clock clk  1  [get_ports {dividend[22]}]
set_input_delay -clock clk  1  [get_ports {dividend[21]}]
set_input_delay -clock clk  1  [get_ports {dividend[20]}]
set_input_delay -clock clk  1  [get_ports {dividend[19]}]
set_input_delay -clock clk  1  [get_ports {dividend[18]}]
set_input_delay -clock clk  1  [get_ports {dividend[17]}]
set_input_delay -clock clk  1  [get_ports {dividend[16]}]
set_input_delay -clock clk  1  [get_ports {dividend[15]}]
set_input_delay -clock clk  1  [get_ports {dividend[14]}]
set_input_delay -clock clk  1  [get_ports {dividend[13]}]
set_input_delay -clock clk  1  [get_ports {dividend[12]}]
set_input_delay -clock clk  1  [get_ports {dividend[11]}]
set_input_delay -clock clk  1  [get_ports {dividend[10]}]
set_input_delay -clock clk  1  [get_ports {dividend[9]}]
set_input_delay -clock clk  1  [get_ports {dividend[8]}]
set_input_delay -clock clk  1  [get_ports {dividend[7]}]
set_input_delay -clock clk  1  [get_ports {dividend[6]}]
set_input_delay -clock clk  1  [get_ports {dividend[5]}]
set_input_delay -clock clk  1  [get_ports {dividend[4]}]
set_input_delay -clock clk  1  [get_ports {dividend[3]}]
set_input_delay -clock clk  1  [get_ports {dividend[2]}]
set_input_delay -clock clk  1  [get_ports {dividend[1]}]
set_input_delay -clock clk  1  [get_ports {dividend[0]}]
set_input_delay -clock clk  1  [get_ports start]
set_output_delay -clock clk  1  [get_ports {quotient[31]}]
set_output_delay -clock clk  1  [get_ports {quotient[30]}]
set_output_delay -clock clk  1  [get_ports {quotient[29]}]
set_output_delay -clock clk  1  [get_ports {quotient[28]}]
set_output_delay -clock clk  1  [get_ports {quotient[27]}]
set_output_delay -clock clk  1  [get_ports {quotient[26]}]
set_output_delay -clock clk  1  [get_ports {quotient[25]}]
set_output_delay -clock clk  1  [get_ports {quotient[24]}]
set_output_delay -clock clk  1  [get_ports {quotient[23]}]
set_output_delay -clock clk  1  [get_ports {quotient[22]}]
set_output_delay -clock clk  1  [get_ports {quotient[21]}]
set_output_delay -clock clk  1  [get_ports {quotient[20]}]
set_output_delay -clock clk  1  [get_ports {quotient[19]}]
set_output_delay -clock clk  1  [get_ports {quotient[18]}]
set_output_delay -clock clk  1  [get_ports {quotient[17]}]
set_output_delay -clock clk  1  [get_ports {quotient[16]}]
set_output_delay -clock clk  1  [get_ports {quotient[15]}]
set_output_delay -clock clk  1  [get_ports {quotient[14]}]
set_output_delay -clock clk  1  [get_ports {quotient[13]}]
set_output_delay -clock clk  1  [get_ports {quotient[12]}]
set_output_delay -clock clk  1  [get_ports {quotient[11]}]
set_output_delay -clock clk  1  [get_ports {quotient[10]}]
set_output_delay -clock clk  1  [get_ports {quotient[9]}]
set_output_delay -clock clk  1  [get_ports {quotient[8]}]
set_output_delay -clock clk  1  [get_ports {quotient[7]}]
set_output_delay -clock clk  1  [get_ports {quotient[6]}]
set_output_delay -clock clk  1  [get_ports {quotient[5]}]
set_output_delay -clock clk  1  [get_ports {quotient[4]}]
set_output_delay -clock clk  1  [get_ports {quotient[3]}]
set_output_delay -clock clk  1  [get_ports {quotient[2]}]
set_output_delay -clock clk  1  [get_ports {quotient[1]}]
set_output_delay -clock clk  1  [get_ports {quotient[0]}]
set_output_delay -clock clk  1  [get_ports {remainder[31]}]
set_output_delay -clock clk  1  [get_ports {remainder[30]}]
set_output_delay -clock clk  1  [get_ports {remainder[29]}]
set_output_delay -clock clk  1  [get_ports {remainder[28]}]
set_output_delay -clock clk  1  [get_ports {remainder[27]}]
set_output_delay -clock clk  1  [get_ports {remainder[26]}]
set_output_delay -clock clk  1  [get_ports {remainder[25]}]
set_output_delay -clock clk  1  [get_ports {remainder[24]}]
set_output_delay -clock clk  1  [get_ports {remainder[23]}]
set_output_delay -clock clk  1  [get_ports {remainder[22]}]
set_output_delay -clock clk  1  [get_ports {remainder[21]}]
set_output_delay -clock clk  1  [get_ports {remainder[20]}]
set_output_delay -clock clk  1  [get_ports {remainder[19]}]
set_output_delay -clock clk  1  [get_ports {remainder[18]}]
set_output_delay -clock clk  1  [get_ports {remainder[17]}]
set_output_delay -clock clk  1  [get_ports {remainder[16]}]
set_output_delay -clock clk  1  [get_ports {remainder[15]}]
set_output_delay -clock clk  1  [get_ports {remainder[14]}]
set_output_delay -clock clk  1  [get_ports {remainder[13]}]
set_output_delay -clock clk  1  [get_ports {remainder[12]}]
set_output_delay -clock clk  1  [get_ports {remainder[11]}]
set_output_delay -clock clk  1  [get_ports {remainder[10]}]
set_output_delay -clock clk  1  [get_ports {remainder[9]}]
set_output_delay -clock clk  1  [get_ports {remainder[8]}]
set_output_delay -clock clk  1  [get_ports {remainder[7]}]
set_output_delay -clock clk  1  [get_ports {remainder[6]}]
set_output_delay -clock clk  1  [get_ports {remainder[5]}]
set_output_delay -clock clk  1  [get_ports {remainder[4]}]
set_output_delay -clock clk  1  [get_ports {remainder[3]}]
set_output_delay -clock clk  1  [get_ports {remainder[2]}]
set_output_delay -clock clk  1  [get_ports {remainder[1]}]
set_output_delay -clock clk  1  [get_ports {remainder[0]}]
set_output_delay -clock clk  1  [get_ports ready]
set_output_delay -clock clk  1  [get_ports illegal_divider_zero]
