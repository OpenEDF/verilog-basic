// verilog system function and task for math functions
//
// run: make FILE=math.v

module math();

initial begin
    $display("The clog2(64)  = %0d", $clog2(64));
    $display("The ln(100)    = %0d", $ln(100));
    $display("The log10(100) = %0d", $log10(100));
    $display("The pow(2,3)   = %0d", $pow(2, 3));
end

endmodule
