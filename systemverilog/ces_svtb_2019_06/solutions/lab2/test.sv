program automatic test(router_io.TB rtr_io);
  //Lab 2 - Task 2, Step 2
  //
  //Declare the program global variables sa, da and payload

  //ToDo
  bit[3:0] sa;
  bit[3:0] da;
  logic[7:0] payload[$];
  int run_for_n_packets;

  initial begin
    reset();
    //Lab 2 - Task 6, Step 1
    //
    //Send 21 packets through the router
    //use a global variable run_for_n_packets

    //ToDo Caution!! Do only in Task 6
    run_for_n_packets = 21;
    repeat(run_for_n_packets) begin

      //Lab 2 - Task 3, Step 1
      //
      //call the gen() task.

      //ToDo
      gen();
 
      //Lab 2 - Task 4, Step 1
      //
      //call the send() task.

      //ToDo
      send();
 
    end
    //Lab 2 - Task 4, Step 2
    //
    //Advance simulation by 10 clocks
    //This will allow data coming out to be observed

    //ToDo
    repeat(10) @rtr_io.cb;
    
  end
  
  task reset();
    rtr_io.reset_n = 1'b0;
    rtr_io.cb.frame_n <= '1;
    rtr_io.cb.valid_n <= '1;
    repeat(2) @rtr_io.cb;
    rtr_io.cb.reset_n <= 1'b1;
    repeat(15) @rtr_io.cb;
  endtask: reset

  //Lab 2 - Task 3, Step 2
  //
  //Define the gen() task

  //ToDo
  task gen();
  
    //Lab 2 - Task 3, Step 3a
    //
    //In gen() task set sa to 3, da to 7

    //ToDo
    sa = 3;
    da = 7;

    //Lab 2 - Task 3, Step 3b
    //
    //In gen() fill payload queue with 2 to 4 random bytes

    //ToDo
    payload.delete(); //clear previous data
    repeat($urandom_range(4,2))
      payload.push_back($urandom);
    endtask: gen

  //Lab 2 - Task 4, Step 3
  //
  //Define the send() task

  //ToDo
  task send();
  
    //Lab 2 - Task 4, Step 4
    //
    //Call send_addrs(), send_pad(), send_payload() in that order

    //ToDo
    send_addrs();
    send_pad();
    send_payload();

  endtask: send
  //Lab 2 - Task 4, Step 5
  //
  //Define send_addrs() task to drive 4 bits of addrs into router

  //ToDo
  task send_addrs();
  
    //Lab 2 - Task 4, Step 6
    //
    //Drive frame_n signal of port 'sa' per specification
    //Drive din signal of port 'sa' with destination address(LSB first)
    //Use a loop to drive din one bit per clock for four cycles

    //ToDo
    rtr_io.cb.frame_n[sa] <= 1'b0; //start of packet
    for(int i = 0; i < 4; i++) begin
      rtr_io.cb.din[sa] <= da[i]; //i'th bit of destination address
      @rtr_io.cb;
    end

  endtask: send_addrs
  //Lab 2 - Task 4, Step 7
  //
  //Define send_pad() task to drive 5 padding bits into router

  //ToDo
  task send_pad();
  
    //Lab 2 - Task 4, Step 8
    //
    //Drive frame_n, valid_n, din signals of port 'sa' per specification

    //ToDo
    rtr_io.cb.frame_n[sa] <= 1'b0;
    rtr_io.cb.valid_n[sa] <= 1'b1;
    rtr_io.cb.din[sa] <= 1'b1;
    repeat(5) @rtr_io.cb;

  endtask: send_pad
  //Lab 2 - Task 4, Step 9
  //
  //Define send_payload() task to drive payload(data) into port 'sa' of router

  //ToDo
  task send_payload();
  
    //Lab 2 - Task 4, Step 10
    //
    //Write a loop to execute payload.size() number of times
    //In the loop, each 8-bit datum of payload[$] is transmitted 1 bit/clock
    //Remember to drive the valid bit, valid_n, of port 'sa' as per spec
    //Make sure on last valid bit of payload[$], frame_n of port 'sa' is 1'b1 as per spec

    //ToDo
    foreach(payload[index]) begin
      for(int i = 0; i < 8; i++) begin
        rtr_io.cb.din[sa] <= payload[index][i];
        rtr_io.cb.valid_n[sa] <= 1'b0;
        rtr_io.cb.frame_n[sa] <= ((i==7) && (index == (payload.size() - 1 )));
        @rtr_io.cb;
      end
    end
    rtr_io.cb.valid_n[sa] <= 1'b1;
  endtask: send_payload

endprogram: test
