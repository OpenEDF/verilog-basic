/* Synchronous Memory - Register Input - Simple Dual Port Mmeory - Dual Clock */
module sync_simple_dual_port_ram_dual_clock_input_reg (	
	input [7:0] data,
	input [15:0] read_addr, write_addr,
	input we, read_clk, write_clk,
	output [7:0] q
);

reg [7:0] ram[0:65535];
reg [15:0] read_addr_reg;

always @ (posedge write_clk) begin
	if (we)
		ram[write_addr] <= data;
end

always @ (posedge read_clk) begin
	read_addr_reg <= read_addr;
end

assign q = ram[read_addr_reg];

endmodule

