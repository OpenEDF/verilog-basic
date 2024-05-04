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
// Brief: uvm sequence
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class base_seq extends uvm_sequence;

//--------------------------------------------------------------------------
// Design: declear and register
//--------------------------------------------------------------------------
`uvm_object_utils(base_seq)
ral_block_dma_memory_map_dma_address_block regmodel;
uvm_phase starting_phase;

//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function new(string name = "base_seq");
    super.new(name);
endfunction

//--------------------------------------------------------------------------
// Design: sequence, your stimulus code, this is the user-defined task
//         whers the main sequence code resides.
// uvm_do:
//        start_item(item);
//        item.randaomize();
//        finish_item(item);
//--------------------------------------------------------------------------
task body();
    uvm_status_e   status;
    uvm_reg_data_t incoming;
    bit [31:0]     rdata;
    `uvm_info(get_type_name(), "base seq: inside body", UVM_LOW);

    if (starting_phase != null) begin
       starting_phase.raise_objection(this);
    end

    // write to the registers
    regmodel.INTR.write(status, 32'h1234_1234);
    regmodel.CTRL.write(status, 32'h1234_5678);
    regmodel.IO_ADDR.write(status, 32'h1234_9ABC);
    regmodel.MEM_ADDR.write(status, 32'h1234_DEF0);

    // read from the registers
    regmodel.INTR.read(status, rdata);
    regmodel.CTRL.read(status, rdata);
    regmodel.IO_ADDR.read(status, rdata);
    regmodel.MEM_ADDR.read(status, rdata);

    if (starting_phase !=  null) begin
        starting_phase.drop_objection(this);
    end
endtask

endclass: base_seq
//--------------------------------------------------------------------------
