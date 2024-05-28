`ifndef INC_SCOREBOARD_SV
`define INC_SCOREBOARD_SV
class Scoreboard;
  string  name;            // unique identifier
  event   DONE;            // flag to indicate goal reached
  Packet  refPkt[$];       // reference Packet array
  Packet  pkt2send;        // Packet object from Drivers
  Packet  pkt2cmp;         // Packet object from Receivers
  pkt_mbox driver_mbox;    // mailbox for Packet objects from Drivers
  pkt_mbox receiver_mbox;  // mailbox for Packet objects from Receivers

  extern function new(string name = "Scoreboard", pkt_mbox driver_mbox = null, receiver_mbox = null);
  extern virtual task start();
  extern virtual function void check();
endclass: Scoreboard

function Scoreboard::new(string name, pkt_mbox driver_mbox, receiver_mbox);
  if (TRACE_ON) $display("[TRACE]%t %s:%m", $realtime, name);
  this.name = name;
  if (driver_mbox == null) driver_mbox = new();
  this.driver_mbox = driver_mbox;
  if (receiver_mbox == null) receiver_mbox = new();
  this.receiver_mbox = receiver_mbox;
endfunction: new

task Scoreboard::start();
  if (TRACE_ON) $display("[TRACE]%t %s:%m", $realtime, this.name);
  fork
    forever begin
      this.receiver_mbox.get(this.pkt2cmp);
      while (this.driver_mbox.num()) begin
        Packet pkt;
        this.driver_mbox.get(pkt);
        this.refPkt.push_back(pkt);
      end
      this.check();
    end
  join_none
endtask: start

function void Scoreboard::check();
  int    index[$];
  string message;
  static int  pkts_checked = 0;
  if (TRACE_ON) $display("[TRACE]%t %s:%m", $realtime, this.name);
  index = this.refPkt.find_first_index() with (item.da == this.pkt2cmp.da);
  if (index.size() <= 0) begin
    $display("\n%m\n[ERROR]%t %s not found in Reference Queue\n", $realtime, pkt2cmp.name);
    this.pkt2cmp.display("ERROR");
    $finish;
  end
  this.pkt2send = refPkt[index[0]];
  this.refPkt.delete(index[0]);
  if (!this.pkt2send.compare(this.pkt2cmp, message)) begin
    $display("\n%m\n[ERROR]%t Packet #%0d %s\n", $realtime, pkts_checked, message);
    this.pkt2send.display("ERROR");
    this.pkt2cmp.display("ERROR");
    $finish;
  end
  $display("[NOTE]%t Packet #%0d %s", $realtime, pkts_checked++, message);
  if (pkts_checked >= run_for_n_packets)
    ->this.DONE;
endfunction: check
`endif
