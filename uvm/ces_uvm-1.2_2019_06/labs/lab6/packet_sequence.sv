// The packet_sequence class has been modified to extend from packet_sequence_base class.
// The reason for this change is to simplify development of the body() method of the sequence
// by moving the raising and dropping of objections to the base class's pre_start() and
// post_start() methods.
//
// With this modification, the packet_sequence class's body() method no longer needs to
// raise and drop objections. 

class packet_sequence_base extends uvm_sequence #(packet);
  `uvm_object_utils(packet_sequence_base)

  function new(string name = "packet_sequence_base");
    super.new(name);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    `ifndef UVM_VERSION_1_1
     set_automatic_phase_objection(1);
    `endif
  endfunction: new

  `ifdef UVM_VERSION_1_1
  virtual task pre_start();
    if ((get_parent_sequence() == null) && (starting_phase != null)) begin
      starting_phase.raise_objection(this);
    end
  endtask: pre_start

  virtual task post_start();
    if ((get_parent_sequence() == null) && (starting_phase != null)) begin
      starting_phase.drop_objection(this);
    end
  endtask: post_start
  `endif
endclass: packet_sequence_base

class packet_sequence extends packet_sequence_base;

  // The following fields are added to the sequence class.
  //
  //   int       item_count = 10;
  //   int       port_id    = -1;
  //   int       valid_da[$];
  //
  // The intent of the item_count field is to control how many packet objects
  // to create and pass on to the driver per execution of the body() task.
  //
  // The intent of the port_id field is to constrain the packet's source address.
  //
  // The lab DUT has 16 input ports needing to be tested.  Each input agent created
  // to drive a particular port will be assigned a port_id specifying which port it
  // should exercise.  Because of this, the sequence within an input agent when
  // when generating packets need to constrain the packet's source address.
  //
  // The rule for constrainint the source address shall be as follows:
  // If port_id is inside the range of {[0:15]}, then the source address shall be port_id.
  // If port_id is -1 (unconfigured), the source address shall be in the range of {[0:15]}
  // port_id outside the range of {-1, {[0:15]} is not allowed.
  //
  // The intent of the valid_da[$] field is to constraint the packets' destination address.

  int       item_count = 10;
  int       port_id    = -1;
  int       valid_da[$];

  // To enable the valid_da[$] for configuration, a user data type need to be created.
  // In this lab, it will be called int_q_t, since it is a data type for a queue of int.
  typedef int int_q_t[$];

  // The `uvm_object_utils macro takes care of the added fields.
  `uvm_object_utils_begin(packet_sequence)
    `uvm_field_int(item_count, UVM_ALL_ON)
    `uvm_field_queue_int(valid_da, UVM_ALL_ON)
    `uvm_field_int(port_id, UVM_ALL_ON)
  `uvm_object_utils_end

  // The retrieval of the configuration values for the sequence needs to happen before the body() method is executed.
  // A good place to retreive the configuration fields and populate the valid_da queue is in the pre_start() method.
  //
  // To simplify your code development, the code is done for you as follows:
  virtual task pre_start();
    super.pre_start();

    uvm_config_db#(int)::get(get_sequencer(), get_type_name(), "item_count", item_count);
    uvm_config_db#(int_q_t)::get(get_sequencer(), get_type_name(), "valid_da", valid_da);
    uvm_config_db#(int)::get(get_sequencer().get_parent(), "", "port_id",port_id);
    if (!(port_id inside {-1, [0:15]})) begin
      `uvm_fatal("CFGERR", $sformatf("Illegal port_id value of %0d", port_id));
    end
  endtask: pre_start

  function new(string name = "packet_sequence");
    super.new(name);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    for (int i=0; i<16; i++) begin
      valid_da.push_back(i);    // Set the default to enable all ports.
    end
  endfunction: new

  virtual task body();
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    // Instead of hard coding the number of item to be generated, the hard-coded value 10 has been replaced
    // with a configuration field - item_count.
    repeat(item_count) begin

      // As stated in the comment at the beginning of the file.  If the port_id is unconfigured (-1)
      // then the legal values for the source address shall be in the range of {[0:15]}.  If the
      // port_id is configured, then the source address shall be port_id.  This will give the test
      // the ability to test whether or not the driver drops the packet it is not configured to drive.
      //
      // For destination address, the legal values should be picked out of the valid_da array.
      //
      // There are changes from UVM-1.1 and 1.2 to IEEE UVM.
      //
      // For UVM-1.1 & UVM-1.2
      `ifndef UVM_VERSION
        `uvm_do_with(req, {if (port_id == -1) sa inside {[0:15]}; else sa == port_id; da inside valid_da;});
      // For IEEE UVM
      `else
        `uvm_do(req,,, {if (port_id == -1) sa inside {[0:15]}; else sa == port_id; da inside valid_da;});
      `endif

    end
 endtask: body

endclass: packet_sequence
