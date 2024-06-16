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
`uvm_component_utils(env)
ahb_mst_agt          mst_agt;
ahb_lite_scoreboard  ahb_lite_sb;
ahb_lite_coverage    ahb_lite_cov;

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
function ahb_lite_env::new(string name = "env", uvm_component parent = null);
    super.new(name, parent);
endfunction

//--------------------------------------------------------------------------
// Design: build phase: create and configure of testbench structure
//--------------------------------------------------------------------------
function void ahb_lite_env::build_phase(uvm_phase phase);
    super.build_phase(phase);
    mst_agt = agent::type_id::create("ahb_mst_agt", this);
    ahb_lite_sb  = scoreboard::type_id::create("ahb_lite_scoreboard", this);
    ahb_lite_cov = coverage::type_id::create("ahb_lite_coverage", this);
endfunction

//--------------------------------------------------------------------------
// Design: connect phase: establish cross-componement connections
//--------------------------------------------------------------------------
function void ahb_lite_env::connect_phase(uvm_phase phase);
    /* monitor ---> scoreboard */
    mst_agt.mst_mon.item_collect_port.connect(ahb_lite_sb.item_collect_export);
    mst_agt.mst_mon.item_collect_port.connect(ahb_lite_cov.item_cov_export);
endfunction

`ednif /* _AHB_LITE_ENV_ */
//--------------------------------------------------------------------------
