class driver extends uvm_driver #(packet);
  virtual router_io vif;           // DUT virtual interface
  int               port_id = -1;  // Driver's designated port

  `uvm_component_utils_begin(driver)
    `uvm_field_int(port_id, UVM_ALL_ON | UVM_DEC)
  `uvm_component_utils_end

  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    uvm_config_db#(int)::get(this, "", "port_id", port_id);
    uvm_config_db#(virtual router_io)::get(this, "", "vif", vif);
  endfunction: build_phase

  //
  // The UVM end_of_elaboration phase is designed for checking the
  // correctness of testbench structure and the configuration variables.
  //
  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    if (!(port_id inside {-1, [0:15]})) begin
      `uvm_fatal("CFGERR", $sformatf("port_id must be {-1, [0:15]}, not %0d!", port_id));
    end
    if (vif == null) begin
      `uvm_fatal("CFGERR", "Interface for Driver not set");
    end
  endfunction: end_of_elaboration_phase

  //
  // The UVM start_of_simulation phase is designed for displaying the testbench configuration
  // before any active verification operation starts.
  //
  virtual function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    `uvm_info("DRV_CFG", $sformatf("port_id is: %0d", port_id), UVM_MEDIUM);
  endfunction: start_of_simulation_phase

  virtual task run_phase(uvm_phase phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    forever begin
      seq_item_port.get_next_item(req);

      if (port_id inside { -1, req.sa }) begin
        send(req);
        `uvm_info("DRV_RUN", {"\n", req.sprint()}, UVM_MEDIUM);
      end

      seq_item_port.item_done();
    end
  endtask: run_phase

  //
  // In the interest of lab time, all device drivers have been done for you:
  //

  virtual task send(packet tr);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    send_address(tr);
    send_pad(tr);
    send_payload(tr);
  endtask: send

  virtual task send_address(packet tr);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    vif.drvClk.frame_n[tr.sa] <= 1'b0;
    for(int i=0; i<4; i++) begin
      vif.drvClk.din[tr.sa] <= tr.da[i];
      @(vif.drvClk);
    end
  endtask: send_address

  virtual task send_pad(packet tr);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    vif.drvClk.din[tr.sa] <= 1'b1;
    vif.drvClk.valid_n[tr.sa] <= 1'b1;
    repeat(5) @(vif.drvClk);
  endtask: send_pad

  virtual task send_payload(packet tr);
    logic [7:0] datum;
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    while(!vif.drvClk.busy_n[tr.sa]) @(vif.drvClk);
    foreach(tr.payload[index]) begin
      datum = tr.payload[index];
      for(int i=0; i<$size(tr.payload, 2); i++) begin
        vif.drvClk.din[tr.sa] <= datum[i];
        vif.drvClk.valid_n[tr.sa] <= 1'b0;
        vif.drvClk.frame_n[tr.sa] <= ((tr.payload.size()-1) == index) && (i==7);
        @(vif.drvClk);
      end
    end
    vif.drvClk.valid_n[tr.sa] <= 1'b1;
  endtask: send_payload

endclass: driver
