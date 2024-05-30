class host_data extends uvm_sequence_item;
  rand uvm_access_e kind;
  rand uvm_status_e status;
  rand bit[15:0]    addr;
  rand bit[15:0]    data;
 
  `uvm_object_utils_begin(host_data)
    `uvm_field_int(addr, UVM_ALL_ON)
    `uvm_field_int(data, UVM_ALL_ON)
    `uvm_field_enum(uvm_access_e, kind, UVM_ALL_ON)
    `uvm_field_enum(uvm_status_e, status, UVM_ALL_ON)
  `uvm_object_utils_end

  constraint valid { addr inside {'h0, 'h100, ['h1000:'h10ff], ['h4000:'h4ffff]}; }

  function new(string name="host_data");
    super.new(name);
    `uvm_info("Trace", $sformatf("%m"), UVM_HIGH);
    status.rand_mode(0);
  endfunction: new
endclass: host_data

//
// For the sake of minimizing the number of files in each lab directory, you will be
// creating the translator class in the same file as the host_data class.
//

class reg_adapter extends uvm_reg_adapter;
  `uvm_object_utils(reg_adapter)

  function new(string name="reg_adapter");
    super.new(name);
    `uvm_info("Trace", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
    host_data tr;
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    // Lab 6 - Task 11, Step 3
    // Construct the host_data object (tr).
    //
    // Then, convert the UVM register data to the host_data type and return the result.
    //
    // tr = host_data::type_id::create("tr");
    // tr.addr = rw.addr;
    // tr.data = rw.data;
    // tr.kind = rw.kind;
    // return tr;
    //
    // ToDo
    tr = host_data::type_id::create("tr");
    tr.addr = rw.addr;
    tr.data = rw.data;
    tr.kind = rw.kind;
    return tr;



  endfunction: reg2bus

  virtual function void bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
    host_data tr;
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    // Lab 6 - Task 11, Step 4
    // Check to see if bus_item in the first argument is host_data type.  If not, print a fatal message.
    //
    // Otherwise, populate the methods to converting the bus_item content back to UVM register data type.
    //
    // if (!$cast(tr, bus_item)) begin
    //   `uvm_fatal("NOT_HOST_REG_TYPE", "bus_item is not correct type");
    // end
    // rw.addr   = tr.addr;
    // rw.data   = tr.data;
    // rw.kind   = tr.kind;
    // rw.status = tr.status;
    //
    // ToDo
    if (!$cast(tr, bus_item)) begin
      `uvm_fatal("NOT_HOST_REG_TYPE", "bus_item is not correct type");
    end
    rw.addr = tr.addr;
    rw.data = tr.data;
    rw.kind   = tr.kind;
    rw.status = tr.status;


  endfunction: bus2reg
endclass: reg_adapter
