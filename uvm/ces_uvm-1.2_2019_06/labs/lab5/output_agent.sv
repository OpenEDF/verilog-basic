class output_agent extends uvm_agent;
  // This output agent does not have sequencer and driver, but still require a monitor
  // and the associated port_id,virtual interface and analysis port.
  virtual router_io vif;           // DUT virtual interface
  int               port_id = -1;  // Agent's designated port
  oMonitor          mon;
  uvm_analysis_port #(packet) analysis_port;

  `uvm_component_utils_begin(output_agent)
    `uvm_field_int(port_id, UVM_DEFAULT | UVM_DEC)
  `uvm_component_utils_end

  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    mon  = oMonitor::type_id::create("mon", this);
    analysis_port = new("analysis_port", this);

    // The agent retrieves port_id and virtual interface.
    uvm_config_db#(int)::get(this, "", "port_id", port_id);
    uvm_config_db#(virtual router_io)::get(this, "", "vif", vif);

    uvm_config_db#(int)::set(this, "*", "port_id", port_id);
    uvm_config_db#(virtual router_io)::set(this, "*", "vif", vif);
  endfunction: build_phase

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    mon.analysis_port.connect(this.analysis_port);
  endfunction: connect_phase

  virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    if (!(port_id inside {-1, [0:15]})) begin
      `uvm_fatal("CFGERR", $sformatf("port_id must be {-1, [0:15]}, not %0d!", port_id));
    end
    if (vif == null) begin
      `uvm_fatal("CFGERR", "Interface for output agent not set");
    end
  endfunction: end_of_elaboration_phase

  virtual function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    `uvm_info("AGNTCFG", $sformatf("Using port_id of %0d", port_id), UVM_MEDIUM);
  endfunction: start_of_simulation_phase

endclass: output_agent
