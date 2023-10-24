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
// Brief: semaphore methods
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module semaphore_ex;

semaphore sema;  //declaring
semaphore sema_a;  //declaring

//--------------------------------------------------------------------------
// Design: semaphore methods 
//--------------------------------------------------------------------------
initial begin
    sema = new(1); // creating sema with '1' key
    fork
        display_test();
        display_test();
    join
end

//--------------------------------------------------------------------------
// Design: display method 
//--------------------------------------------------------------------------
task automatic display_test();
    sema.get();  //getting '1'
    $display("time: %0t current simulation time", $time);
    #30;
    sema.put(); //putting '1'
endtask

//--------------------------------------------------------------------------
// Design: semaphore methods 
//--------------------------------------------------------------------------
initial begin
    sema_a = new(4); // creating sema with '1' key
    fork
        display_test_a(1);
        display_test_a(2);
    join
end

//--------------------------------------------------------------------------
// Design: display method 
//--------------------------------------------------------------------------
task automatic display_test_a(int num);
    sema_a.try_get(4);  //getting '4'
    //sema_a.get(4);  //getting '4'
    $display("time: %0t current simulation time #%0d", $time, num);
    #30;
    sema_a.put(4); //putting '4'
endtask
endmodule
//--------------------------------------------------------------------------
