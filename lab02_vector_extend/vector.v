// ------------------------------------------------------------------
// FileName : vector.v
// Function : some simple vector operations 
// ------------------------------------------------------------------
// Author   : QilinZhao
// Version  : v-1.0
// Date     : 2013-06-28
// E-mail   : forqilin@163.com
// Copyright: QiXin Studio
// ------------------------------------------------------------------

`timescale 1ns/100ps

module vector;
  reg [0:15] MyBus;  // A vector of 16 bits of storage.
  wire[15:0] mybus;  // A 16-bit bus. case sensitive
  wire       mybit;  // One bit bus.
  
  reg [47:0] My32bits;

  assign mybus = 16'heeee; // Continuously drive the wire bus.
  assign mybit = 1'b0;     // Hold the wire at 0.

  initial
  begin
    $display("at %0t : mybus=16'b%0b", $time, mybus);
    $display("at %0t : mybit=1'b%0b" , $time, mybit);
    #10 MyBus        = 16'h3333;
    
    $display("at %0t : MyBus=16'h%0h" , $time, MyBus);
    $display("at %0t : MyBus[0:2]=3'b%0b"  , $time, MyBus[0:2]);  // vector partial selection
    $display("at %0t : mybus[10:8]=3'b%0b" , $time, mybus[10:8]);

    #10 MyBus[0:2]   = mybus[10:8];  // MSB always on the left.

    $display("after MyBus[0:2] = mybus[10:8]");
    $display("at %0t : MyBus[0:2]=3'b%0b"  , $time, MyBus[0:2]);
    $display("at %0t : mybus[10:8]=3'b%0b" , $time, mybus[10:8]);
    
    #10 MyBus        = mybus;

    $display("at %0t : MyBus=16'b%0b" , $time, MyBus);
    $display("at %0t : MyBus=16'b%0b" , $time, MyBus); // MyBus[15:0] is illegal.
    $display("at %0t : mybus=16'b%0b" , $time, mybus);

    #10 MyBus[0:15]  = mybus[15:0];  // similar to : MyBus=mybus;
    
    $display("at %0t : MyBus[0:15]=16'b%0b" , $time, MyBus[0:15]);
    $display("at %0t : mybus[15:0]=16'b%0b" , $time, mybus[15:0]);

    #10 MyBus[0]     = mybit;        // Zero index indicates the MSB.

    $display("at %0t : MyBus[0]=1'b%0b" , $time, MyBus[0]);
    
    #10 MyBus = 16'hxxxx; // Flag the end of this step in the lab.
    #5  My32bits  = 'bz; $display("at %0t : My32bits=32'b%b" , $time, My32bits);
    #5  My32bits  = 'bx; $display("at %0t : My32bits=32'b%b" , $time, My32bits);
    #5  My32bits  = 'b0; $display("at %0t : My32bits=32'b%b" , $time, My32bits);
    #5  My32bits  = 'b1; $display("at %0t : My32bits=32'b%b" , $time, My32bits);
    #10 ;
    #5  My32bits  = 1'bz;$display("at %0t : My32bits=32'b%b" , $time, My32bits);
    #5  My32bits  = 1'bx;$display("at %0t : My32bits=32'b%b" , $time, My32bits);
    #5  My32bits  = 1'b0;$display("at %0t : My32bits=32'b%b" , $time, My32bits);
    #5  My32bits  = 1'b1;$display("at %0t : My32bits=32'b%b" , $time, My32bits);
    #5  $finish;
  end
endmodule // vector
