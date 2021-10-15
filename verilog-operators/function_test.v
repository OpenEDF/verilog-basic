/* function test */
module function_test;

// 1. declarartion method 1
function [7:0] byteand;
input [7:0] a, b;
begin
    byteand = (a & b);
end
endfunction

// 2. declarartion method 2
function [7:0] byteor (input [7:0] n, input [7:0] m);
begin
    byteor = (n | m);
end
endfunction

// 3. test function
reg [7:0] x, y, z;

initial begin
    x = 8'b11001100;
    y = 8'b11000011;
    z = byteand(x, y);
    $display("The function byteand test value is: %b", z);
    z = byteor(x, y);
    $display("The function byteor  test value is: %b", z);
end

endmodule
// 1. test 1 output result
//The function byteand test value is: 11000000
//The function byteor  test value is: 11001111
