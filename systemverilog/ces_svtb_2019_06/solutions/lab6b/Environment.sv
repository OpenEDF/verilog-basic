class Environment;
  string name;
  rand int run_for_n_packets;  // number of packets to test
  virtual router_io.TB rtr_io;


  semaphore  sem[];    // prevent output port collision
  Driver     drvr[];  // driver objects
  Receiver   rcvr[];  // receiver objects
  Generator  gen[];    // generator objects
  Scoreboard sb;    // scoreboard object

  constraint valid {
    this.run_for_n_packets inside { [1500:2500] };
  }

  extern function new(string name = "Env", virtual router_io.TB rtr_io);
  extern virtual task run();
  extern virtual function void configure();
  extern virtual function void build();
  extern virtual task start();
  extern virtual task wait_for_end();
  extern virtual task reset();

endclass: Environment

function Environment::new(string name = "Env", virtual router_io.TB rtr_io);
  if (TRACE_ON) $display("[TRACE]%t %s:%m", $realtime, name);
  this.name = name;
  this.rtr_io = rtr_io;
endfunction: new

task Environment::run();
  if (TRACE_ON) $display("[TRACE]%t %s:%m", $realtime, this.name);
  this.build();
  this.reset();
  this.start();
  this.wait_for_end();
endtask: run

function void Environment::configure();
  if (TRACE_ON) $display("[TRACE]%t %s:%m", $realtime, this.name);
  this.randomize();
endfunction: configure
  
function void Environment::build();
  if (TRACE_ON) $display("[TRACE]%t %s:%m", $realtime, this.name);
  if(this.run_for_n_packets == 0) this.run_for_n_packets = 2000;
    this.sem = new[16];
    this.drvr = new[16];
    this.rcvr = new[16];
    this.gen = new[16];
    this.sb = new();
    foreach (this.sem[i])
      this.sem[i] = new(1);
    foreach (this.gen[i])
      this.gen[i] = new($sformatf("gen[%0d]", i), i);
    foreach (this.drvr[i])
      this.drvr[i] = new($sformatf("drvr[%0d]", i), i, this.sem, this.gen[i].out_box, this.sb.driver_mbox, this.rtr_io);
    foreach (this.rcvr[i])
      this.rcvr[i] = new($sformatf("rcvr[%0d]", i), i, this.sb.receiver_mbox, this.rtr_io);
endfunction: build

task Environment::reset();
  if (TRACE_ON) $display("[TRACE]%t %s:%m", $realtime, this.name);
  this.rtr_io.reset_n <= 1'b0;
  this.rtr_io.cb.frame_n <= '1;
  this.rtr_io.cb.valid_n <= '1;
  repeat(2) @this.rtr_io.cb;
  this.rtr_io.cb.reset_n <= 1'b1;
  repeat(15) @(this.rtr_io.cb);
endtask: reset

task Environment::start();
  if (TRACE_ON) $display("[TRACE]%t %s:%m", $realtime, this.name);
    this.sb.start();
    foreach(this.gen[i])
      this.gen[i].start();
    foreach(this.drvr[i])
      this.drvr[i].start();
    foreach(this.rcvr[i])
      this.rcvr[i].start();
endtask: start

task Environment::wait_for_end();
  if (TRACE_ON) $display("[TRACE]%t %s:%m", $realtime, this.name);
    wait(this.sb.DONE.triggered);
endtask: wait_for_end
