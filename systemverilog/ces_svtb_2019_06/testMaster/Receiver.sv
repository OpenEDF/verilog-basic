`include "ReceiverBase.sv"
class Receiver extends ReceiverBase;
  mailbox out_box;	// Scoreboard mailbox

  extern function new(string name = "Receiver", int port_id, mailbox out_box, virtual router_io.TB router);
  extern virtual task start();
endclass

function Receiver::new(string name, int port_id, mailbox out_box, virtual router_io.TB router);
  super.new(name, router);
  if (TRACE_ON) $display("[TRACE]%0d %s:%m", $time, name);
  this.da = port_id;
  this.out_box = out_box;
endfunction

task Receiver::start();
  if (TRACE_ON) $display("[TRACE]%0d %s:%m", $time, name);
  fork
    forever begin
      recv();
      begin
        Packet pkt = new pkt2cmp;
        out_box.put(pkt);
      end
    end
  join_none
endtask

// Do not uncomment!
//
// class ReceiverBase;
//   virtual router_io.TB router;	// interface signals
//   string   name;			// unique identifier
//   reg[3:0] da;			// output port to monitor
//   reg[7:0] pkt2cmp_payload[$];	// actual payload array
//   Packet   pkt2cmp;			// actual Packet object
//
//   extern function new(string name = "ReceiverBase", virtual router_io.TB router);
//   extern virtual task recv();
//   extern virtual task get_payload();
// endclass
