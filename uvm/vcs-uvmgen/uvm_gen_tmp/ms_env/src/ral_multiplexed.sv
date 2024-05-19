//
// Template for UVM-compliant RAL adapter sequence (multi)
//

class REGTR extends uvm_reg_adapter;

`uvm_object_utils(REGTR)
 function new (string name="");
   super.new(name);
 endfunction

 virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
  m_item tr;
  tr = m_item::type_id::create("tr");
  tr.kind = (rw.kind == UVM_READ) ? m_item::READ : m_item::WRITE;
  //tr.addr = rw.addr;
  //tr.data = rw.data;
  return tr;
 endfunction

 virtual function void bus2reg (uvm_sequence_item bus_item,
                                ref uvm_reg_bus_op rw);
  m_item tr;
  if (!$cast(tr, bus_item))
   `uvm_fatal("NOT_HOST_REG_TYPE", "bus_item is not correct type");
  rw.kind = tr.kind ? UVM_READ : UVM_WRITE;
  //rw.addr = tr.addr;
  //rw.data = tr.data;
  //rw.status = UVM_IS_OK;
 endfunction

endclass: REGTR

class ms_sub_adapter extends uvm_reg_adapter;

`uvm_object_utils(ms_sub_adapter)

 function new (string name="");
   super.new(name);
 endfunction
 
 virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
  m_item tr;
  tr = m_item::type_id::create("tr");
  tr.kind = (rw.kind == UVM_READ) ? m_item::READ : m_item::WRITE;
  //tr.addr = rw.addr;
  //tr.data = rw.data;
  return tr;
 endfunction

 virtual function void bus2reg (uvm_sequence_item bus_item,
                                ref uvm_reg_bus_op rw);
  m_item tr;
  if (!$cast(tr, bus_item))
   `uvm_fatal("NOT_HOST_REG_TYPE", "bus_item is not correct type");
  rw.kind = tr.kind ? UVM_READ : UVM_WRITE;
  //rw.addr = tr.addr;
  //rw.data = tr.data;
  // rw.status = UVM_IS_OK;
 endfunction

endclass: ms_sub_adapter

//ToDo: Any more domains can be added here in a similar way as shown above
