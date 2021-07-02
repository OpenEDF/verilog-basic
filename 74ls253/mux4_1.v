module mux4_1 (
    input EN_n,
    input A, B,
    input D0, D1, D2, D3,
    output Y
);

/* KEEP THE OUTPUT VALUE */
wire [1:0] S;
reg Y_reg;

assign S = {B, A};

always @(*) begin
    if (EN_n)
        Y_reg = 1'bz;
    else
        case (S)
            2'b00: Y_reg <= D0;
            2'b01: Y_reg <= D1;
            2'b10: Y_reg <= D2;
            2'b11: Y_reg <= D3;
        endcase
end

assign Y = Y_reg;

endmodule
