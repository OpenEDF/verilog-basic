/* Synchronous Memory - Register Output -Simple Dual Port Memory - Single
* Clock  */
module sync_simple_dual_port_ram_signle_clock_output_reg (
	input [7:0] data,
	input [15:0] read_addr, write_addr,
	input we, clk,
	output [7:0] q
);

reg [7:0] ram[0:65535];

always @ (posedge clk) begin
	if (we)
		ram[write_addr] <= data;
	q <= ram[read_addr];
end

endmodule
