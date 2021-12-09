
========================================================================
FILE: README.txt
DIRECTORY: sv_rtl_synthesis_book_examples

This directory contains the source code and test files for the examples
in the book: 

"RTL Modeling with SystemVerilog for Simulation and Synthesis", by
Stuart Sutherland.  Published in 2017, by Sutherland HDL, Inc.


FILE ORGANIZATION
-------------------------------
Each book example has 4 files associated with the example:
- The SystemVerilog source code for the example.
- A simple testbench to verify the example.
- A ".f" command file that can be used to instruct a simulator to
  compile the RTL model and testbench. (Refer to the documentation of
  a specific simulator on how to use command files.)
- A log file that shows the results of simulating the RTL model
  and associated testbench.


FILE NAMING CONVENTION
-------------------------------
The example files are named after the Example Number in the book, with
a brief desciption of the file contents appended to the example number.

   For example, Example 1-1 in the book is contained in the file
   "example_01-01_gate_level_adder.sv"

The names of the associated testbench, command file, and log file also
begin with the example number.


TESTBENCH INTENT
-------------------------------
The testbench provided for each example is NOT EXHAUSTIVE.  The tests
are intended only to prove the example is syntactically correct and 
supported by a SystemVerilog 1800-2012 compliant simulator.  The tests 
are only enough to show the example compiles and functions with at 
least one set of stimulus values.

Most of the testbenches are NOT SELF-VERIFYING, though a few are. Most 
tests simply display the model output values, and leave it to the 
reader to determine if the value is correct.


LINUX-STYLE LINE-FEEDS
-------------------------------
All code and log files are saved using linux style line feeds to
terminate each line (as opposed to DOS style line feeds).


COPYRIGHT
-------------------------------
All examples and testbenches are Copyright 2017 by Stuart Sutherland. 
All rights are reserved by the author.


USAGE PERMISSIONS/RESTRICTIONS
-------------------------------
Owners of a printed or digital copy of the book "RTL Modeling with 
SystemVerilog for Simulation and Synthesis" are granted permission to
use the examples and testbenches in this directory for personal,
non-commercial use.

Vendors of software tools that support SystemVerilog are granted
permission to use the examples and testbenches in this directory for
internal testing of SystemVerilog tools.  Modifications or added
code is permitted, provided the original copyright information on
the original code is retained in the file.

Reproduction and/or distribution of the examples and testbenches, in
whole or in part, is EXPRESSLY FORBIDDEN without written permission
from the author/copyright owner.  The author can be contacted at
stuart@sutherland-hdl.com .


NO WARRANTY
-------------------------------
All files in this directory are provided for convenience, with NO
WARRANTY OF CORRECTNESS EXPRESSED OR IMPLIED.  The author, Stuart
Sutherland, and the book publisher, Sutherland HDL, Inc., are not
liable for any problems or damages that might result from the usage
of these files.  USAGE OF THE FILES IN THIS DIRECTORY ARE AT YOUR
OWN RISK.

========================================================================

