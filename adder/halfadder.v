module halfadder (
	input a,
	input b,
	output c,
	output s);

/* operation adder */
assign c = a & b;
assign s = a ^ b;

endmodule
