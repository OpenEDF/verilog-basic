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

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class env extends uvm_env;

//--------------------------------------------------------------------------
// Design: declare and register
//--------------------------------------------------------------------------
`uvm_component_utils(env)
agent agt;
scoreboard sb;
ral_block_dma_reg regmodel;
dma_adapter m_adapter;

//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function new(string name = "env", uvm_component parent = null);
    super.new(name, parent);
endfunction

//--------------------------------------------------------------------------
// Design: build phase: create and configure of testbench structure
//--------------------------------------------------------------------------
function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agt = agent::type_id::create("agt", this);
    sb  = scoreboard::type_id::create("sb", this);
    regmodel = ral_block_dma_reg::type_id::create("regmodel", this);

    /* Create UVM register hierarchy Not build_phase()! */
    regmodel.build();
    /* Lock register hierarchy and create address map */
    regmodel.lock_model();
    m_adapter = dma_adapter::type_id::create("m_adapter",, get_full_name());
endfunction

//--------------------------------------------------------------------------
// Design: connect phase: establish cross-componement connections
//--------------------------------------------------------------------------
function void connect_phase(uvm_phase phase);
    /* monitor ---> scoreboard */
    agt.mon.item_collect_port.connect(sb.item_collect_export);

    /* Tie Sequencer Adapter to Register Map */
    regmodel.default_map.set_sequencer(.sequencer(agt.seqr), .adapter(m_adapter));
    regmodel.default_map.set_base_addr('h0000_0400);
endfunction

endclass: env
//--------------------------------------------------------------------------
