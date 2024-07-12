//--------------------------------------------------------------------------
//                      systemverilog calss
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
// Brief: systemverilog class test
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
program tb_top;

//--------------------------------------------------------------------------
// Design: declaration data type
//--------------------------------------------------------------------------
int queue_1[$:5];

//--------------------------------------------------------------------------
// Design: inital
//--------------------------------------------------------------------------
initial begin
    /* queue initialization */
    queue_1 = {0, 1, 2 ,3, 4, 5};

    /* size-method */
    $display("-------- queue 1 size is %0d --------", queue_1.size());
    $display("\tqueue_1 = %p", queue_1);

    /* push back method */
    queue_1.push_back(10);
    $display("-------- queue 1 size after delete is %0d --------", queue_1.size());
    foreach(queue_1[i])
        $display("\tqueue_1[%0d] = %0d", i, queue_1[i]);

    /* push fornt method */
    queue_1.push_front(99);
    $display("-------- queue 1 size after push front is %0d --------", queue_1.size());
    foreach(queue_1[i])
        $display("\tqueue_1[%0d] = %0d", i, queue_1[i]);

end

endprogram
//--------------------------------------------------------------------------
