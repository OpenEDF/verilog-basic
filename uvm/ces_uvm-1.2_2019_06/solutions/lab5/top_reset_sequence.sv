//
// The following is the top reset sequence that you will need to populate to
// manage the reset sequence execution order among concurrent agents.
//

class top_reset_sequence extends uvm_sequence;
  `uvm_object_utils(top_reset_sequence)

  // Lab 5 - Task 1, Step 4
  //
  // Use the `uvm_declare_p_sequencer macro to create the p_sequencer handle
  // for accessing the content of the top reset sequencer.
  //
  // `uvm_declare_p_sequencer(top_reset_sequencer)
  //
  // ToDo
  `uvm_declare_p_sequencer(top_reset_sequencer)


  // Lab 5 - Task 1, Step 5
  //
  // In this upper layer sequence you will need to manage two types of sequence
  // execution: reset_sequence and router_input_port_reset_sequence.
  //
  // Create a handle of each type here.  Call the reset_sequence handle r_seq
  // And call the router_input_port_reset_sequence handle i_seq.
  //
  // reset_sequence                    r_seq;
  // router_input_port_reset_sequence  i_seq;
  //
  // ToDo
  reset_sequence                    r_seq;
  router_input_port_reset_sequence  i_seq;


  // Lab 5 - Task 4, Step 6
  //
  // Add the "reset" uvm_event singleton object to the class.
  //
  // uvm_event reset_event = uvm_event_pool::get_global("reset");
  //
  // ToDo
  uvm_event reset_event = uvm_event_pool::get_global("reset");

  function new(string name="virtual_reset_sequence");
    super.new(name);    
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    `ifndef UVM_VERSION_1_1
     set_automatic_phase_objection(1);
    `endif
  endfunction: new

  virtual task body();
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    // Lab 5 - Task 1, Step 6
    //
    // This upper layer sequence need to execute the reset_sequence first,
    // followed by the execution of the router_input_port_reset_sequence.
    //
    // Code the following:  (Code it as shown.  Don't worry if you disagree
    // with the implementation.  It is done this way with a reason.)
    //
    // For UVM-1.1 & UVM-1.2
    //
    // `ifndef UVM_VERSION
    //   `uvm_do_on(r_seq, p_sequencer.r_sqr);
    //   foreach (p_sequencer.pkt_sqr[i]) begin
    //     `uvm_do_on(i_seq, p_sequencer.pkt_sqr[i]);
    //   end
    //
    // For IEEE UVM
    //
    // `else
    //   `uvm_do(r_seq, p_sequencer.r_sqr);
    //   foreach (p_sequencer.pkt_sqr[i]) begin
    //     `uvm_do(i_seq, p_sequencer.pkt_sqr[i]);
    //   end
    //
    // `endif
    //
    // ToDo
/*
    // For UVM-1.1 & UVM-1.2
    //
    `ifndef UVM_VERSION
      `uvm_do_on(r_seq, p_sequencer.r_sqr);
      foreach (p_sequencer.pkt_sqr[i]) begin
        `uvm_do_on(i_seq, p_sequencer.pkt_sqr[i]);
      end
    //
    // For IEEE UVM
    //
    `else
      `uvm_do(r_seq, p_sequencer.r_sqr);
      foreach (p_sequencer.pkt_sqr[i]) begin
        `uvm_do(i_seq, p_sequencer.pkt_sqr[i]);
      end
    `endif
*/


    // Lab 5 - Task 3, Step 2
    //
    // Comment out the above code.
    //
    // Then, replace the code with the following:
    //
    // For UVM-1.1 & UVM-1.2
    //
    // `ifndef UVM_VERSION
    //   fork
    //     `uvm_do_on(r_seq, p_sequencer.r_sqr);
    //     foreach (p_sequencer.pkt_sqr[i]) begin
    //       fork
    //         int j = i;
    //         `uvm_do_on(i_seq, p_sequencer.pkt_sqr[j]);
    //       join_none
    //     end
    //   join
    //
    // For IEEE UVM
    //
    // `else
    //   fork
    //     `uvm_do(r_seq, p_sequencer.r_sqr);
    //     foreach (p_sequencer.pkt_sqr[i]) begin
    //       fork
    //         int j = i;
    //         `uvm_do(i_seq, p_sequencer.pkt_sqr[j]);
    //       join_none
    //     end
    //   join
    //
    // `endif
    //
    // ToDo

/*
    // For UVM-1.1 & UVM-1.2
    //
    `ifndef UVM_VERSION
      fork
        `uvm_do_on(r_seq, p_sequencer.r_sqr);
        foreach (p_sequencer.pkt_sqr[i]) begin
          fork
            int j = i;
            `uvm_do_on(i_seq, p_sequencer.pkt_sqr[j]);
          join_none
        end
      join
    //
    // For IEEE UVM
    //
    `else
      fork
        `uvm_do(r_seq, p_sequencer.r_sqr);
        foreach (p_sequencer.pkt_sqr[i]) begin
          fork
            int j = i;
            `uvm_do(i_seq, p_sequencer.pkt_sqr[j]);
          join_none
        end
      join
    
    `endif
*/


    // Lab 5 - Task 4, Step 7
    //
    // Comment out the above code.
    //
    // Then, replace the code with the following:
    //
    // For UVM-1.1 & UVM-1.2
    //
    // `ifndef UVM_VERSION
    //   fork
    //     `uvm_do_on(r_seq, p_sequencer.r_sqr);
    //     foreach (p_sequencer.pkt_sqr[i]) begin
    //       fork
    //         int j = i;
    //         begin
    //           reset_event.wait_on();
    //           `uvm_do_on(i_seq, p_sequencer.pkt_sqr[j]);
    //         end
    //       join_none
    //     end
    //   join
    //
    // For IEEE UVM
    //
    // `else
    //   fork
    //     `uvm_do(r_seq, p_sequencer.r_sqr);
    //     foreach (p_sequencer.pkt_sqr[i]) begin
    //       fork
    //         int j = i;
    //         begin
    //           reset_event.wait_on();
    //           `uvm_do(i_seq, p_sequencer.pkt_sqr[j]);
    //         end
    //       join_none
    //     end
    //   join
    //
    // `endif
    //
    // ToDo

    // For UVM-1.1 & UVM-1.2
    //
    `ifndef UVM_VERSION
      fork
        `uvm_do_on(r_seq, p_sequencer.r_sqr);
        foreach (p_sequencer.pkt_sqr[i]) begin
          fork
            int j = i;
            begin
              reset_event.wait_on();
              `uvm_do_on(i_seq, p_sequencer.pkt_sqr[j]);
            end
          join_none
        end
      join
    //
    // For IEEE UVM
    //
    `else
      fork
        `uvm_do(r_seq, p_sequencer.r_sqr);
        foreach (p_sequencer.pkt_sqr[i]) begin
          fork
            int j = i;
            begin
              reset_event.wait_on();
              `uvm_do(i_seq, p_sequencer.pkt_sqr[j]);
            end
          join_none
        end
      join
    `endif

  endtask: body

  `ifdef UVM_VERSION_1_1
  virtual task pre_start();
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    if ((get_parent_sequence() == null) && (starting_phase != null)) begin
      starting_phase.raise_objection(this);
    end
  endtask: pre_start

  virtual task post_start();
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    if ((get_parent_sequence() == null) && (starting_phase != null)) begin
      starting_phase.drop_objection(this);
    end
  endtask: post_start
  `endif

endclass: top_reset_sequence
