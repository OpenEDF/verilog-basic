//--------------------------------------------------------------------------
//                            UVM Lab
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
// Brief: uvm barries
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------
`timescale 1ns/1ns
`include "uvm_macros.svh"

import uvm_pkg::*;

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module testebench;

uvm_barrier ba;
//--------------------------------------------------------------------------
// Design: initial and run
//--------------------------------------------------------------------------
initial begin
    ba = new("ba", 4);
    ba.set_threshold(3);
    ba.set_auto_reset(0);
    fork
        process("A", 30);
        process("B", 10);
        process("C", 20);
        process("D", 5);
        monitor_process(ba);
        cancel_process(ba);
    join
end

//--------------------------------------------------------------------------
// Design: uvm barrier task 
//--------------------------------------------------------------------------
task automatic process(input string p_name, int delay);
    $display("[%0t] inside the process-%s", $time, p_name);
    #delay;
    $display("[%0t] process-%s completed", $time, p_name);
    $display("[%0t] process-%s waiting for barrier", $time, p_name);
    ba.wait_for();
    $display("[%0t] process-%s after wait_for method", $time, p_name);
endtask

//--------------------------------------------------------------------------
// Design: monitor process
//--------------------------------------------------------------------------
task monitor_process(ref uvm_barrier bar);
    #15;
    $display("[%0t] threshold value of barrie ba is %0d", $time, bar.get_threshold());
    $display("[%0t] number of process waiting are %0d", $time, bar.get_num_waiters());
endtask

//--------------------------------------------------------------------------
// Design: reset process 
//--------------------------------------------------------------------------
task reset_process(input int th, ref uvm_barrier bar);
    #32
    bar.reset(th);
endtask

//--------------------------------------------------------------------------
// Design: cancel process 
//--------------------------------------------------------------------------
task cancel_process(ref uvm_barrier bar);
    #16;
    $display("[%0t] number of process waiting before cancel is %0d", $time, bar.get_num_waiters());
    bar.cancel();
    $display("[%0t] number of process waiting after cancel is %0d", $time, bar.get_num_waiters());
endtask

endmodule
//--------------------------------------------------------------------------
