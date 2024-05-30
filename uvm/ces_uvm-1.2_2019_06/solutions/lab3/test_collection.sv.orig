class test_base extends uvm_test;
  `uvm_component_utils(test_base)

  router_env env;

  // Lab 3 - Task 6, Step 2
  //
  // Declare two virtual interface handles - router_vif and reset_vif.
  //
  // virtual router_io router_vif;
  // virtual reset_io  reset_vif;
  //
  // The router_io interface contains the signals to all of the router's ports.
  // The reset_io interface contains the reset signal.
  //
  // ToDo



  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    env = router_env::type_id::create("env", this);

    // Lab 3 - Task 6, Step 4
    //
    // Retrieve the interfaces from the resource database.
    //
    // uvm_resource_db#(virtual router_io)::read_by_type("router_vif", router_vif, this);
    // uvm_resource_db#(virtual reset_io)::read_by_type("reset_vif", reset_vif, this);
    //
    // ToDo




    // Lab 3 - Task 6, Step 5
    //
    // At the test level, configuration of components dedicated to a DUT interface should be done via
    // the agent connected to that interface.  The test developer should treat the agent as the
    // Bus Functional Model (BFM) for the interface without needing to know anything about the
    // sub-components of the agent.
    //
    // uvm_config_db#(virtual router_io)::set(this, "env.i_agt", "vif", router_vif);
    // uvm_config_db#(virtual reset_io)::set(this, "env.r_agt", "vif", reset_vif);
    //
    // ToDo




  endfunction: build_phase

  virtual function void final_phase(uvm_phase phase);
    super.final_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    if (uvm_report_enabled(UVM_MEDIUM, UVM_INFO, "TOPOLOGY")) begin
      uvm_root::get().print_topology();
    end

    if (uvm_report_enabled(UVM_MEDIUM, UVM_INFO, "FACTORY")) begin
      uvm_factory::get().print();
    end
  endfunction: final_phase
endclass: test_base

class test_da_3_inst extends test_base;
  `uvm_component_utils(test_da_3_inst)

  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    set_inst_override_by_type("env.i_agt.sqr.*", packet::get_type(), packet_da_3::get_type());
  endfunction: build_phase
endclass: test_da_3_inst

class test_da_3_type extends test_base;
  `uvm_component_utils(test_da_3_type)

  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    set_type_override_by_type(packet::get_type(), packet_da_3::get_type());
  endfunction: build_phase
endclass: test_da_3_type

class test_da_3_seq extends test_base;
  `uvm_component_utils(test_da_3_seq)

  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    packet_sequence::int_q_t valid_da = {3};
    super.build_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    uvm_config_db#(packet_sequence::int_q_t)::set(this, "env.i_agt.sqr.packet_sequence", "valid_da", valid_da);
    uvm_config_db#(int)::set(this, "env.i_agt.sqr.packet_sequence", "item_count", 20);
  endfunction: build_phase
endclass: test_da_3_seq

