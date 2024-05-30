class test_base extends uvm_test;
  `uvm_component_utils(test_base)

  router_env env;

  virtual router_io router_vif;
  virtual reset_io  reset_vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    env = router_env::type_id::create("env", this);

    uvm_resource_db#(virtual router_io)::read_by_type("router_vif", router_vif, this);
    uvm_resource_db#(virtual reset_io)::read_by_type("reset_vif", reset_vif, this);


    // Lab 4 - Task 4, Step 7
    //
    // In the environment, the input agent has changed from a single instance to an array of 16
    // agents.  Within the test, the corresponding change also must take place.
    //
    // Change the following configuration for the input agent objects to the following:
    //
    // uvm_config_db#(virtual router_io)::set(this, "env.i_agt[*]", "vif", router_vif);
    //
    // ToDo
    uvm_config_db#(virtual router_io)::set(this, "env.i_agt", "vif", router_vif);



    // Lab 4 - Task 7, Step 7
    //
    // In the environment, an array of output agent has been added.  Each of these agents need to
    // access the physical signal.  Configure the agents as follows:
    //
    // uvm_config_db#(virtual router_io)::set(this, "env.o_agt[*]", "vif", router_vif);
    //
    // ToDo


    uvm_config_db#(virtual reset_io)::set(this, "env.r_agt", "vif", reset_vif);

    // Lab 4 - Task 8, Step 11
    //
    // Change the scoreboard instance in the environment to be an instance of the ms_scoreboard
    // with type override.
    //
    // set_type_override_by_type(scoreboard::get_type(), ms_scoreboard::get_type());
    //
    // ToDo


  endfunction: build_phase

  // Lab 4 - Task 9, Step 2
  //
  // Comment out the entire main_phase() method.
  //
  // ToDo

  virtual task main_phase(uvm_phase phase);
    uvm_objection objection;
    super.main_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    // Lab 4 - Task 8, Step 4
    //
    // Retrieve the objection handle for the phase, then set drain time to 1us:
    //
    // objection = phase.get_objection();
    // objection.set_drain_time(this, 1us);
    //
    // ToDo



  endtask: main_phase


  virtual task shutdown_phase(uvm_phase phase);
    super.shutdown_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    // Lab 4 - Task 9, Step 3
    //
    // Wait for scoreboard to be at the done state.
    //
    // env.sb.wait_for_done();
    //
    // ToDo





    // Lab 4 - Task 9, Step 6
    //
    // Raise and drop phase objections around the wait_for_done() call in the above code.
    //
    // ToDo



  endtask: shutdown_phase

  // The report phase is added to display the scoreboard results.
  virtual function void report_phase(uvm_phase phase);
    super.report_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    // Lab 4 - Task 7, Step 8
    //
    // Add a statement to print scoreboard content.
    //
    // `uvm_info("SB_REPORT", {"\n", env.sb.convert2string()}, UVM_MEDIUM);
    //
    // ToDo


  endfunction: report_phase

  // The verbosity for the lab to print topology and factory content is raised
  // to UVM_DEBUG to avoid dumping too much data.
  virtual function void final_phase(uvm_phase phase);
    super.final_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    if (uvm_report_enabled(UVM_DEBUG, UVM_INFO, "TOPOLOGY")) begin
      uvm_root::get().print_topology();
    end

    if (uvm_report_enabled(UVM_DEBUG, UVM_INFO, "FACTORY")) begin
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
    // The following has been changed from previous lab to configure all agents
    set_inst_override_by_type("env.i_agt[*].sqr.*", packet::get_type(), packet_da_3::get_type());
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
    // The following has been changed from previous lab to configure all agents
    uvm_config_db#(packet_sequence::int_q_t)::set(this, "env.i_agt[*].sqr.packet_sequence", "valid_da", valid_da);
    uvm_config_db#(int)::set(this, "env.i_agt[*].sqr.packet_sequence", "item_count", 20);
  endfunction: build_phase
endclass: test_da_3_seq

