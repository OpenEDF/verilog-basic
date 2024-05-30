class Generator;
  string  name;		// unique identifier
  Packet  pkt2send;	// stimulus Packet object
  mailbox out_box[];	// mailbox to Drivers

  extern function new(string name = "Generator");
  extern virtual task gen();
  extern virtual task start();
endclass

function Generator::new(string name);
  if (TRACE_ON) $display("[TRACE]%0d %s:%m", $time, name);
  this.name = name;
  this.pkt2send = new();
  this.out_box = new[16];
  foreach(this.out_box[i])
    this.out_box[i] = new();
endfunction

task Generator::gen();
  static int pkts_generated = 0;
  if (TRACE_ON) $display("[TRACE]%0d %s:%m", $time, name);
  pkt2send.name = $psprintf("Packet[%0d]", pkts_generated++);
  if (!pkt2send.randomize()) begin
    $display("\n%m\n[ERROR]%0d Randomization Failed!\n", $time);
    $finish;
  end
endtask

task Generator::start();
  if (TRACE_ON) $display("[TRACE]%0d %s:%m", $time, name);
  fork
    for (int i=0; i<run_for_n_packets || run_for_n_packets <= 0; i++) begin
      gen();
      begin
        Packet pkt = new pkt2send;
        out_box[pkt.sa].put(pkt);
      end
    end
  join_none
endtask
