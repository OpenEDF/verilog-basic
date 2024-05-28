class Scoreboard;
  string   name;			// unique identifier
  event    DONE;			// flag to indicate goal reached
  Packet   refPkt[$];		// reference Packet array
  Packet   pkt2send;		// Packet object from Drivers
  Packet   pkt2cmp;		// Packet object from Receivers
  mailbox  driver_mbox;		// mailbox for Packet objects from Drivers
  mailbox  receiver_mbox;	// mailbox fro Packet objects from Receivers
  bit[3:0] sa, da;		// functional coverage properties

  covergroup router_cov;
    coverpoint sa;
    coverpoint da;
    cross sa, da;
  endgroup

  extern function new(string name = "Scoreboard", mailbox driver_mbox = null, receiver_mbox = null);
  extern virtual task start();
  extern virtual task check();
endclass

function Scoreboard::new(string name, mailbox driver_mbox, receiver_mbox);
  if (TRACE_ON) $display("[TRACE]%0d %s:%m", $time, name);
  this.name = name;
  if (driver_mbox == null) driver_mbox = new();
  this.driver_mbox = driver_mbox;
  if (receiver_mbox == null) receiver_mbox = new();
  this.receiver_mbox = receiver_mbox;
  router_cov = new();
endfunction

task Scoreboard::start();
  if (TRACE_ON) $display("[TRACE]%0d %s:%m", $time, name);
  fork
    while (1) begin
      receiver_mbox.get(pkt2cmp);
      while (driver_mbox.num()) begin
        Packet pkt;
        driver_mbox.get(pkt);
        refPkt.push_back(pkt);
      end
      check();
    end
  join_none
endtask

task Scoreboard::check();
  int    index[$];
  string message;
  static int  pkts_checked = 0;
  real   coverage_result;

  if (TRACE_ON) $display("[TRACE]%0d %s:%m", $time, name);
  index = refPkt.find_first_index() with (item.da == pkt2cmp.da);
  if (index.size() <= 0) begin
    $display("\n%m\n[ERROR]%0d %s not found in Reference Queue\n", $time, pkt2cmp.name);
    pkt2cmp.display("ERROR");
    $finish;
  end
  pkt2send = refPkt[index[0]];
  refPkt.delete(index[0]);
  if (!pkt2send.compare(pkt2cmp, message)) begin
    $display("\n%m\n[ERROR]%0d Packet #%0d %s\n", $time, pkts_checked, message);
    pkt2send.display("ERROR");
    pkt2cmp.display("ERROR");
    $finish;
  end
  this.sa = pkt2send.sa;
  this.da = pkt2send.da;
  router_cov.sample();
  coverage_result = $get_coverage();
  $display("[NOTE]%0d Packet #%0d %s coverage = %0d", $time, pkts_checked++, message, coverage_result);
  if ((pkts_checked >= run_for_n_packets) || (coverage_result == 100))
    ->DONE;
endtask
