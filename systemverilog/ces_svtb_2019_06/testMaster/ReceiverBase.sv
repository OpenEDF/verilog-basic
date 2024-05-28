class ReceiverBase;
  virtual router_io.TB router;	// interface signals
  string   name;		// unique identifier
  reg[3:0] da;			// output port to monitor
  reg[7:0] pkt2cmp_payload[$];	// actual payload array
  Packet   pkt2cmp;		// actual Packet object

  extern function new(string name = "ReceiverBase", virtual router_io.TB router);
  extern virtual task recv();
  extern virtual task get_payload();
endclass

function ReceiverBase::new(string name, virtual router_io.TB router);
  if (TRACE_ON) $display("[TRACE]%0d %s:%m", $time, name);
  this.name = name;
  this.router = router;
  pkt2cmp = new();
endfunction

task ReceiverBase::recv();
  static int pkt_cnt = 0;
  if (TRACE_ON) $display("[TRACE]%0d %s:%m", $time, name);
  get_payload();
  pkt2cmp.da = da;
  pkt2cmp.payload = pkt2cmp_payload;
  pkt2cmp.name = $psprintf("rcvdPkt[%0d]", pkt_cnt++);
endtask

task ReceiverBase::get_payload();
  if (TRACE_ON) $display("[TRACE]%0d %s:%m", $time, name);
  pkt2cmp_payload.delete();
  fork: frameo_wd_timer
    @(negedge router.cb.frameo_n[da]);
    begin
      repeat(1000) @(router.cb);
      $display("\n%m\n[ERROR]%0d Frame signal timed out!\n", $time);
      $finish;
    end
  join_any: frameo_wd_timer
  disable fork;
  while (!router.cb.frameo_n[da]) begin
    reg[7:0] datum;
    for (int i=0; i<8; i=i ) begin
      if (!router.cb.valido_n[da])
        datum[i++] = router.cb.dout[da];
      if (router.cb.frameo_n[da] && (i != 8)) begin
        $display("\n%m\n[ERROR]%0d Packet payload not byte aligned!\n", $time);
        $finish;
      end
      @(router.cb);
    end
    pkt2cmp_payload.push_back(datum);
  end
endtask
