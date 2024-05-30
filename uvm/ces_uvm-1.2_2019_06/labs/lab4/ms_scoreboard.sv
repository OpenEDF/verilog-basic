class ms_scoreboard extends scoreboard;

  `uvm_analysis_imp_decl(_before)
  `uvm_analysis_imp_decl(_after)

  uvm_analysis_imp_before #(packet, ms_scoreboard) ms_before_export;
  uvm_analysis_imp_after  #(packet, ms_scoreboard) ms_after_export;
  packet_cmp comparator[16];
  int count = 0;
  realtime timeout = 10us;

  `uvm_component_utils(ms_scoreboard)

  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    ms_before_export = new("ms_before_export", this);
    ms_after_export  = new("ms_after_export", this);
    for (int i=0; i < 16; i++) begin
      comparator[i] = uvm_in_order_class_comparator #(packet)::type_id::create($sformatf("comparator_%0d", i), this);
    end
  endfunction: build_phase

  virtual function void connect_phase(uvm_phase phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    before_export.connect(ms_before_export);
    after_export.connect(ms_after_export);
  endfunction: connect_phase

  virtual function void write_before(packet pkt);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    comparator[pkt.da].before_export.write(pkt);
    count++;
  endfunction: write_before

  virtual function void write_after(packet pkt);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    comparator[pkt.da].after_export.write(pkt);
    count--;
  endfunction: write_after

  virtual task wait_for_done();
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    fork
      begin
        fork
          wait(count == 0);
          begin
            #timeout;
            `uvm_warning("TIMEOUT", $sformatf("Scoreboard has %0d unprocessed expected objects", count));
          end
        join_any
        disable fork;
      end
    join
  endtask: wait_for_done

  virtual function void set_timeout(realtime timeout);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    this.timeout=timeout;
  endfunction: set_timeout

  virtual function realtime get_timeout();
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    return (timeout);
  endfunction: get_timeout

  virtual function string convert2string();
    foreach (comparator[i]) begin
        convert2string = {convert2string, $sformatf("Comparator[%0d] Matches = %0d, Mismatches = %0d\n", i, comparator[i].m_matches, comparator[i].m_mismatches)} ;
    end
  endfunction: convert2string

endclass: ms_scoreboard
