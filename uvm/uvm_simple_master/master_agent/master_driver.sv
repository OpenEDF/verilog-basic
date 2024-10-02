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
`ifndef _MASTER_DRIVER_SV_
`define _MASTER_DRIVER_SV_

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class master_driver extends uvm_driver#(master_seq_item);

//--------------------------------------------------------------------------
// Design: declare and register
//--------------------------------------------------------------------------
`uvm_component_utils(master_driver)

//--------------------------------------------------------------------------
// Design: extern method
//--------------------------------------------------------------------------
extern function new(string name = "master_driver", uvm_component parent = null);
extern virtual function void build_phase(uvm_phase phase);
extern virtual task run_phase(uvm_phase phase);

endclass: master_driver

//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function master_driver::new(string name = "master_driver", uvm_component parent = null);
    super.new(name, parent);
endfunction

//--------------------------------------------------------------------------
// Design: build phase: create and configure of testbench structure
//--------------------------------------------------------------------------
function void master_driver::build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(), "build phase Entered...",UVM_HIGH);

    `uvm_info(get_type_name(), "build phase Exited...",UVM_HIGH);
endfunction

//--------------------------------------------------------------------------
// Design: run phase: stmulate the DUT
//--------------------------------------------------------------------------
task master_driver::run_phase(uvm_phase phase);
    REQ req;
    RSP rsp;
    `uvm_info(get_type_name(), "run phase Entered...",UVM_HIGH);
    forever begin
        rsp = master_seq_item::type_id::create("rsp", this);
        /* request */
        seq_item_port.get_next_item(req);
        `uvm_info(get_type_name(), {"req:\n", req.sprint()}, UVM_MEDIUM);
        #10;
        seq_item_port.item_done();

        /* response */
        rsp.set_id_info(req);
        rsp.HADDR  = req.HADDR;
        rsp.HWDATA = req.HWDATA;
        seq_item_port.put_response(rsp);
    end

    `uvm_info(get_type_name(), "run phase Exited...",UVM_HIGH);
endtask

`endif /* _MASTER_DRIVER_SV_ */
//--------------------------------------------------------------------------
