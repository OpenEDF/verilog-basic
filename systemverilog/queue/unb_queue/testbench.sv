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
bit    [31:0] queue_1[$];
string        queue_2[$];
int           tmp;

//--------------------------------------------------------------------------
// Design: inital
//--------------------------------------------------------------------------
initial begin
    /* queue initialization */
    queue_1 = {0, 1, 2 ,3};
    queue_2 = {"red", "blue", "green"};

    /* size-method */
    $display("-------- queue 1 size is %0d --------", queue_1.size());
    foreach(queue_1[i])
        $display("\tqueue_1[%0d] = %0d", i, queue_1[i]);

    /* insert method */
    queue_1.insert(1, 6);
    $display("-------- queue 1 size after inserting is %0d --------", queue_1.size());
    foreach(queue_1[i])
        $display("\tqueue_1[%0d] = %0d", i, queue_1[i]);

    /* delete method */
    queue_1.delete(4);
    $display("-------- queue 1 size after delete is %0d --------", queue_1.size());
    foreach(queue_1[i])
        $display("\tqueue_1[%0d] = %0d", i, queue_1[i]);

    /* push front method */
    queue_1.push_front(99);
    $display("-------- queue 1 size after push front is %0d --------", queue_1.size());
    foreach(queue_1[i])
        $display("\tqueue_1[%0d] = %0d", i, queue_1[i]);

    /* push back method */
    queue_1.push_back(5);
    $display("-------- queue 1 size after push back is %0d --------", queue_1.size());
    foreach(queue_1[i])
        $display("\tqueue_1[%0d] = %0d", i, queue_1[i]);

    /* pop fornt method */
    tmp = queue_1.pop_back();
    $display("-------- queue 1 size after pop back is %0d --------", queue_1.size());
    $display("queue_1 pop back value: %0d", tmp);
    foreach(queue_1[i])
        $display("\tqueue_1[%0d] = %0d", i, queue_1[i]);

    /* pop back method */
    tmp = queue_1.pop_back();
    $display("-------- queue 1 size after pop back is %0d --------", queue_1.size());
    $display("queue_1 pop back value: %0d", tmp);
    foreach(queue_1[i])
        $display("\tqueue_1[%0d] = %0d", i, queue_1[i]);
end

endprogram
//--------------------------------------------------------------------------
