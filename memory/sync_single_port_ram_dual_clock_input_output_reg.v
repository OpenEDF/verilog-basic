/* Synchronous Memory - Register Input and Output -Single port Dual clock */
module sync_single_port_ram_dual_clock_input_output_reg (
	input [7:0] data,
	input [15:0] addr,
	input we, in_clk, out_clk,
	output reg [7:0] q
);

reg [7:0] ram[0:65535];
reg [15:0] addr_reg;

always @ (posedge in_clk) begin
	if (we)
		ram[addr] <= data;
	addr_reg <= addr;
end

always @ (posedge out_clk) begin
	q <= ram[addr_reg];
end	

endmodule
