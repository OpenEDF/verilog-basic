// top
module width_assign ();

// reg variable
(* ASYNC_REG = "TURE" *)reg [31:0] test_var;
reg [31:0] test_vbr;
reg [31:0] test_vcr;

initial begin
    test_var = 32'h0000_0000;
    test_vbr = 32'h0;
    test_vcr = 32'b0;
end

initial begin
    $display("test_var type a assign is: %h", test_var);
    $display("test_var type a assign is: %b", test_var);
    $display("test_var type b assign is: %h", test_vbr);
    $display("test_var type b assign is: %b", test_vbr);
    $display("test_var type c assign is: %h", test_vcr);
    $display("test_var type c assign is: %b", test_vcr);
end

endmodule

// output
/*
test_var type a assign is: 00000000
test_var type a assign is: 00000000000000000000000000000000
test_var type b assign is: 00000000
test_var type b assign is: 00000000000000000000000000000000
test_var type c assign is: 00000000
test_var type c assign is: 00000000000000000000000000000000
*/
