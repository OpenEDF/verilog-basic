/**********************************************************************
 * Utopia top-level--includes all files for simulating the complete
 * utopia design (not in book)
 *
 * This top-level file includes all of the example files in chapter 10.
 *
 * To simulate this example, invoke simulation on this file, with:
 *   `define SYNTHESIS commented out
 *   `define VERBOSE uncommented (or enabled using +define+VERBOSE)
 *   `define FWDALL uncommented (or enabled using +define+FWDALL)
 *
 * To synthesize this example, invoke simulation on this file, with:
 *   `define SYNTHESIS uncommented (or enabled using +define+SYNTHESIS)
 *   `define VERBOSE commented out
 *   `define FWDALL commented out
 *
 * Author: Stuart Sutherland
 *
 * (c) Copyright 2003, Sutherland HDL, Inc. *** ALL RIGHTS RESERVED ***
 * www.sutherland-hdl.com
 *
 * This example is based on an example from Janick Bergeron's
 * Verification Guild[1].  The original example is a non-synthesizable
 * behavioral model written in Verilog-1995 of a quad Asynchronous
 * Transfer Mode (ATM) user-to-network interface and forwarding node.
 * This example modifies the original code to be synthesizable, using
 * SystemVerilog constructs.  Also, the model has been made to be
 * configurable, so that it can be easily scaled from a 4x4 quad switch
 * to a 16x16 switch, or any other desired configuration.  The example,
 * including a nominal test bench, is partitioned into 8 files,
 * numbered 10.xx.xx_example_10-1.sv through 10-8.sv (where xx
 * represents section and subsection numbers in the book "SystemVerilog
 * for Design" (first edition).  The file 10.00.00_example_top.sv
 * includes all of the other files.  Simulation only needs to be
 * invoked on this one file.  Conditional compilation switches (`ifdef)
 * is used to compile the examples for simulation or for synthesis.
 *
 * [1] The Verification Guild is an independent e-mail newsletter and
 * moderated discussion forum on hardware verification.  Information on
 * the original Verification Guild example can be found at
 * www.janick.bergeron.com/guild/project.html.
 *
 * Used with permission in the book, "SystemVerilog for Design"
 *  By Stuart Sutherland, Simon Davidmann, and Peter Flake.
 *  Book copyright: 2003, Kluwer Academic Publishers, Norwell, MA, USA
 *  www.wkap.il, ISBN: 0-4020-7530-8
 *
 * Revision History:
 *   1.00 15 Dec 2003 -- original code, as included in book
 *   1.01 10 Jul 2004 -- cleaned up comments, added expected results
 *                       to output messages
 *
 * Caveat: Expected results displayed for this code example are based
 * on an interpretation of the SystemVerilog 3.1 standard by the code
 * author or authors.  At the time of writing, official SystemVerilog
 * validation suites were not available to validate the example.
 *
 * RIGHT TO USE: This code example, or any portion thereof, may be
 * used and distributed without restriction, provided that this entire
 * comment block is included with the example.
 *
 * DISCLAIMER: THIS CODE EXAMPLE IS PROVIDED "AS IS" WITHOUT WARRANTY
 * OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED
 * TO WARRANTIES OF MERCHANTABILITY, FITNESS OR CORRECTNESS. IN NO
 * EVENT SHALL THE AUTHOR OR AUTHORS BE LIABLE FOR ANY DAMAGES,
 * INCLUDING INCIDENTAL OR CONSEQUENTIAL DAMAGES, ARISING OUT OF THE
 * USE OF THIS CODE.
 *********************************************************************/

//`define SYNTHESIS // conditional compilation flag for synthesis
`define VERBOSE // conditional compilation flag for simulation output
`define FWDALL    // conditional compilation flag to forward packets

`define TxPorts 4  // set number of transmit ports
`define RxPorts 4  // set number of receive ports

`include "10.03.00_example_10-1.sv"  // Utopia interface
`include "10.03.00_example_10-2.sv"  // CPU interface
`include "10.04.00_example_10-3.sv"  // squat module
`include "10.05.01_example_10-4.sv"  // utopia1_atm_rx module
`include "10.05.02_example_10-5.sv"  // utopia1_atm_tx module
`include "10.06.00_example_10-6.sv"  // UtopiaMethod interface
`include "10.06.00_example_10-7.sv"  // CPUMethod interface
`include "10.06.00_example_10-8.sv"  // test module
