// top and test
module ascii_verilog();

// reg variable
reg [6*10:1] test_var;

initial begin
    test_var = "add";
    #100
    test_var = "sub";
    #100
    test_var = "sll";
    #100
    $finish();
end

initial begin
    $display("ASCII value is: %s", test_var);
end

// dump
initial begin
    $fsdbDumpfile("ascii_verilog.fsdb");
    $fsdbDumpvars(0, ascii_verilog);
end

endmodule
