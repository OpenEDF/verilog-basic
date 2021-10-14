/* Math function test */

module math_test;

integer result;
initial begin
    result = $clog2(8);
    $display("The result is %d", result);
end

endmodule

// run output
// The result is           3
