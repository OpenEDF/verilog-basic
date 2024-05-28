`ifndef INC_RECEIVERBASE_SV
`define INC_RECEIVERBASE_SV
class ReceiverBase;
  virtual router_io.TB rtr_io;  // interface signals
  string   name;    // unique identifier
  bit[3:0] da;      // output port to monitor
  logic[7:0] pkt2cmp_payload[$];  // actual payload array
  Packet   pkt2cmp;    // actual Packet object

  extern function new(string name = "ReceiverBase", virtual router_io.TB rtr_io);
  extern virtual task recv();
  extern virtual task get_payload();
endclass

function ReceiverBase::new(string name, virtual router_io.TB rtr_io);
  if (TRACE_ON) $display("[TRACE]%t %s:%m", $realtime, name);
  this.name = name;
  this.rtr_io = rtr_io;
  this.pkt2cmp = new();
endfunction

task ReceiverBase::recv();
  static int pkt_cnt = 0;
  if (TRACE_ON) $display("[TRACE]%t %s:%m", $realtime, this.name);
  this.get_payload();
  this.pkt2cmp.da = da;
  this.pkt2cmp.payload = this.pkt2cmp_payload;
  this.pkt2cmp.name = $sformatf("rcvdPkt[%0d]", pkt_cnt++);
endtask

task ReceiverBase::get_payload();
  if (TRACE_ON) $display("[TRACE]%t %s:%m", $realtime, this.name);
  this.pkt2cmp_payload.delete();
  fork
  begin: wd_timer_fork
    fork: frameo_wd_timer
    //Do not use @(negedge rtr_io.cb.frameo_n[da]);
    //This may cause timing issues because of how the LRM defines it.
    begin
      wait(rtr_io.cb.frameo_n[da] != 0);
      @(rtr_io.cb iff(rtr_io.cb.frameo_n[da] == 0 ));
    end
      begin
        repeat(1000) @(rtr_io.cb);
        $display("\n%m\n[ERROR]%t Frame signal timed out!\n", $realtime);
        $finish;
      end
    join_any: frameo_wd_timer
    disable fork;
  end: wd_timer_fork
  join
  forever begin
    logic[7:0] datum;
    for (int i=0; i<8; i=i) begin
      if (!this.rtr_io.cb.valido_n[da])
        datum[i++] = this.rtr_io.cb.dout[da];
      if (this.rtr_io.cb.frameo_n[da])
        if (i == 8) begin
          this.pkt2cmp_payload.push_back(datum);
          return;
        end
        else begin
          $display("\n%m\n[ERROR]%t Packet payload not byte aligned!\n", $realtime);
          $finish;
        end
      @(this.rtr_io.cb);
    end
    this.pkt2cmp_payload.push_back(datum);
  end
endtask
`endif
