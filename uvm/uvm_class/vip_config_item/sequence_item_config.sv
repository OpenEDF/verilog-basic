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
// Brief: uvm sequence item example 
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class sequence_item_config extends uvm_sequence_item;

//--------------------------------------------------------------------------
// Design: control signal 
//--------------------------------------------------------------------------
rand bit [3:0] addr;
rand bit       wr_en;
rand bit       rd_en;

rand bit [7:0] wdata;
bit      [7:0] rdata;
int            data1;
int            data2;
int            sum;

//--------------------------------------------------------------------------
// Design: utility and field macros
//--------------------------------------------------------------------------
`uvm_object_utils_begin(sequence_item_config)
    `uvm_field_int(addr, UVM_ALL_ON)
    `uvm_field_int(wr_en, UVM_ALL_ON)
    `uvm_field_int(rd_en, UVM_ALL_ON)
    `uvm_field_int(wdata, UVM_ALL_ON)
    `uvm_field_int(data1, UVM_ALL_ON)
    `uvm_field_int(data2, UVM_ALL_ON)
    `uvm_field_int(sum, UVM_ALL_ON)
`uvm_object_utils_end

//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function new(string name = "mem_seq_item");
    super.new(name);
endfunction


//--------------------------------------------------------------------------
// Design: sum
//--------------------------------------------------------------------------
virtual function data_sum(int a, int b);
    this.sum = a + b;
endfunction

//--------------------------------------------------------------------------
// Design:i get sum
//--------------------------------------------------------------------------
virtual function int get_sum();
    return sum;
endfunction

//--------------------------------------------------------------------------
// Design: constructor
//--------------------------------------------------------------------------
constraint wr_rd_c {wr_en != rd_en;};

endclass: sequence_item_config 
