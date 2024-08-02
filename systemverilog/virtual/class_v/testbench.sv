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
// Class 
//--------------------------------------------------------------------------
virtual class base_class;

int data;
int addr;
int status;
int sum;
    
function new();
    data = 32'h1234_abcd;
    $display("[%0t] inside base class", $time);
endfunction

virtual function calsulate_sum(int a, int b);
    this.sum = a + b; 
    $display("[%0t] inside sum function", $time);
endfunction

pure virtual function int get_data();
endclass

class extended_class extends base_class;
int tmp;

function new();
    this.data = 32'h5678_00FF;
    this.addr = 32'hFF00_00FF;
    this.status = 32'h0000_0001;
    this.calsulate_sum(this.data, this.status);
    $display("[%0t] inside extended class", $time);
endfunction

virtual function int get_data();
    tmp = data;
    $display("[%0t] tmp = 0x%h", $time, tmp);
    return tmp;
endfunction

endclass

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module tb_top;

//--------------------------------------------------------------------------
// Design: declaration data type
//--------------------------------------------------------------------------
extended_class child;
//--------------------------------------------------------------------------
// Design: inital
//--------------------------------------------------------------------------
initial begin
    child = new();
    $display("[%0t] data = 0x%0h", $time, child.data);
    $display("[%0t] addr = 0x%0h", $time, child.addr);
    $display("[%0t] status = 0x%0h", $time, child.status);
    $display("[%0t] sum = 0x%0h", $time, child.sum);
    child.get_data();
end

endmodule
//--------------------------------------------------------------------------
