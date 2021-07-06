module decode_74ls138 (
    input wire  A0, A1, A2, G1, G2, G3,
    output wire Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7
);

reg [7:0] Y_reg;
integer  i;

always @ (*) begin
    if ({G1, G2, G3} == 3'b100) begin
        for (i = 0; i <= 7; i = i + 1)
            if ({A2, A1, A0} == i)
                Y_reg[i] = 0;
            else
                Y_reg[i] = 1;
        end
    else
        Y_reg = 8'hff;

end

assign Y0 = Y_reg[0];
assign Y1 = Y_reg[1];
assign Y2 = Y_reg[2];
assign Y3 = Y_reg[3];
assign Y4 = Y_reg[4];
assign Y5 = Y_reg[5];
assign Y6 = Y_reg[6];
assign Y7 = Y_reg[7];

endmodule

