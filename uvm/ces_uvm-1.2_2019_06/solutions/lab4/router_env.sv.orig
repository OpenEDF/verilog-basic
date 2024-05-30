class router_env extends uvm_env;
  `uvm_component_utils(router_env)

  reset_agent r_agt;

  // Lab 4 - Task 4, Step 2
  //
  // The environment need 16 individual input agents.  One for each DUT port.
  //
  // Change the following single instance of agent into an array of 16 agents: i_agt[16].
  //
  // ToDo
  input_agent i_agt;



  // Lab 4 - Task 7, Step 2
  //
  // Create an instance of scoreboard, call it sb.
  // Create an array of output_agent, call it o_agt[16].
  //
  // If you examine the output_agent code, you will find that the output_agent only contains
  // an instance of oMonitor.  This is because for the sake of lab simplicity, the DUT output
  // protocal was designed without the need of a responder (push mode).  Even though there are
  // no sequencer nor drivers in the output agent, the output agent should still be created and
  // instantiated in the environment.  For flexibility of environment maintenance, this will be
  // better in the longer run for unanticipated changes.
  //
  // ToDo





  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    r_agt = reset_agent::type_id::create("r_agt", this);
    uvm_config_db #(uvm_object_wrapper)::set(this, "r_agt.sqr.reset_phase", "default_sequence", reset_sequence::get_type());


    // Lab 4 - Task 4, Step 3 & 4
    //
    // Change the following construction and configuration of a single instance of input agent into
    // construction and configuration of all agents in the agent array.
    //
    // Configure each agent's port_id to a dedicated port.
    // Configure each agent's sequencer to execute router_input_port_reset_sequence as the default_sequence in reset_phase.
    // Configure each agent's sequencer to execute packet_sequence as the default_sequence in main_phase.
    //
    // foreach (i_agt[i]) begin
    //   i_agt[i] = input_agent::type_id::create($sformatf("i_agt[%0d]", i), this);
    //   uvm_config_db #(int)::set(this, i_agt[i].get_name(), "port_id", i);
    //   uvm_config_db #(uvm_object_wrapper)::set(this, {i_agt[i].get_name(), ".", "sqr.reset_phase"}, "default_sequence", router_input_port_reset_sequence::get_type());
    //   uvm_config_db #(uvm_object_wrapper)::set(this, {i_agt[i].get_name(), ".", "sqr.main_phase"}, "default_sequence", packet_sequence::get_type());
    // end
    //
    // ToDo
    i_agt = input_agent::type_id::create("i_agt", this);
    uvm_config_db #(uvm_object_wrapper)::set(this, "i_agt.sqr.reset_phase", "default_sequence", router_input_port_reset_sequence::get_type());
    uvm_config_db #(uvm_object_wrapper)::set(this, "i_agt.sqr.main_phase", "default_sequence", packet_sequence::get_type());

    
    // Lab 4 - Task 7, Step 3
    //
    // Construct the scoreboard and the output_agent objects with factory create() method.
    // And, for each output_agent object, also configure its port_id field to a designated port.
    //
    // sb = scoreboard::type_id::create("sb", this);
    // foreach (o_agt[i]) begin
    //   o_agt[i] = output_agent::type_id::create($sformatf("o_agt[%0d]", i), this);
    //   uvm_config_db #(int)::set(this, o_agt[i].get_name(), "port_id", i);
    // end
    //
    // ToDo





  endfunction: build_phase

  virtual function void connect_phase(uvm_phase phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    // Lab 4 - Task 7, Step 4
    //
    // Connect the scoreboard's before and after TLM exports to each agent's TLM analysis port.
    //
    // foreach (i_agt[i]) begin
    //   i_agt[i].analysis_port.connect(sb.before_export);
    // end
    // foreach (o_agt[i]) begin
    //   o_agt[i].analysis_port.connect(sb.after_export);
    // end
    //
    // ToDo






  endfunction: connect_phase

endclass: router_env
