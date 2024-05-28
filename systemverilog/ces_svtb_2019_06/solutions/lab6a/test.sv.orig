program automatic test(router_io.TB rtr_io);
  `include "Packet.sv"
  int run_for_n_packets;      // number of packets to test
  //Lab 5 - Task 10, Step 2
  //
  //Delete all global variables EXCEPT run_for_n_packets

  //ToDo
  //Lab 5 - Task 10, Step 3
  //
  //Create an int TRACE_ON and initialize to 0 - set to 1 for debugging

  //ToDo
  int TRACE_ON = 0;

  //Lab 5 - Task 10, Step 4
  //
  //Add include statements for all header and new class files
  //(router_test.h, Driver.sv, Receiver.sv, Generator.sv, Scoreboard.sv)

  //ToDo
  `include "router_test.h"
  `include "Driver.sv"
  `include "Receiver.sv"
  `include "Generator.sv"
  `include "Scoreboard.sv"

  //Lab 5 - Task 10, Step 5
  //
  //Add the following global variables
  //semaphore sem[];                    // prevent output port collision
  //Driver drvr[];                      // driver objects
  //Receiver rcvr[];                    // receiver objects
  //Generator gen[];                    // generator objects
  //Scoreboard sb;                      // scoreboard object

  //ToDo
  semaphore sem[];
  Driver drvr[];
  Receiver rcvr[];                      // receiver
  Generator gen[];                      // generator
  Scoreboard sb;                        // scoreboard

  initial begin
    //Lab 5 - Task 10, Step 6
    //
    //Delete all content of initial block EXCEPT
    //run_for_n_packets = 2000;

    //ToDo

    run_for_n_packets = 2000;
    //Lab 5 - Task 10, Step 7
    //
    //Construct all components
    //Make sure the mailboxes are connected correctly:
    //Each Generators to corresponding Driver (gen[i].out_box);
    //all Drivers to one Scoreboard mailbox (sb.driver_mbox);
    //all Receivers to one Scoreboard mailbox (sb.receiver_mbox)

    //ToDo
    sem  = new[16];
    drvr = new[16];
    rcvr = new[16];
    gen = new[16];
    sb  = new("Scoreboard");

    foreach (sem[i]) sem[i] = new(1);
    foreach (gen[i]) gen[i] = new($sformatf("gen[%0d]", i), i);
    foreach (drvr[i])
      drvr[i] = new($sformatf("drvr[%0d]", i), i, sem, gen[i].out_box, sb.driver_mbox,rtr_io);
    foreach (rcvr[i])
      rcvr[i] = new($sformatf("rcvr[%0d]", i), i, sb.receiver_mbox, rtr_io);
    //Lab 5 - Task 10, Step 8
    //
    //Call reset() to reset the DUT

    //ToDo
    reset();

    //Lab 5 - Task 10, Step 9
    //
    //Start all transactors (generators, sb, drivers and receivers)

    //ToDo
    sb.start();
    foreach (gen[i]) gen[i].start();
    foreach (drvr[i]) drvr[i].start();
    foreach (rcvr[i]) rcvr[i].start();

    //Lab 5 - Task 10, Step 10
    //
    //Wait for the DONE event flag in sb to be triggered

    //ToDo
    wait(sb.DONE.triggered);

  end
  
  task reset();
    rtr_io.reset_n = 1'b0;
    rtr_io.cb.frame_n <= '1;
    rtr_io.cb.valid_n <= '1;
    repeat(2) @rtr_io.cb;
    rtr_io.cb.reset_n <= 1'b1;
    repeat(15) @(rtr_io.cb);
  endtask: reset

  //Lab 5 - Task 11, Step 1
  //
  //The following subroutines should be deleted from test.sv.
  // gen()
  // send()
  // send_addr()
  // send_pad()
  // send_payload()
  // recv()
  // get_payload()
  // check()
  //(Make sure reset() is NOT deleted)

  //ToDo


endprogram: test
