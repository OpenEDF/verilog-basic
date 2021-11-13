// ------------------------------------------------------------------
// FileName : extend.v
// Function : A simple design showing the effect of logic value extension
//            when assigning a bit to a vector
// ------------------------------------------------------------------
// Author   : QilinZhao
// Version  : v-1.0
// Date     : 2013-06-28
// E-mail   : forqilin@163.com
// Copyright: QiXin Studio
// ------------------------------------------------------------------

 `timescale 1ns/100ps

module extend (
  output[31:0] My32bits, My32bit
  //output[31:0] My32bits, 
  //output       My32bit
  );
  
  // No need for inputs.
  // For good design practice, the outputs are converted
  // explicitly from reg to wire by continuous assigns.
  
  reg[31:0] My32bitsReg, My32bitReg;
  //reg[31:0] My32bitsReg;
  //reg       My32bitReg;
  assign My32bits = My32bitsReg;
  assign My32bit  = My32bitReg;
  
  // An initial block is procedural and thus is not
  // allowed to assign to a wire -- only to a reg or
  // integer:
 
  initial
    begin
    #5   My32bitsReg =  'bz; // bits extension
    $display("at %0t: My32bitsReg = 32'b%b", $time, My32bitsReg);

    #0.1 My32bitReg  = 1'bz; // timesacle 0.1 = 100ps
    $display("at %0t: My32bitReg = 32'b%b", $time, My32bitReg);
    
    #5   My32bitsReg =  'bx;
    $display("at %0t: My32bitsReg = 32'b%b", $time, My32bitsReg);
    
    #0.1 My32bitReg  = 1'bx;
    $display("at %0t: My32bitReg = 32'b%b", $time, My32bitReg);
    
    #5   My32bitsReg =  'b0;
    $display("at %0t: My32bitsReg = 32'b%b", $time, My32bitsReg);

    #0.1 My32bitReg  = 1'b0;
    $display("at %0t: My32bitReg = 32'b%b", $time, My32bitReg);
    
    #5   My32bitsReg =  'b1; // 1 can not be extended to MSB
    $display("at %0t: My32bitsReg = 32'b%b", $time, My32bitsReg);
  
    #0.1 My32bitReg  = 1'b1;
    $display("at %0t: My32bitReg = 32'b%b", $time, My32bitReg);

    #5 $finish; // $finish(2);
    end
  
endmodule // extend
