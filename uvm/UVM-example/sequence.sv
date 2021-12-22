
//=========================================================================
// mem_sequence - random stimulus 
//=========================================================================
class mem_sequence extends uvm_sequence#(mem_seq_item);
  
  `uvm_object_utils(mem_sequence)
  
  //--------------------------------------- 
  //Constructor
  //---------------------------------------
  function new(string name = "mem_sequence");
    super.new(name);
  endfunction
  
  `uvm_declare_p_sequencer(mem_sequencer)
  
  //---------------------------------------
  // create, randomize and send the item to driver
  //---------------------------------------
  virtual task body();
   repeat(2) begin
    req = mem_seq_item::type_id::create("req");
    wait_for_grant();
    req.randomize();
    send_request(req);
    wait_for_item_done();
   end 
  endtask
endclass
//=========================================================================

//=========================================================================
// write_sequence - "write" type
//=========================================================================
class write_sequence extends uvm_sequence#(mem_seq_item);
  
  `uvm_object_utils(write_sequence)
   
  //--------------------------------------- 
  //Constructor
  //---------------------------------------
  function new(string name = "write_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    `uvm_do_with(req,{req.wr_en==1;})
  endtask
endclass
//=========================================================================

//=========================================================================
// read_sequence - "read" type
//=========================================================================
class read_sequence extends uvm_sequence#(mem_seq_item);
  
  `uvm_object_utils(read_sequence)
   
  //--------------------------------------- 
  //Constructor
  //---------------------------------------
  function new(string name = "read_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    `uvm_do_with(req,{req.rd_en==1;})
  endtask
endclass
//=========================================================================

//=========================================================================
// write_read_sequence - "write" followed by "read" 
//=========================================================================
class write_read_sequence extends uvm_sequence#(mem_seq_item);
  
  `uvm_object_utils(write_read_sequence)
   
  //--------------------------------------- 
  //Constructor
  //---------------------------------------
  function new(string name = "write_read_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    `uvm_do_with(req,{req.wr_en==1;})
    `uvm_do_with(req,{req.rd_en==1;})
  endtask
endclass
//=========================================================================


//=========================================================================
// wr_rd_sequence - "write" followed by "read" (sequence's inside sequences)
//=========================================================================
class wr_rd_sequence extends uvm_sequence#(mem_seq_item);
  
  //--------------------------------------- 
  //Declaring sequences
  //---------------------------------------
  write_sequence wr_seq;
  read_sequence  rd_seq;
  
  `uvm_object_utils(wr_rd_sequence)
   
  //--------------------------------------- 
  //Constructor
  //---------------------------------------
  function new(string name = "wr_rd_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    `uvm_do(wr_seq)
    `uvm_do(rd_seq)
  endtask
endclass
//=========================================================================