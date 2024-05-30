class router_env extends uvm_env;
  input_agent i_agt;
  reset_agent r_agt;

  `uvm_component_utils(router_env)

  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    i_agt = input_agent::type_id::create("i_agt", this);
    uvm_config_db #(uvm_object_wrapper)::set(this, "i_agt.sqr.main_phase", "default_sequence", packet_sequence::get_type());
    
    // Lab 3 - Task 10, Step 2
    //
    // Configure i_agt's sqr to execute router_input_port_reset_sequence at reset_phase:
    //
    // uvm_config_db #(uvm_object_wrapper)::set(this, "i_agt.sqr.reset_phase", "default_sequence", router_input_port_reset_sequence::get_type());
    //
    // ToDo
    uvm_config_db #(uvm_object_wrapper)::set(this, "i_agt.sqr.reset_phase", "default_sequence", router_input_port_reset_sequence::get_type());


    // In the interest of minimizing lab time, the reset agent has been instantiated and created for you.  The reset sequence execution is also
    // done for you.
    r_agt = reset_agent::type_id::create("r_agt", this);
    uvm_config_db #(uvm_object_wrapper)::set(this, "r_agt.sqr.reset_phase", "default_sequence", reset_sequence::get_type());

  endfunction: build_phase

endclass: router_env
