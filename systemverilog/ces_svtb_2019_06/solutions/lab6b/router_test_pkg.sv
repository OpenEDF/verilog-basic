//Lab 6 Task 7, Step 4
//Define a new package called router_test_pkg
//ToDo
package router_test_pkg;


//Lab 6 Task 7, Step 5
//Define global variable run_for_n_packets to limit the number of packets
//Initialize it to 0
//ToDo
int run_for_n_packets = 0;

//Lab 6 Task 7, Step 6
//Define global variable TRACE_ON to control simulation tracing
//Initialize it to 0
//ToDo
int TRACE_ON = 0;

//Lab 6 Task 7, Step 7
//Include all component and data class and header files created in Lab 5.
//Include Environment.sv. This defines the test Environment.
//ToDo
`include "router_test.h"
`include "Packet.sv"
`include "Driver.sv"
`include "Receiver.sv"
`include "Generator.sv"
`include "Scoreboard.sv"
`include "Environment.sv"

//Lab 6 Task 7, Step 8
//End the package definition
//ToDo
endpackage: router_test_pkg
