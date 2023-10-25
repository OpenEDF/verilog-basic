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
// Brief: events
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module events_ex;

//--------------------------------------------------------------------------
// Design: events
//--------------------------------------------------------------------------
event ev_1;

initial begin
    fork
        // process-1 trigger the event
        begin
            #40;
            $display("time: %0t process-1 triggering the event", $time);
            ->ev_1;
        end
        // process-2 trigger the event
        begin
            #40;
            $display("time: %0t process-2 waiting for the event to trigger", $time);
            wait(ev_1.triggered);
            /*
            event triggering and waiting for the event trigger will happen at the
            same time.@() operator is used to detecting the event trigger. but as
            triggering and waiting happens at the same time, @() operator will not
            detect the event. this can be solved by using wait() operator;
            */
            //@(ev_1.triggered);
            $display("time: %0t process-2 event triggered", $time);
       end
       // process-3 trigger the event
       begin
            $display("time: %0t process-3 waiting for the event to trigger", $time);
            #60;
            @(ev_1.triggered);
            $display("time: %0t process-3 event triggered", $time);
       end
       // finish
       begin
            #100;
            $display("time: %0t ending the simulation", $time);
            $finish;
       end
    join
end

endmodule
//--------------------------------------------------------------------------
