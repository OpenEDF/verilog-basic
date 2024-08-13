//--------------------------------------------------------------------------
//                         RISC-V Core
//                            V1.0.0
//                         openedf.com
//                     Copyright 2023-2024
//
//                     makermuyi@gmail.com
//
//                       License: BSD
//--------------------------------------------------------------------------
//
// Copyright (c) 2020-2021, openedf.com
// All rights reserved.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
// LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
// THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
// SUCH DAMAGE.

//--------------------------------------------------------------------------
// Designer: macro
// Brief: testbench for sigle bit sync
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------
`timescale 1ns/1ns

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module testbench();

parameter simulation_cycle = 10;
//--------------------------------------------------------------------------
// internal sigle
//--------------------------------------------------------------------------
bit         systemclock;
bit         rst_n;
logic       data_in;
wire        data_ou;

//--------------------------------------------------------------------------
// Design: create the clock
//--------------------------------------------------------------------------
initial begin
    systemclock = 1'b0;
    forever #(simulation_cycle / 2) systemclock = ~systemclock;
end

//--------------------------------------------------------------------------
// Design: reset design
//--------------------------------------------------------------------------
task system_reset();
    $display("[%0t]: system reset...", $time);
    rst_n = 1'b0;
    data_in = 1'b0; 
    repeat (1) #simulation_cycle;
    rst_n <= 1'b1;
endtask: system_reset

//--------------------------------------------------------------------------
// Design: reset design
//--------------------------------------------------------------------------
task system_exit();
    $display("[%0t]: system exit...", $time);
    repeat (10) #simulation_cycle;
    $finish();
endtask: system_exit

//--------------------------------------------------------------------------
// Design: reset design
//--------------------------------------------------------------------------
task system_main();
    $timeformat(-9, 2, "ns");
    $display("[%0t]: system main run...", $time);
    repeat(1) begin
        data_in = 1'b1; 
        @(posedge systemclock);
        $display("[%0t]: system input data: %0d", $time, data_in);
        @(posedge systemclock);
        data_in = 1'b0; 
        @(posedge systemclock);
        @(posedge systemclock);
        $display("[%0t]: system output data: %0d", $time, data_ou);
    end
endtask: system_main

//--------------------------------------------------------------------------
// Design: main
//--------------------------------------------------------------------------
initial begin
    system_reset();
    system_main();
    system_exit();
end

//--------------------------------------------------------------------------
// Design: dump .fsdb file
//--------------------------------------------------------------------------
initial begin
    $fsdbDumpfile("testbench.fsdb");
    $fsdbDumpvars(0, testbench);
end

//--------------------------------------------------------------------------
// Design: instance sync 1bit 
//--------------------------------------------------------------------------
sync_1bit # (
    /*autoinstparam*/
    .N_STATES               (3                              ) 
    )
    sync_1bit_u (
    /*autoinst*/
    // inputs
    .clk                    (systemclock                    ), //input
    .rst_n                  (rst_n                          ), //input
    .i_data                 (data_in                        ), //input
    // outputs
    .o_data                 (data_ou                        )  //input
);

endmodule
//--------------------------------------------------------------------------
