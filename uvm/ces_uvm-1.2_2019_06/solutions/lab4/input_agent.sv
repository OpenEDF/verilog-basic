class input_agent extends uvm_agent;
  `uvm_component_utils(input_agent)

  typedef uvm_sequencer #(packet) packet_sequencer;

  // The input agent already contains the following properties from the previous lab:
  virtual router_io vif;
  packet_sequencer  sqr;
  driver            drv;
  int               port_id = -1;


  // Lab 4 - Task 3, Step 2
  // Add an instance of iMonitor.  Call it mon.
  // And an instance of uvm_analysis_port #(packet).  Call it analysis_port.
  //
  // This analysis port is just a pass-through port for the iMonitor's analysis port
  // for the convinience of connection at the environment level.
  //
  // ToDo
  iMonitor mon;
  uvm_analysis_port #(packet) analysis_port;


  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    // Lab 4 - Task 3, Step 3
    //
    // Change the following construction statements to obey the requirements
    // of the is_active flag.
    //
    // Check the state of the is_active flag.  If the is_active flag is UVM_ACTIVE,
    // use the existing statements to construct the sequencer and driver objects.
    //
    // ToDo
    if (is_active == UVM_ACTIVE) begin
      sqr = packet_sequencer::type_id::create("sqr", this);
      drv = driver::type_id::create("drv", this);
    end


    // Lab 4 - Task 3, Step 4
    //
    // Regardless of the state of the is_active flag, construct the iMonitor (mon) object.
    //
    // ToDo
    mon = iMonitor::type_id::create("mon", this);


    // Lab 4 - Task 3, Step 5
    //
    // Construct the analysis_port object
    //
    // ToDo
    analysis_port = new("analysis_port", this);


    uvm_config_db#(int)::get(this, "", "port_id", port_id);
    uvm_config_db#(virtual router_io)::get(this, "", "vif", vif);

    uvm_config_db#(int)::set(this, "*", "port_id", port_id);
    uvm_config_db#(virtual router_io)::set(this, "*", "vif", vif);

  endfunction: build_phase

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    // Lab 4 - Task 3, Step 6
    // Change the following connect statement to obey the requirement of the is_active flag.
    //
    // If the is_active flag is UVM_ACTIVE, connect drv's seq_item_port to sqr's seq_item_export
    //
    // ToDo
    if (is_active == UVM_ACTIVE) begin
      drv.seq_item_port.connect(sqr.seq_item_export);
    end


    // Lab 4 - Task 3, Step 7
    // Connect the monitor's analysis_port to the agent's pass-through analysis_port
    //
    // mon.analysis_port.connect(this.analysis_port);
    //
    // ToDo
    mon.analysis_port.connect(this.analysis_port);


  endfunction: connect_phase

  virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    if (!(port_id inside {-1, [0:15]})) begin
      `uvm_fatal("CFGERR", $sformatf("port_id must be {-1, [0:15]}, not %0d!", port_id));
    end
    if (vif == null) begin
      `uvm_fatal("CFGERR", "Interface for input agent not set");
    end
  endfunction: end_of_elaboration_phase

endclass: input_agent
