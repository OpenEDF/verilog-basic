class router_env extends uvm_env;
  `uvm_component_utils(router_env)

  reset_agent   r_agt;
  input_agent   i_agt[16];
  output_agent  o_agt[16];
  scoreboard    sb;

  // Lab 6 - Task 2, Step 2
  //
  // Declare a host_agent handle called h_agt
  //
  // host_agent  h_agt;
  //
  // ToDo



  // Lab 6 - Task 12, Step 2
  //
  // Declare a ral_block_host_regmodel handle called regmodel
  // Declare a reg_adapter handle called adapter
  //
  // ral_block_host_regmodel regmodel;
  // reg_adapter adapter;
  //
  // ToDo




  // Lab 6 - Task 17, Steps 2 & 3
  //
  // Explicit prediction of the DUT register content should also be implemented.
  //
  // use typedef to create a predictor called hreg_predictor then declared a
  // handle called hreg_predict.
  //
  // typedef uvm_reg_predictor #(host_data) hreg_predictor;
  // hreg_predictor hreg_predict;
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

    foreach (i_agt[i]) begin
      i_agt[i] = input_agent::type_id::create($sformatf("i_agt[%0d]", i), this);
      uvm_config_db #(int)::set(this, i_agt[i].get_name(), "port_id", i);
      uvm_config_db #(uvm_object_wrapper)::set(this, {i_agt[i].get_name(), ".", "sqr.reset_phase"}, "default_sequence", router_input_port_reset_sequence::get_type());
      uvm_config_db #(uvm_object_wrapper)::set(this, {i_agt[i].get_name(), ".", "sqr.main_phase"}, "default_sequence", packet_sequence::get_type());
    end

    sb = scoreboard::type_id::create("sb", this);

    foreach (o_agt[i]) begin
      o_agt[i] = output_agent::type_id::create($sformatf("o_agt[%0d]", i), this);
      uvm_config_db #(int)::set(this, o_agt[i].get_name(), "port_id", i);
    end

    // Lab 6 - Task 2, Step 3
    //
    // Construct the h_agt object
    //
    // h_agt = host_agent::type_id::create("h_agt", this);
    //
    // ToDo




    // Lab 6 - Task 12, Step 3
    //
    // Construct the adapter object
    //
    // adapter = reg_adapter::type_id::create("adapter", this);
    //
    // ToDo



    // Lab 6 - Task 12, Step 4, 5 & 6
    //
    // Try to retrieve regmodel from configuration data base.  If not found,
    // construct and set up the regmodel. In all cases, setup the h_agt to use the regmodel.
    //
    // uvm_config_db #(ral_block_host_regmodel)::get(this, "", "regmodel", regmodel);
    //
    // if (regmodel == null) begin
    //   string hdl_path;
    //   `uvm_info("HOST_CFG", "Self constructing regmodel", UVM_MEDIUM);
    //   if (!uvm_config_db #(string)::get(this, "", "hdl_path", hdl_path)) begin
    //     `uvm_warning("HOST_CFG", "HDL path for DPI backdoor not set!");
    //   end
    //   regmodel = ral_block_host_regmodel::type_id::create("regmodel", this);
    //   regmodel.build();
    //   regmodel.lock_model();
    //   regmodel.set_hdl_path_root(hdl_path);
    // end
    //
    // uvm_config_db #(ral_block_host_regmodel)::set(this, h_agt.get_name(), "regmodel", regmodel);
    //
    // ToDo















    // Lab 6 - Task 15, Step 5
    //
    // Set the host agent to execute the ral_port_unlock_sequence at the configure phase:
    //
    // uvm_config_db #(uvm_object_wrapper)::set(this, {h_agt.get_name(), ".", "sqr.configure_phase"}, "default_sequence", ral_port_unlock_sequence::get_type());
    //
    // ToDo



    // Lab 6 - Task 17, Step 4
    //
    // Construct the predictor object.
    //
    // hreg_predict = hreg_predictor::type_id::create("h_reg_predict", this);
    //
    // ToDo



  endfunction: build_phase

  virtual function void connect_phase(uvm_phase phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    foreach (i_agt[i]) begin
      i_agt[i].analysis_port.connect(sb.before_export);
    end

    foreach (o_agt[i]) begin
      o_agt[i].analysis_port.connect(sb.after_export);
    end

    // Lab 6 - Task 12, Step 7
    //
    // Set up the regmodel's address map to apply the proper adaptor to the
    // corresponding sequencer.
    //
    // regmodel.default_map.set_sequencer(h_agt.sqr, adapter);
    //
    // ToDo



    // Lab 6 - Task 17, Step 5
    //
    // Implement explicit RAL mirror update.
    //
    // First, turn off the auto predict.
    // Then, set the predictor's map to the regmodel's map.
    // And, set the predictor's adapter to the adapter being used by the sequencer.
    // Finally,. connect the host_agent's analysis por to the predictor's bus_in
    // analysis port.
    //
    // regmodel.default_map.set_auto_predict(0);
    // hreg_predict.map = regmodel.get_default_map();
    // hreg_predict.adapter = adapter;
    // h_agt.analysis_port.connect(hreg_predict.bus_in);
    //
    // ToDo






  endfunction: connect_phase

endclass: router_env
