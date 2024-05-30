class scoreboard extends uvm_scoreboard;
  typedef uvm_in_order_class_comparator #(packet) packet_cmp;
  packet_cmp comparator;

  uvm_analysis_export #(packet) before_export;
  uvm_analysis_export #(packet) after_export;

  `uvm_component_utils(scoreboard)

  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    comparator = packet_cmp::type_id::create("comparator", this);
    before_export = new("before_export", this);
    after_export  = new("after_export", this);
  endfunction: build_phase

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    this.before_export.connect(comparator.before_export);
    this.after_export.connect(comparator.after_export); 
  endfunction: connect_phase

  virtual function string convert2string();
    return $sformatf("Comparator Matches = %0d, Mismatches = %0d", comparator.m_matches, comparator.m_mismatches);
  endfunction: convert2string

  // The following are supplemental methods for detecting end of test and reporting results.
  // They will be implemented in the derived classes.
  virtual task wait_for_done(); endtask
  virtual function void set_timeout(realtime timeout); endfunction
  virtual function realtime get_timeout(); endfunction

endclass: scoreboard
