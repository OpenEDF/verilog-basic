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
// Brief: An environment provides a container for agents, scoreboards, and
//        other verification components.
// Change Log:
//--------------------------------------------------------------------------
`ifndef _AHB_LITE_ENV_
`define _AHB_LITE_ENV_

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class ahb_lite_env extends uvm_env;

//--------------------------------------------------------------------------
// Design: declare and register
//--------------------------------------------------------------------------
`uvm_component_utils(ahb_lite_env)
ahb_mst_agt          mst_agt;
ahb_lite_scoreboard  ahb_lite_sb;
ahb_lite_coverage    ahb_lite_cov;
ahb_lite_system_config sys_cfg;
int                  get_db_test_val;
int                  get_db_test_val_1;
int                  get_db_test_val_2;
virtual ahb_mst_intf   ahb_vif;

//--------------------------------------------------------------------------
// Design: declare method 
//--------------------------------------------------------------------------
extern function new(string name = "ahb_lite_env", uvm_component parent = null);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);

endclass: ahb_lite_env

//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function ahb_lite_env::new(string name = "ahb_lite_env", uvm_component parent = null);
    super.new(name, parent);
endfunction

//--------------------------------------------------------------------------
// Design: build phase: create and configure of testbench structure
//--------------------------------------------------------------------------
function void ahb_lite_env::build_phase(uvm_phase phase);
    super.build_phase(phase);
    mst_agt = ahb_mst_agt::type_id::create("mst_agt", this);
    ahb_lite_sb  = ahb_lite_scoreboard::type_id::create("ahb_lite_sb", this);
    ahb_lite_cov = ahb_lite_coverage::type_id::create("ahb_lite_cov", this);
    if (!uvm_config_db#(ahb_lite_system_config)::get(this, "", "ahb_lite_system_config", sys_cfg)) begin
        `uvm_fatal("FATAL MSG", "config object is not set properly");
    end else begin
        `uvm_info(get_type_name(), $sformatf("system configuration:\n%0s", sys_cfg.sprint()), UVM_MEDIUM);
        if (!uvm_config_db#(virtual ahb_mst_intf)::get(this, "", "ahb_vif", ahb_vif)) begin
            `uvm_fatal("FATAL MSG", "ahb lite interface is not set properly");
        end else begin
            sys_cfg.set_vif(ahb_vif);
            if (sys_cfg.ahb_lite_vif == null) begin
                `uvm_fatal("FATAL MSG", "ahb lite interface set fail");
            end
        end
    end

    /* uvm config db test */
    if (!uvm_config_db#(int)::get(this, "*", "db_test_val", get_db_test_val)) begin
        `uvm_fatal("FATAL MSG", "db_test_val get fail");
    end else begin
        `uvm_info(get_type_name(), $sformatf("db_test_val:32'h%0h", get_db_test_val), UVM_HIGH);
    end

    if (!uvm_config_db#(int)::get(null, "", "db_test_val_1", get_db_test_val_1)) begin
        `uvm_fatal("FATAL MSG", "db_test_val get fail");
    end else begin
        `uvm_info(get_type_name(), $sformatf("db_test_val_1:32'h%0h", get_db_test_val_1), UVM_HIGH);
    end

    if (!uvm_config_db#(int)::get(null, "uvm_test_top", "db_test_val_2", get_db_test_val_2)) begin
        `uvm_fatal("FATAL MSG", "db_test_val get fail");
    end else begin
        `uvm_info(get_type_name(), $sformatf("db_test_val_2:32'h%0h", get_db_test_val_2), UVM_HIGH);
    end

endfunction

//--------------------------------------------------------------------------
// Design: connect phase: establish cross-componement connections
//--------------------------------------------------------------------------
function void ahb_lite_env::connect_phase(uvm_phase phase);
    /* monitor ---> scoreboard */
    if (sys_cfg.has_scoreboard) begin
        mst_agt.mst_mon.item_collect_port.connect(ahb_lite_sb.item_collect_export);
    end

    /* monitor ---> coverage */
    //This export provides access to the write method, which derived subscribers must implement.
    if (sys_cfg.has_functional_coverage) begin
        mst_agt.mst_mon.item_collect_port.connect(ahb_lite_cov.analysis_export);
    end
endfunction

`endif /* _AHB_LITE_ENV_ */
//--------------------------------------------------------------------------
