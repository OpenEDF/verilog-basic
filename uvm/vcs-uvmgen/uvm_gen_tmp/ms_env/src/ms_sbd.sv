//
// Template for UVM Scoreboard

`ifndef MS_SBD__SV
`define MS_SBD__SV

   `uvm_analysis_imp_decl(_ingress)
   `uvm_analysis_imp_decl(_egress) 

class ms_sbd extends uvm_scoreboard;

   uvm_analysis_imp_ingress #(m_item,ms_sbd) before_export;
   uvm_analysis_imp_egress #(s_item,ms_sbd) after_export;
   // Built in UVM comparator will not be used. User has to define the compare logic

   `uvm_component_utils(ms_sbd)
	extern function new(string name = "ms_sbd",
                    uvm_component parent = null); 
	extern virtual function void build_phase (uvm_phase phase);
	extern virtual function void connect_phase (uvm_phase phase);
	extern virtual task main_phase(uvm_phase phase);
	extern virtual function void report_phase(uvm_phase phase);
 	extern function void write_ingress(m_item tr);
	extern function void write_egress(s_item tr);

endclass: ms_sbd


function ms_sbd::new(string name = "ms_sbd",
                 uvm_component parent);
   super.new(name,parent);
endfunction: new

function void ms_sbd::build_phase(uvm_phase phase);
    super.build_phase(phase);
    before_export = new("before_export", this);
    after_export  = new("after_export", this);
endfunction:build_phase

function void ms_sbd::connect_phase(uvm_phase phase);
endfunction:connect_phase

task ms_sbd::main_phase(uvm_phase phase);
    super.main_phase(phase);
    phase.raise_objection(this,"scbd..");
    phase.drop_objection(this);
endtask: main_phase 

function void ms_sbd::report_phase(uvm_phase phase);
    super.report_phase(phase);
endfunction:report_phase

function void ms_sbd::write_ingress(m_item tr);
// User needs to add functionality here 
endfunction

function  void ms_sbd::write_egress(s_item tr);
endfunction
`endif // MS_SBD__SV
