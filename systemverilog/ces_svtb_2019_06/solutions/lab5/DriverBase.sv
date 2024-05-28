`ifndef INC_DRIVERBASE_SV
`define INC_DRIVERBASE_SV
class DriverBase;
  virtual router_io.TB rtr_io;  // interface signal
  string    name;               // unique identifier
  bit[3:0]  sa, da;             // source and destination addresses
  logic[7:0]  payload[$];       // Packet payload
  Packet    pkt2send;           // stimulus Packet object

  extern function new(string name = "DriverBase", virtual router_io.TB rtr_io);
  extern virtual task send();
  extern virtual task send_addrs();
  extern virtual task send_pad();
  extern virtual task send_payload();
endclass

function DriverBase::new(string name, virtual router_io.TB rtr_io);
  if (TRACE_ON) $display("[TRACE]%t %s:%m", $realtime, name);
  this.name   = name;
  this.rtr_io = rtr_io;
endfunction

task DriverBase::send();
  if (TRACE_ON) $display("[TRACE]%t %s:%m", $realtime, this.name);
  this.send_addrs();
  this.send_pad();
  this.send_payload();
endtask

task DriverBase::send_addrs();
  if (TRACE_ON) $display("[TRACE]%t %s:%m", $realtime, this.name);
  this.rtr_io.cb.frame_n[this.sa] <= 1'b0;
  for(int i=0; i<4; i++) begin
    this.rtr_io.cb.din[this.sa] <= this.da[i];
    @(this.rtr_io.cb);
  end
endtask

task DriverBase::send_pad();
  if (TRACE_ON) $display("[TRACE]%t %s:%m", $realtime, this.name);
  this.rtr_io.cb.din[this.sa] <= 1'b1;
  this.rtr_io.cb.valid_n[this.sa] <= 1'b1;
  repeat(5) @(this.rtr_io.cb);
endtask

task DriverBase::send_payload();
  if (TRACE_ON) $display("[TRACE]%t %s:%m", $realtime, this.name);
  foreach(this.payload[index]) begin
    for(int i=0; i<8; i++) begin
      this.rtr_io.cb.din[this.sa] <= this.payload[index][i];
      this.rtr_io.cb.valid_n[this.sa] <= 1'b0;
      this.rtr_io.cb.frame_n[this.sa] <= ((index == (this.payload.size() - 1)) && (i == 7));
      @(this.rtr_io.cb);
    end
  end
  this.rtr_io.cb.valid_n[this.sa] <= 1'b1;
endtask
`endif
