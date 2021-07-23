/* synchronous memory - Register Input - simple Dual Port Memory - Signal
* clock */
module sync_simple_dual_port_ram_simple_clock_input_reg (
	input [7:0] data,
	input [15:0] read_addr, write_addr,
	input we, clk,
	output [7:0] q
);

reg [7:0] ram[0:65535];
reg [15:0] read_addr_reg;

always @ (posedge clk) begin
	if (we)
		ram[write_addr] <= data;
	read_addr_reg <= read_addr;
end

assign q = ram[read_addr_reg];

endmodule
