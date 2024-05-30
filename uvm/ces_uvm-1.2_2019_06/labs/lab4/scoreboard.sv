class scoreboard extends uvm_scoreboard;
 
  // To simplify lab time, an instance of the in-order comparator has been added to the class for you.
  // The typedef mechanism helps to reduce the potential of typing errors in the class when the comparator
  // is reference.
  //
  typedef uvm_in_order_class_comparator #(packet) packet_cmp;
  packet_cmp comparator;



  // Lab 4 - Task 6, Step 2
  //
  // Create two uvm_analysis_export, one called before_export and the other after_export.
  //
  // ToDo




  `uvm_component_utils(scoreboard)

  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    // Lab 4 - Task 6, Step 3
    //
    // Construct the comparator and the two pass-through analysis exports.
    //
    // comparator = packet_cmp::type_id::create("comparator", this);
    // before_export = new("before_export", this);
    // after_export  = new("after_export", this);
    //
    // ToDo





  endfunction: build_phase


  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    // Lab 4 - Task 6, Step 4
    //
    // Connect the two pass-through analysis exports to the comparator's exports.
    //
    // this.before_export.connect(comparator.before_export);
    // this.after_export.connect(comparator.after_export); 
    //
    // ToDo




  endfunction: connect_phase


  //
  // You should enable printing the comparison results.
  //
  virtual function string convert2string();
    return $sformatf("Comparator Matches = %0d, Mismatches = %0d", comparator.m_matches, comparator.m_mismatches);
  endfunction: convert2string

  // The following are supplemental methods for detecting end of test and reporting results.
  // They will be implemented in the derived classes.
  virtual task wait_for_done(); endtask
  virtual function void set_timeout(realtime timeout); endfunction
  virtual function realtime get_timeout(); endfunction

endclass: scoreboard
