/* Synchronous Mmeory Register Output Simple Dual Port Memory Dual-Clock */
module sync_simple_dual_port_ram_dual_clock_output_reg (
	input [7:0] data,
	input [15:0] read_addr, write_addr,
	input we, read_clk, write_clk,
	output reg [7:0] q
);

reg [7:0] ram[0:65535];

always @ (posedge write_clk) begin
	if (we)
		ram[write_addr] <= data;
end

always @ (posedge read_clk) begin
	q <= ram[read_addr];
end	

endmodule
