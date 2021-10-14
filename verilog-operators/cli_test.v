/* Test Command Line Arguments */
module cli_test;

// 1. $tets$plusargs
initial begin
    $display("-------------------- CLI ARGUMENTS --------------------");
    if ($test$plusargs("HELLO") == 1)
        $display("HELLO argument found!");
    else
        $display("Not found HELLO argument!");
end

// 2. $value$plusargs integer
integer int_v;
initial begin
   if ($value$plusargs("TEST=%d", int_v))
       $display("The TEST Value is %d.", int_v);
   else
       $display("The +TEST= not found. ");
end        

// 3. $value$plusargs string
reg [8*32:1] testname;
initial begin
   if ($value$plusargs("TESTNAME=%s", testname))
       $display("The TESTNAME is %s.", testname);
   else
       $display("The +TESTNAME= not found.");
end

endmodule

// test command
// $ iverilog -o test cli_test.v
// ./test +HELLO +TEST=1000 +TESTNAME="macro"
//-------------------- CLI ARGUMENTS --------------------
//HELLO argument found!
//The TEST Value is        1000.
//The TESTNAME is          macro.
