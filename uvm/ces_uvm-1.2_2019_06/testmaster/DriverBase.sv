class DriverBase;
  virtual router_io.TB router;	// interface signal
  string    name;		// unique identifier
  reg[3:0]  sa, da;		// source and destination addresses
  reg[7:0]  payload[$];		// Packet payload
  Packet    pkt2send;		// stimulus Packet object

  extern function new(string name = "DriverBase", virtual router_io.TB router);
  extern virtual task send();
  extern virtual task send_addrs();
  extern virtual task send_pad();
  extern virtual task send_payload();
endclass

function DriverBase::new(string name, virtual router_io.TB router);
  if (TRACE_ON) $display("[TRACE]%0d %s:%m", $time, name);
  this.name   = name;
  this.router = router;
endfunction

task DriverBase::send();
  if (TRACE_ON) $display("[TRACE]%0d %s:%m", $time, name);
  send_addrs();
  send_pad();
  send_payload();
endtask

task DriverBase::send_addrs();
  if (TRACE_ON) $display("[TRACE]%0d %s:%m", $time, name);
  router.cb.frame_n[sa] <= 1'b0;
  for(int i=0; i<4; i++) begin
    router.cb.din[sa] <= da[i];
    @(router.cb);
  end
endtask

task DriverBase::send_pad();
  if (TRACE_ON) $display("[TRACE]%0d %s:%m", $time, name);
  router.cb.din[sa] <= 1'b1;
  router.cb.valid_n[sa] <= 1'b1;
  repeat(5) @(router.cb);
endtask

task DriverBase::send_payload();
  if (TRACE_ON) $display("[TRACE]%0d %s:%m", $time, name);
  foreach(payload[index]) begin
    for(int i=0; i<8; i++) begin
      router.cb.din[sa] <= payload[index][i];
      router.cb.valid_n[sa] <= 1'b0;
      router.cb.frame_n[sa] <= ((index == (payload.size() - 1)) && (i == 7));
      @(router.cb);
    end
  end
  router.cb.valid_n[sa] <= 1'b1;
endtask
