/* binary multiplication decimal numbers */
module multiplic100 (
	input wire [7:0] x,
	output wire [15:0] p
);

	/* 100 = 2 ^ 6 + 2 ^ 5 + 2 ^ 2 */
	assign p = {2'b0, x, 6'b000000} + {3'b000, x, 5'b00000} + {6'b000000, x, 2'b00};

endmodule
