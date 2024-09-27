`ifndef MY_CASE0__SV
`define MY_CASE0__SV
class case0_sequence extends uvm_sequence #(my_transaction);
   my_transaction m_trans;

   function  new(string name= "case0_sequence");
      super.new(name);
   endfunction 
   
   virtual task pre_body();
      `uvm_info("sequence0", "pre_body is called!!!", UVM_LOW)
   endtask
   
   virtual task post_body();
      `uvm_info("sequence0", "post_body is called!!!", UVM_LOW)
   endtask
   
   virtual task body();
      if(starting_phase != null) 
         starting_phase.raise_objection(this);
      #100;
      `uvm_info("sequence0", "body is called!!!", UVM_LOW)
      if(starting_phase != null) 
         starting_phase.drop_objection(this);
   endtask

   `uvm_object_utils(case0_sequence)
endclass


class my_case0 extends base_test;

   function new(string name = "my_case0", uvm_component parent = null);
      super.new(name,parent);
   endfunction 
   extern virtual function void build_phase(uvm_phase phase); 
    extern virtual function void end_of_elaboration_phase(uvm_phase phase);
    extern virtual function void start_of_simulation_phase(uvm_phase phase);
   `uvm_component_utils(my_case0)
endclass


function void my_case0::build_phase(uvm_phase phase);
   case0_sequence cseq;
   super.build_phase(phase);

   cseq = new("cseq");
   uvm_config_db#(uvm_sequence_base)::set(this, 
                                           "env.i_agt.sqr.main_phase", 
                                           "default_sequence", 
                                           cseq);
endfunction

//--------------------------------------------------------------------------
// Design: end of elaboration phase
//--------------------------------------------------------------------------
function void my_case0::end_of_elaboration_phase(uvm_phase phase);
    /* show uvm class arch */
    `uvm_info(get_type_name(), "IN end_of_elaboration_phase...", UVM_HIGH);
    uvm_config_db#(int)::dump();
    uvm_factory::get().print();
endfunction

//--------------------------------------------------------------------------
// Design: Get ready for DUT to be simulated
//--------------------------------------------------------------------------
function void my_case0::start_of_simulation_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN start_of_simulation_phase..", UVM_HIGH);
    /* display environment topology */
    uvm_root::get().print_topology(uvm_default_table_printer);
endfunction

`endif
