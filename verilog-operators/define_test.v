/* Compiler directives */
module define_test;

// 1. `define
//    `undef
`define SIZE 8
`define NAME "macro"

initial begin
    $display("The test define SIZE=%d, NAME=%s.", `SIZE, `NAME);
//    `undef SIZE
//    $display("The test define SIZE=%d.", `SIZE);
//define_test.v:12: warning: macro SIZE undefined (and assumed null) at this point.
end

// 2. `ifdef
//    `else
//    `elsif
//    `endif
//`define TEST_DEFINE (input from cli)
// add the -D XXX in compiler time: $iverilog -D TEST_DEFINE define_test.v
initial begin
    `ifdef TEST_DEFINE
        $display("The TEST_DEFINE is found.");
    `else
        $display("Not define TEST_DEFINE.");
    `endif
end

// 3. `ifndef
initial begin
    `ifndef TEST_DEFINE
        $display("Plese add \"-D TEST_DEFINE\" in compiler on cli.");
    `endif
end

endmodule
