/* Test the function call function in other file */
`include "function_only.v"

module function_call;

/* instant function */
function_only funcall();

reg [7:0] a, b, c;

initial begin
    a = 10;
    b = 20;
    c = funcall.adder(a, b);
    $display("The a + b = %d", c);
end

endmodule
/*
//The a + b =  30
