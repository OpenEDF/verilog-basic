program automatic test(router_io.TB rtr_io);
  int run_for_n_packets;      // number of packets to test
  bit[3:0] sa;                        // source address
  bit[3:0] da;                        // destination address
  logic[7:0] payload[$];              // expected packet data array
  //Lab 3 - Task 2, Step 2
  //
  //Add a global declaration for queue used to store sampled data

  //ToDo
  logic[7:0] pkt2cmp_payload[$];      // actual packet data array


  initial begin

    //Lab 3 - Task 6, Step 2
    //
    //Send 2000 packets

    //ToDo Caution!! Do only in Task 6
    run_for_n_packets = 2000;
    reset();
    repeat(run_for_n_packets) begin

      gen();

      //Lab 3 - Task 2, Step 3
      //
      //Execute receive routine recv() concurrently with send()
      //followed by self-checking routine check()

      //ToDo
      fork
        send();
        recv();
      join

      check();

    end
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

  task gen();

    //Lab 3 - Task 6, Step 1
    //
    //Randomly generate sa and da

    //ToDo Caution!! Do only in Task 6
    sa = $urandom;
    da = $urandom;
    payload.delete(); //clear previous data
    repeat($urandom_range(4,2))
      payload.push_back($urandom);

  endtask: gen

  task send();

    send_addrs();
    send_pad();
    send_payload();

  endtask: send

  task send_addrs();

    rtr_io.cb.frame_n[sa] <= 1'b0; //start of packet
    for(int i=0; i<4; i++) begin
      rtr_io.cb.din[sa] <= da[i]; //i'th bit of da
      @rtr_io.cb;
    end

  endtask: send_addrs

  task send_pad();

    rtr_io.cb.frame_n[sa] <= 1'b0;
    rtr_io.cb.din[sa] <= 1'b1;
    rtr_io.cb.valid_n[sa] <= 1'b1;
    repeat(5) @rtr_io.cb;

  endtask: send_pad

  task send_payload();

    foreach(payload[index])
      for(int i=0; i<8; i++) begin
        rtr_io.cb.din[sa] <= payload[index][i];
        rtr_io.cb.valid_n[sa] <= 1'b0; //driving a valid bit
        rtr_io.cb.frame_n[sa] <= ((i == 7) && (index == (payload.size() - 1)));
        @rtr_io.cb;
      end
    rtr_io.cb.valid_n[sa] <= 1'b1;
  endtask: send_payload

  //Lab 3 - Task 3, Step 1
  //
  //Declare the recv() task

  //ToDo
  task recv();

    //Lab 3 - Task 3, Step 2
    //
    //In recv() task call get_payload() to retrieve payload

    //ToDo
  get_payload();

  endtask: recv

  //Lab 3 - Task 3, Step 3
  //
  //Declare the get_payload() task

  //ToDo
  task get_payload();

    //Lab 3 - Task 3, Step 4
    //
    //In get_payload() delete content of pkt2cmp_payload[$]

    //ToDo
    pkt2cmp_payload.delete();

    //Lab 3 - Task 3, Step 5
    //
    //Continuing in get_payload() wait for falling edge of output frame signal
  //Implement a watchdog timer of 1000 clocks

    //ToDo
    fork
    begin: wd_timer_fork
      fork: frameo_wd_timer
        //Do not use @(negedge rtr_io.cb.frameo_n[da]);
        //This may cause timing issues because of how the LRM defines it.
        begin
          wait(rtr_io.cb.frameo_n[da] !== 0);
          @(rtr_io.cb iff(rtr_io.cb.frameo_n[da] === 0 ));
        end
        begin                              //this is another thread
          repeat(1000) @rtr_io.cb;
          $display("\n%m\n[ERROR]%t Frame signal timed out!\n", $realtime);
          $finish;
        end
      join_any: frameo_wd_timer
      disable fork;
    end: wd_timer_fork
    join

    //Lab 3 - Task 3, Step 6
    //
    //Continuing in get_payload() sample output of the router:
    //Loop until end of frame is detected.
    //Within the loop, assemble a byte of data at a time(8 clocks)
    //Store each byte in pkt2cmp_payload[$]

    //ToDo
    forever begin
      logic[7:0] datum;
      for(int i=0; i<8; i=i)  begin //i=i prevents VCS warning messages
        if(!rtr_io.cb.valido_n[da])
          datum[i++] = rtr_io.cb.dout[da];
        if(rtr_io.cb.frameo_n[da])
          if(i==8) begin //byte alligned
            pkt2cmp_payload.push_back(datum);
            return;      //done with payload
          end

          //Lab 3 - Task 3, Step 7
          //
          //If payload is not byte aligned, print message and end simulation

          //ToDo
          else begin
            $display("\n%m\n[ERROR]%t Packet payload not byte aligned!\n", $realtime);
            $finish;
          end
        @rtr_io.cb;
      end
      pkt2cmp_payload.push_back(datum);
    end
  endtask: get_payload

  //Lab 3 - Task 4, Step 1
  //
  //Create function compare() which returns single bit
  //and has pass-by-reference string argument

  //ToDo
  function bit compare(ref string message);

    //Lab 3 - Task 4, Step 2
    //
    //In compare() compare data payload[$] with pkt2cmp_payload[$]
    //If sizes do not match
    //   set string argument with description of error
    //   terminate subroutine by returning a 0
    //If data matches (you can directly compare arrays using ==)
    //   set string argument with description of success
    //   terminate subroutine successfully by returning a 1
    //If data does not match
    //   set string argument with description of error
    //   terminate subroutine by returning a 0

    //ToDo
    if(payload.size() != pkt2cmp_payload.size()) begin
      message = "Payload size Mismatch:\n";
      message = { message, $sformatf("payload.size() = %0d, pkt2cmp_payload.size() = %0d\n", payload.size(), pkt2cmp_payload.size()) };
      return (0);
    end
    if(payload == pkt2cmp_payload) ;
    else begin
      message = "Payload Content Mismatch:\n";
      message = { message, $sformatf("Packet Sent:   %p\nPkt Received:   %p", payload, pkt2cmp_payload) };
      return (0);
    end
    message = "Successfully Compared";
    return(1);
  endfunction: compare

  //Lab 3 - Task 4, Step 3
  //
  //Create function called check()

  //ToDo
  function void check();

    //Lab 3 - Task 4, Step 4
    //
    //In check() declare a string variable message
    //keep a count of packets checked with variable pkts_checked

    //ToDo
    string message;
    static int pkts_checked = 0;

    //Lab 3 - Task 4, Step 4
    //
    //In check() call compare() to check the packet received
    //If error detected print error message and end simulation
    //If successful print message indicating number of packets checked

    //ToDo
    if (!compare(message)) begin
      $display("\n%m\n[ERROR]%t Packet #%0d %s\n", $realtime, pkts_checked, message);
      $finish;
    end
    $display("[NOTE]%t Packet #%0d %s", $realtime, pkts_checked++, message);
  endfunction: check

endprogram: test
