//
// Template for UVM-compliant transaction descriptor


`ifndef S_ITEM__SV
`define S_ITEM__SV


class s_item extends uvm_sequence_item;

   typedef enum {READ, WRITE } kinds_e;
   rand kinds_e kind;
   typedef enum {IS_OK, ERROR} status_e;
   rand status_e status;
   rand byte sa;

   // ToDo: Add constraint blocks to prevent error injection
   // ToDo: Add relevant class properties to define all transactions
   // ToDo: Modify/add symbolic transaction identifiers to match

   constraint s_item_valid {
      // ToDo: Define constraint to make descriptor valid
      status == IS_OK;
   }
   `uvm_object_utils_begin(s_item) 

      // ToDo: add properties using macros here
   
      `uvm_field_enum(kinds_e,kind,UVM_ALL_ON)
      `uvm_field_enum(status_e,status, UVM_ALL_ON)
   `uvm_object_utils_end
 
   extern function new(string name = "Trans");
endclass: s_item


function s_item::new(string name = "Trans");
   super.new(name);
endfunction: new


`endif // S_ITEM__SV
