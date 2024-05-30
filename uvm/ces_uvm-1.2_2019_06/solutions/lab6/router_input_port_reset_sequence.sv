class router_input_port_reset_sequence extends uvm_sequence #(packet);
  virtual router_io vif;           // DUT virtual interface
  int               port_id = -1;  // Driver's designated port

  `uvm_object_utils_begin(router_input_port_reset_sequence)
    `uvm_field_int(port_id, UVM_DEFAULT | UVM_DEC)
  `uvm_component_utils_end

  function new(string name="router_input_port_reset_sequence");
    super.new(name);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    `ifndef UVM_VERSION_1_1
     set_automatic_phase_objection(1);
    `endif
  endfunction: new

  virtual task pre_start();
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    `ifdef UVM_VERSION_1_1
    if ((get_parent_sequence() == null) && (starting_phase != null)) begin
      starting_phase.raise_objection(this);
    end
    `endif

    uvm_config_db#(int)::get(get_sequencer(), "", "port_id", port_id);
    if (!(port_id inside {-1, [0:15]})) begin
      `uvm_fatal("CFGERR", $sformatf("port_id must be {-1, [0:15]}, not %0d!", port_id));
    end
    `uvm_info("DRV_RST_SEQ", $sformatf("Using port_id = %0d", port_id), UVM_MEDIUM);
    uvm_config_db#(virtual router_io)::get(get_sequencer(), "", "vif", vif);
    if (vif == null) begin
      `uvm_fatal("CFGERR", "Interface for the Driver Reset Sequence not set");
    end
  endtask: pre_start

  `ifdef UVM_VERSION_1_1
  virtual task post_start();
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    if ((get_parent_sequence() == null) && (starting_phase != null)) begin
      starting_phase.drop_objection(this);
    end
  endtask: post_start
  `endif

  virtual task body();
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    if (port_id == -1) begin
      vif.frame_n = '1;
      vif.valid_n = '1;
      vif.din = '0;
    end else begin
      vif.frame_n[port_id] = '1;
      vif.valid_n[port_id] = '1;
      vif.din[port_id] = '0;
    end
  endtask: body

endclass: router_input_port_reset_sequence
