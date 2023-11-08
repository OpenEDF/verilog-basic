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
module uvm_events_ex;

uvm_event ev[string];
//--------------------------------------------------------------------------
// Design: initial and run
//--------------------------------------------------------------------------
initial begin
    ev["ev_1"] = new();
    ev["ev_2"] = new();
    fork
        begin
            #40;
            $display("time: %0t [ev-0] triggering the event", $time);
            ev["ev_1"].trigger;
            #40;
            ev["ev_1"].reset;
            $display("time: %0t [ev-0] event off or reset", $time);
        end
        begin
            $display("time: %0t [ev-0] waiting for the event to trigger", $time);
            ev["ev_1"].wait_on;
            if (ev["ev_1"].is_on)
                $display("time: %0t [ev-0] event triggered is on", $time);

            $display("time: %0t [ev-0] event triggered wait on", $time);
            #100;
            ev["ev_1"].wait_off;
            if (ev["ev_1"].is_off)
                $display("time: %0t [ev-0] event triggered is off", $time);
            $display("time: %0t [ev-0] event triggered wait off", $time);
        end
        begin
            #50;
            $display("time: %0t [ev-1] triggering the event", $time);
            ev["ev_2"].trigger;
            #50;
            ev["ev_2"].reset;
            $display("time: %0t [ev-1] event off or reset", $time);
        end
        begin
            $display("time: %0t [ev-1] waiting for the event to trigger", $time);
            ev["ev_2"].wait_on;
            if (ev["ev_2"].is_on)
                $display("time: %0t [ev-1] event triggered is on", $time);

            $display("time: %0t [ev-1] event triggered wait on", $time);
            #120;
            ev["ev_2"].wait_off;
            if (ev["ev_2"].is_off)
                $display("time: %0t [ev-1] event triggered is off", $time);
            $display("time: %0t [ev-1] event triggered wait off", $time);
        end
    join
end

endmodule
//--------------------------------------------------------------------------
