module binbcd4(
    input wire [3:0] b,
    output wire [4:0] p
);

assign p[4] = b[3] & b[2] | b[3] & b[1];
assign p[3] = b[3] & ~b[2] & ~b[1];
assign p[2] = ~b[3] & b[2] | b[2] & b[1];
assign p[1] = b[3] & b[2] & ~b[1] | ~b[3] & b[1];
assign p[0] = b[0];
    
endmodule
