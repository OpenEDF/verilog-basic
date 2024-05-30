class test_base extends uvm_test;
  `uvm_component_utils(test_base)

  // For convenience, access to the command line processor is done for you
  uvm_cmdline_processor clp = uvm_cmdline_processor::get_inst();

  router_env env;
  virtual router_io    router_vif;
  virtual reset_io     reset_vif;

  // Lab 6 - The declaration of the host virtual interface is done for you.
  virtual host_io      host_vif;

  top_reset_sequencer  top_reset_sqr;


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

    uvm_config_db#(virtual router_io)::set(this, "env.i_agt[*]", "vif", router_vif);
    uvm_config_db#(virtual router_io)::set(this, "env.o_agt[*]", "vif", router_vif);
    uvm_config_db#(virtual reset_io)::set(this, "env.r_agt", "vif", reset_vif);

    top_reset_sqr = top_reset_sequencer::type_id::create("top_reset_sqr", this);

    // Lab 6 - Like all other interfaces, the program stored the interface in the uvm_resource_db.
    // The test is responsible for picking it up and configure the agent with the interface.
    uvm_resource_db#(virtual host_io)::read_by_type("host_vif", host_vif, this);
    uvm_config_db#(virtual host_io)::set(this, "env.h_agt", "vif", host_vif);

    uvm_config_db #(uvm_object_wrapper)::set(this, "env.*.sqr.reset_phase", "default_sequence", null);

    uvm_config_db #(uvm_object_wrapper)::set(this, "top_reset_sqr.reset_phase", "default_sequence", top_reset_sequence::get_type());

    // Lab 6 - Task 13, Step 2
    //
    // Set up the DPI hdl_path.
    //
    // uvm_config_db #(string)::set(this, "env", "hdl_path", "router_test_top.dut");
    //
    // ToDo
    uvm_config_db #(string)::set(this, "env", "hdl_path", "router_test_top.dut");


    set_type_override_by_type(scoreboard::get_type(),ms_scoreboard::get_type());
  endfunction: build_phase

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    foreach (env.i_agt[i]) begin
      top_reset_sqr.pkt_sqr.push_back(env.i_agt[i].sqr);
    end

    top_reset_sqr.r_sqr = env.r_agt.sqr;

    // Lab 6 - Task 4, Step 10
    //
    // Set the top reset sequencer's h_sqr handle to the host agent's sqr handle.
    //
    // top_reset_sqr.h_sqr = env.h_agt.sqr;
    //
    // ToDo
    top_reset_sqr.h_sqr = env.h_agt.sqr;

  endfunction: connect_phase

  virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    // Lab 6 - Task 19, Step 3
    //
    // Turn on functional coverage for regmodel
    //
    // env.regmodel.set_coverage(UVM_CVR_ALL);
    //
    // ToDo
    env.regmodel.set_coverage(UVM_CVR_ALL);


  endfunction: end_of_elaboration_phase

  virtual task shutdown_phase(uvm_phase phase);
    super.shutdown_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    phase.raise_objection(this);
    env.sb.wait_for_done();
    phase.drop_objection(this);
  endtask: shutdown_phase

  virtual function void report_phase(uvm_phase phase);
    super.report_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    `uvm_info("SB_REPORT", {"\n", env.sb.convert2string()}, UVM_MEDIUM);
  endfunction: report_phase

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


class test_host_bfm extends test_base;
  `uvm_component_utils(test_host_bfm)
  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    // Lab 6 - Task 6, Step 3
    //
    // Turn off all sequencer execution at the configure and main phase.
    // Then, only execute the host_bfm_sequence at the main_phase with the host sequencer.
    //
    // uvm_config_db #(uvm_object_wrapper)::set(this, "env.*.configure_phase", "default_sequence", null);
    // uvm_config_db #(uvm_object_wrapper)::set(this, "env.*.main_phase", "default_sequence", null);
    // uvm_config_db #(uvm_object_wrapper)::set(this, "env.h_agt.sqr.main_phase", "default_sequence", host_bfm_sequence::get_type());
    //
    // ToDo
    uvm_config_db #(uvm_object_wrapper)::set(this, "env.*.configure_phase", "default_sequence", null);
    uvm_config_db #(uvm_object_wrapper)::set(this, "env.*.main_phase", "default_sequence", null);
    uvm_config_db #(uvm_object_wrapper)::set(this, "env.h_agt.sqr.main_phase", "default_sequence", host_bfm_sequence::get_type());


  endfunction: build_phase
endclass: test_host_bfm

class test_host_ral extends test_base;
  `uvm_component_utils(test_host_ral)
  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    // Lab 6 - Task 13, Step 4 and 5
    //
    // Turn off all sequencer execution at the configure and main phase.
    // Execute the host_ral_test_sequence at the main_phase with the host sequencer.
    //
    // uvm_config_db #(uvm_object_wrapper)::set(this, "env.*.configure_phase", "default_sequence", null);
    // uvm_config_db #(uvm_object_wrapper)::set(this, "env.*.main_phase", "default_sequence", null);
    // uvm_config_db #(uvm_object_wrapper)::set(this, "env.h_agt.sqr.main_phase", "default_sequence", host_ral_test_sequence::get_type());
    //
    // ToDo
    uvm_config_db #(uvm_object_wrapper)::set(this, "env.*.configure_phase", "default_sequence", null);
    uvm_config_db #(uvm_object_wrapper)::set(this, "env.*.main_phase", "default_sequence", null);
    uvm_config_db #(uvm_object_wrapper)::set(this, "env.h_agt.sqr.main_phase", "default_sequence", host_ral_test_sequence::get_type());


  endfunction: build_phase
endclass: test_host_ral


// Lab 6 - Task 18, Step 3
//
// For the ral self test:
// turn off all sequencer execution.
// Explicitely execute the virtual reset sequence.
// Then explicitely execute the uvm_reg_bit_bash_seq.
//
// Uncomment the following class
//
// ToDo

class test_ral_selftest extends test_base;
  `uvm_component_utils(test_ral_selftest)
  string                 seq_name="uvm_reg_bit_bash_seq";
  uvm_reg_sequence       selftest_seq;
  top_reset_sequence     top_reset_seq;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    uvm_config_db #(uvm_object_wrapper)::set(this,"*","default_sequence",null);
  endfunction: build_phase

  virtual task run_phase(uvm_phase phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    phase.raise_objection(this, "Starting reset tests");
    top_reset_seq = top_reset_sequence::type_id::create("top_reset_seq", this);
    top_reset_seq.start(top_reset_sqr);
    clp.get_arg_value("+seq=", seq_name);
    $cast(selftest_seq, uvm_factory::get().create_object_by_name(seq_name));
    selftest_seq.model = env.regmodel;
    selftest_seq.start(env.h_agt.sqr);
    phase.drop_objection(this, "Done with register tests");
  endtask: run_phase
endclass: test_ral_selftest


