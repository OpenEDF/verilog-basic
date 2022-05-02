// relationship operation check and synplify use
module relation (
    input wire [1:0] a,
    input wire [1:0] b,
    output wire [0:0]c
);
    
assign c = (a == b) ? 1'b1 : 1'b0;
//assign c = (a == b);
//assign c = (a != b);

endmodule
