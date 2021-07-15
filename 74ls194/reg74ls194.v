/* 74LS194 */
module reg74ls194(
    input CR_n,             /* reset */
    input CP,               /* clock */
    input S0, S1,           /* function control: 11: paraller 00: keep 01: right 10: left */
    input DSl, DSr,        /* left shift, right shift */
    input D0, D1, D2, D3,
    output Q0, Q1, Q2, Q3
);

reg [0:3] q_reg = 4'b0000;
wire [1:0] s_reg;
assign s_reg = {S1, S0};

always @(negedge CR_n or posedge CP) begin
    if (!CR_n)              /* reset */
        q_reg <= 4'b0000;
    else begin
        case (s_reg)
            2'b00 : q_reg <= q_reg;
            2'b01 : q_reg <= {DSr, q_reg[0:2]};
            2'b10 : q_reg <= {q_reg[1:3], DSl};
            2'b11 : q_reg <= {D0, D1, D2, D3};
            default : q_reg <= 4'b0000;
        endcase
    end
end

/* assign value */
assign Q0 = q_reg[0];
assign Q1 = q_reg[1];
assign Q2 = q_reg[2];
assign Q3 = q_reg[3];
    
endmodule
