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
class driver extends uvm_driver#(seq_item);

//--------------------------------------------------------------------------
// Design: declare and register
//--------------------------------------------------------------------------
`define DRIV_IF vif.DRIVER.driver_cb
virtual dma_if vif;
`uvm_component_utils(driver)

//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function new(string name = "driver", uvm_component parent = null);
    super.new(name, parent);
endfunction

//--------------------------------------------------------------------------
// Design: build phase: create and configure of testbench structure
//--------------------------------------------------------------------------
function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual dma_if) :: get(this, "", "vif", vif))
        `uvm_fatal(get_type_name(), "vif not set the top level!");
endfunction

//--------------------------------------------------------------------------
// Design: run phase: stmulate the DUT
//--------------------------------------------------------------------------
task run_phase(uvm_phase phase);
    forever begin
        seq_item_port.get_next_item(req);
        `uvm_info(get_type_name, {"\n", req.sprint()}, UVM_LOW);
        driver();
        seq_item_port.item_done();
    end
endtask

//--------------------------------------------------------------------------
// Design: transaction level to signal level
//--------------------------------------------------------------------------
task driver();
    wait(vif.DRIVER.rst_n == 1);
    `DRIV_IF.wr_en <= 0;
    @(posedge vif.DRIVER.clk);
    `DRIV_IF.addr  <= req.addr;
    `DRIV_IF.valid <= 1;
    `DRIV_IF.wr_en <= req.wr_en;
    if (req.wr_en) begin
        `DRIV_IF.wdata <= req.wdata;
        @(posedge vif.DRIVER.clk);
    end else begin
        @(posedge vif.DRIVER.clk);
        `DRIV_IF.valid <= 0;
        @(posedge vif.DRIVER.clk);
        req.rdata  <= `DRIV_IF.rdata;
    end
    `DRIV_IF.valid <= 0;
endtask: driver

endclass: driver
//--------------------------------------------------------------------------
