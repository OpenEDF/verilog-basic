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
// Brief: events order
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module events_order;

//--------------------------------------------------------------------------
// Design: events
//--------------------------------------------------------------------------
event ev_1;
event ev_2;
event ev_3;

initial begin
    fork
        // process-1 trigger the event
        begin
            //#1;
            #4;
            $display("time: %0t process-1 triggering the event 1", $time);
            ->ev_1;
        end
        // process-2 trigger the event
        begin
            #2;
            $display("time: %0t process-2 triggered the event 2", $time);
            ->ev_2;
       end
       // process-3 trigger the event
       begin
           #8;
           $display("time: %0t process-3 triggered the event 3", $time);
            ->ev_3;
       end
       // finish
       begin
            $display("time: %0t waiting for the event's to trigger", $time);
            wait_order(ev_2, ev_1, ev_3)
                $display("time: %0t event's triggered inorder", $time);
            else
                $display("time: %0t event's triggered out-of-order", $time);
            $finish;
       end
    join
end

endmodule
//--------------------------------------------------------------------------
