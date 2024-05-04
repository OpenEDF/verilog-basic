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
// Brief: The driver drives randomized transactions or sequence items to DUT
//        as a pin-level activity using an interface.
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class dma_adapter extends uvm_reg_adapter;

//--------------------------------------------------------------------------
// Design: declare and register
//--------------------------------------------------------------------------
`uvm_object_utils(dma_adapter)

//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function new(string name = "dma_adapter");
    super.new(name);
endfunction

//--------------------------------------------------------------------------
// Design: reg2bus method
//--------------------------------------------------------------------------
function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
    /* transfer */
    seq_item tx;
    tx = seq_item::type_id::create("tx");
    tx.wr_en = (rw.kind == UVM_WRITE);
    tx.addr  = rw.addr;

    /* write operation */
    if (tx.wr_en) begin
        tx.wdata = rw.data;
    end

    /* read operation */
    if (!tx.wr_en) begin
        tx.rdata = rw.data;
    end

    /* return item */
    return tx;
endfunction

//--------------------------------------------------------------------------
// Design: bus2reg method
//--------------------------------------------------------------------------
function void bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
    /* transfer */
    seq_item tx;
    assert($cast(tx, bus_item))
        else `uvm_fatal(get_type_name, "A bad thing has just happened in my dadpter");

    /* bus to reg  */
    rw.kind = tx.wr_en ? UVM_WRITE : UVM_READ;
    rw.addr = tx.addr;
    rw.data = tx.rdata;
    rw.status = UVM_IS_OK;
endfunction

endclass: dma_adapter
//--------------------------------------------------------------------------
