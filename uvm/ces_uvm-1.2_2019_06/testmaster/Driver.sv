`include "DriverBase.sv"
class Driver extends DriverBase;
  mailbox in_box;	// Generator mailbox
  mailbox out_box;	// Scoreboard mailbox
  semaphore sem[];	// output port arbitration

  extern function new(string name = "Driver", int port_id, semaphore sem[], mailbox in_box, out_box, virtual router_io.TB router);
  extern virtual task start();
endclass

function Driver::new(string name, int port_id, semaphore sem[], mailbox in_box, out_box, virtual router_io.TB router);
  super.new(name, router);
  if (TRACE_ON) $display("[TRACE]%0d %s:%m", $time, name);
  this.sa = port_id;
  this.sem = sem;
  this.in_box = in_box;
  this.out_box = out_box;
endfunction

task Driver::start();
  if (TRACE_ON) $display("[TRACE]%0d %s:%m", $time, name);
  fork
    forever begin
      in_box.get(pkt2send);
      if (pkt2send.sa != this.sa) continue;
      this.da = pkt2send.da;
      this.payload = pkt2send.payload;
      sem[this.da].get(1);
      send();
      out_box.put(pkt2send);
      sem[this.da].put(1);
    end
  join_none
endtask

// Do not uncomment!
// The following is the prototype of the DriverBase class:
//
// class DriverBase;
//   virtual router_io.TB router;	// interface signal
//   string    name;			// unique identifier
//   reg[3:0]  sa, da;			// source and destination addresses
//   reg[7:0]  payload[$];		// Packet payload
//   Packet    pkt2send;		// stimulus Packet object
//
//   extern function new(string name = "DriverBase", virtual router_io.TB router);
//   extern virtual task send();
//   extern virtual task send_addrs();
//   extern virtual task send_pad();
//   extern virtual task send_payload();
// endclass
