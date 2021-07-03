/* 74LS151 mux 8 - 1 */
module mux8_1 (
	input D0, D1, D2, D3, D4, D5, D6, D7,
	input DS0, DS1, DS2,
	input G_n,
	output Y, Y_n
);

reg Y_reg;
wire [2:0] S;
assign S = {DS2, DS1, DS0};

/* data select */
always @ (*) begin
	if (G_n)
		Y_reg = 1'bz;
	else
		case (S)
			3'b000: Y_reg <= D0;
			3'b001: Y_reg <= D1;
			3'b010: Y_reg <= D2;
			3'b011: Y_reg <= D3;
			3'b100: Y_reg <= D4;
			3'b101: Y_reg <= D5;
			3'b110: Y_reg <= D6;
			3'b111: Y_reg <= D7;
		endcase
	end

assign Y = Y_reg;
assign Y_n = ~ Y;

endmodule
