class driver extends uvm_driver #(packet);
  // Lab 3 - Task 2, Step 2 and 3
  // Create the new fields as shown below.
  //
  // virtual router_io vif;           // DUT virtual interface
  // int               port_id = -1;  // Driver's designated port
  //
  // The intent of the port_id field is to designate the driver for driving a specific port.
  //
  // If port_id is set in the range of 0 through 15, the driver will only drive
  // the packet it gets from the sequencer through the DUT if the port_id matches the
  // packet's source address (sa) field.  If not, the packet is dropped.
  //
  // If port_id is -1 (the default), the driver will drive all packets it gets from
  // the sequencer through the DUT without checking the packet's source address.
  //
  // Example:  If port_id is 3 and req.sa is also 3,
  // (req is the packet handle that sequencer passed to the driver)
  // The driver will drive the packet through port 3 of DUT: vif.drvClk.din[req.sa];
  //
  // Example:  If port_id is 3 and req.sa is 7,
  // The driver will drop the packet.
  //
  // Example:  If port_id is -1 and req.sa is 7,
  // The driver will drive the packet through port 7 of DUT: vif.drvClk.din[req.sa];
  //
  // ToDo
  virtual router_io vif;           // DUT virtual interface
  int               port_id = -1;  // Driver's designated port


  // Lab 3 - Task 2, Step 4
  //
  // Embed the port_id field in the `uvm_component_utils macro.
  // Note: You will need to change the macro to `uvm_component_utils_begin
  //       with a corresponding `uvm_component_utils_end
  //
  // ToDo
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

    // Lab 3 - Task 2, Step 5
    //
    // Retrieve the virtual interface from config_db.
    //
    // uvm_config_db#(virtual router_io)::get(this, "", "vif", vif);
    //
    // ToDo
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

    // Lab 3 - Task 2, Step 6
    //
    // Check that port_id and virtual interface are valid
    //
    // if (!(port_id inside {-1, [0:15]})) begin
    //   `uvm_fatal("CFGERR", $sformatf("port_id must be {-1, [0:15]}, not %0d!", port_id));
    // end
    // if (vif == null) begin
    //   `uvm_fatal("CFGERR", "Interface for Driver not set");
    // end
    //
    // ToDo
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
  // For the sake of lab time, the start_of_simulation method is done for you.
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

      // Lab 3 - Task 2, Step 7
      //
      // Check port_id to see if the driver should accept or drop the packet.
      // If port_id is -1, or if port_id matches req object's sa field,
      // call send() method to drive the content of the req object through the DUT.
      // Otherwise, drop the req object without processing.  Like the following:
      //
      // if (port_id inside { -1, req.sa }) begin
      //   send(req);
      //   `uvm_info("DRV_RUN", {"\n", req.sprint()}, UVM_MEDIUM);
      // end
      //
      // ToDo
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
