//
// Template for UVM Scoreboard

`ifndef SCB__SV
`define SCB__SV


class scb extends uvm_scoreboard;

   uvm_analysis_export #(tra1) before_export, after_export;
   uvm_in_order_class_comparator #(tra1) comparator;

   `uvm_component_utils(scb)
	extern function new(string name = "scb",
                    uvm_component parent = null); 
	extern virtual function void build_phase (uvm_phase phase);
	extern virtual function void connect_phase (uvm_phase phase);
	extern virtual task main_phase(uvm_phase phase);
	extern virtual function void report_phase(uvm_phase phase);

endclass: scb


function scb::new(string name = "scb",
                 uvm_component parent);
   super.new(name,parent);
endfunction: new

function void scb::build_phase(uvm_phase phase);
    super.build_phase(phase);
    before_export = new("before_export", this);
    after_export  = new("after_export", this);
    comparator    = new("comparator", this);
endfunction:build_phase

function void scb::connect_phase(uvm_phase phase);
    before_export.connect(comparator.before_export);
    after_export.connect(comparator.after_export);
endfunction:connect_phase

task scb::main_phase(uvm_phase phase);
    super.main_phase(phase);
    phase.raise_objection(this,"scbd..");
	comparator.run();
    phase.drop_objection(this);
endtask: main_phase 

function void scb::report_phase(uvm_phase phase);
    super.report_phase(phase);
    `uvm_info("SBRPT", $psprintf("Matches = %0d, Mismatches = %0d",
               comparator.m_matches, comparator.m_mismatches),
               UVM_MEDIUM);
endfunction:report_phase

`endif // SCB__SV
