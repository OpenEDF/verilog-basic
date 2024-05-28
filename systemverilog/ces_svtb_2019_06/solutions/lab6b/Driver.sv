`ifndef INC_DRIVER_DV
`define INC_DRIVER_DV
`include "DriverBase.sv"
class Driver extends DriverBase;
  pkt_mbox in_box;  // Generator mailbox
  pkt_mbox out_box;  // Scoreboard mailbox
  semaphore sem[];  // output port arbitration

  extern function new(string name = "Driver", int port_id, semaphore sem[], pkt_mbox in_box, out_box, virtual router_io.TB rtr_io);
  extern virtual task start();
endclass

function Driver::new(string name, int port_id, semaphore sem[], pkt_mbox in_box, out_box, virtual router_io.TB rtr_io);
  //Lab 5 - Task 3, Step 1
  //
  //Call super.new() with name and interface arguments
  //ToDo
  super.new(name, rtr_io);

  //Lab 5 - Task 3, Step 2
  //
  //Add a tracing statement
  //ToDo
  if (TRACE_ON) $display("[TRACE]%t %s:%m", $realtime, this.name);

  //Lab 5 - Task 3, Step 3
  //
  //Assign port_id argument to class property sa
  //ToDo
  this.sa = port_id;

  //Lab 5 - Task 3, Step 4
  //
  //Assign the correct arguments to sem, in_box and out_box class properties
  //ToDo
  this.sem = sem;
  this.in_box = in_box;
  this.out_box = out_box;

endfunction: new

task Driver::start();
  //Lab 5 - Task 4, Step 1
  //
  //In the existing start() method body, add a trace statement
  //ToDo
  if (TRACE_ON) $display("[TRACE]%t %s:%m", $realtime, this.name);

  //Lab 5 - Task 4, Step 2
  //
  //After the trace statement, create a non-blocking fork-join block.
  //ToDo
  fork

    //Lab 5 - Task 4, Step 3
    //
    //Inside the fork-join construct, create a single infinite loop
    //ToDo
    forever begin

      //Lab 5 - Task 4, Step 4a
      //
      //Retrieve a Packet object (pkt2send) from in_box
      //ToDo
      this.in_box.get(this.pkt2send);

      //Lab 5 - Task 4, Step 4b
      //
      //If the sa property in the retrieved Packet object does not match this.sa,
      //continue on to the next iteration of the loop
      //ToDo
      if (this.pkt2send.sa != this.sa) continue;

      //Lab 5 - Task 4, Step 4c
      //
      //If the retrieved Packet sa does match this.sa, update the da and
      //payload class properties with the content of pkt2send
      //ToDo
      this.da = this.pkt2send.da;
      this.payload = this.pkt2send.payload;

      //Lab 5 - Task 4, Step 4d
      //
      //Use the semaphore sem[] array to arbitrate for access to the
      //output port specified by da
      //ToDo
      this.sem[this.da].get(1);

      //Lab 5 - Task 4, Step 4e
      //
      //Once the arbitration is successful, call send() to drive the
      //packet through the DUT
      //ToDo
      this.send();

      //Lab 5 - Task 4, Step 4f
      //
      //When send() completes, deposit Packet object into out_box
      //ToDo
      this.out_box.put(this.pkt2send);

      //Lab 5 - Task 4, Step 4a
      //
      //Put the semaphore key back into its bin in the final step of the loop
      //ToDo
      this.sem[this.da].put(1);

    end
  join_none

endtask: start
`endif

// Do not uncomment!
// The following is the prototype of the DriverBase class:
//
// class DriverBase;
//   virtual router_io.TB rtr_io;  // interface signal
//   string    name;      // unique identifier
//   bit[3:0]  sa, da;      // source and destination addresses
//   logic[7:0]  payload[$];    // Packet payload
//   Packet    pkt2send;    // stimulus Packet object
//
//   extern function new(string name = "DriverBase", virtual router_io.TB rtr_io);
//   extern virtual task send();
//   extern virtual task send_addrs();
//   extern virtual task send_pad();
//   extern virtual task send_payload();
// endclass
