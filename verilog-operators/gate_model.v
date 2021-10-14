module gate_model;

wire x1;
wire x2;
wire x3;

initial begin
    x1 = 1'b1;
    x2 = 1'b0;
    and (x3, x2, x1);
    $display("x3 = %b", x3);
end

endmodule
