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
// Brief: uvm sequence test
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------
`timescale 1ns/1ps
`include "uvm_macros.svh"

import uvm_pkg::*;
`include "sequence_item.sv"

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module testebench;
//--------------------------------------------------------------------------
// Design: instance
//--------------------------------------------------------------------------
mem_seq_item seq_item;
mem_seq_item seq_item_1;
mem_seq_item seq_item_2;
mem_seq_item seq_item_3;
mem_seq_item seq_item_4;
mem_seq_item seq_item_5;
bit bit_packed_data[];
byte unsigned byte_packed_data[];
int unsigned int_packed_data[];

//--------------------------------------------------------------------------
// Design: initial and run
//--------------------------------------------------------------------------
initial begin
    /* log output */
    `uvm_info("TEST", "uvm base class method test start !", UVM_LOW)
    /* create method */
    seq_item = mem_seq_item::type_id::create("seq_item");
    seq_item_1 = mem_seq_item::type_id::create("seq_item_1");
    seq_item_3 = mem_seq_item::type_id::create("seq_item_3");
    seq_item_4 = mem_seq_item::type_id::create("seq_item_4");
    seq_item_5 = mem_seq_item::type_id::create("seq_item_5");

    /* randomizing the seq_item */
    seq_item.randomize();

    /* printing the seq_item */
    seq_item.print();

    /* copy method */
    seq_item_1.copy(seq_item); // copy seq_item to seq_item_1
    seq_item_1.print();

    /* clone method */
    $cast(seq_item_2, seq_item.clone()); // create and copy seq_item to seq_item_2
    seq_item_2.print();

    /* compare method */
    if(seq_item.compare(seq_item_1)) begin
        `uvm_info("", "sequ_item matching with seq_item_1", UVM_LOW)
        `uvm_info("", "sequ_item matching with seq_item_1 begin end test!", UVM_LOW)
    end
    else
        `uvm_error("", "sequ_item is not matching with seq_item_1")

    /* not matching case */
    seq_item_1.randomize();
    seq_item_1.print();
    if(seq_item.compare(seq_item_1))
        `uvm_info("COMPARE", "sequ_item matching with seq_item_1", UVM_LOW)
    else
        `uvm_error("COMPARE", "sequ_item is not matching with seq_item_1")

    /* packed modthod */
    seq_item.pack(bit_packed_data); //pack method
    seq_item.print();
    foreach(bit_packed_data[i])
        `uvm_info("PACK", $sformatf("bit_packed_data[%0d] = %b", i, bit_packed_data[i]), UVM_LOW)

    /* unpack method */
    `uvm_info("UNPACK", "before unpack", UVM_LOW)
    seq_item_3.print();
    seq_item_3.unpack(bit_packed_data);  //unpack method
    `uvm_info("UNPACK", "after unpack", UVM_LOW)
    seq_item_3.print();

    /* packed modthod by byte */
    seq_item.pack_bytes(byte_packed_data); //pack method
    seq_item.print();
    foreach(byte_packed_data[i])
        `uvm_info("PACK", $sformatf("bit_packed_data[%0d] = %b", i, byte_packed_data[i]), UVM_LOW)

    /* unpack method */
    `uvm_info("UNPACK", "before unpack", UVM_LOW)
    seq_item_4.print();
    seq_item_4.unpack_bytes(byte_packed_data);  //unpack method
    `uvm_info("UNPACK", "after unpack", UVM_LOW)
    seq_item_4.print();

    /* packed modthod by int */
    seq_item.pack_ints(int_packed_data); //pack method
    seq_item.print();
    foreach(int_packed_data[i]) begin
        `uvm_info("PACK", $sformatf("bit_packed_data[%0d] = %b", i, int_packed_data[i]), UVM_LOW)
        `uvm_info("PACK", $sformatf("bit_packed_data[%0d] = %d", i, int_packed_data[i]), UVM_LOW)
    end

    /* unpack method */
    `uvm_info("UNPACK", "before unpack", UVM_LOW)
    seq_item_5.print();
    seq_item_5.unpack_ints(int_packed_data);  //unpack method
    `uvm_info("UNPACK", "after unpack", UVM_LOW)
    seq_item_5.print();
    /* log output */
    `uvm_info("TEST", "uvm base class method test end !", UVM_LOW)
end

endmodule
