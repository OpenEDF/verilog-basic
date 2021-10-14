module un_signed;

integer intA = -4'd12;
integer intB =  4'd12;
reg signed [15:0] regA;

initial begin
    regA = intA / 3;
end

initial begin
    $display("The integer -4'd12 = %b\n", intA);
    $display("The integer  4'd12 = %b\n", intB);
    $display("The integer  regA  = %b\n", regA);
end        

endmodule
