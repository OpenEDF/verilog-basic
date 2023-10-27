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
    fork
        begin //process-1 
            $display("[%0t] inside the process-a",$time);
            #20;
            $display("[%0t] process-a completed",$time);
            $display("[%0t] process-a waiting for barrier",$time);
            ba.wait_for();
            $display("[%0t] process-a after wait_for method",$time);
        end
        begin //process-2 
            $display("[%0t] inside the process-b",$time);
            #10;
            $display("[%0t] process-b completed",$time);
            $display("[%0t] process-b waiting for barrier",$time);
            ba.wait_for();
            $display("[%0t] process-b after wait_for method",$time);
        end
        begin //process-3 
            $display("[%0t] inside the process-c",$time);
            #30;
            $display("[%0t] process-c completed",$time);
            $display("[%0t] process-c waiting for barrier",$time);
            ba.wait_for();
            $display("[%0t] process-c after wait_for method",$time);
        end
        begin //process-4 
            $display("[%0t] inside the process-d",$time);
            #5;
            $display("[%0t] process-d completed",$time);
            $display("[%0t] process-d waiting for barrier",$time);
            ba.wait_for();
            $display("[%0t] process-d after wait_for method",$time);
        end
    join
end

endmodule
//--------------------------------------------------------------------------
