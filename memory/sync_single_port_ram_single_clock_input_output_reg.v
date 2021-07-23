/* synchronous memory - Register Input and Output - Single port Single-Clock */
module sync_sigle_port_ram_input_reg (
	input [7:0] data,
	input [15:0] addr,
	input we, clk,
	output [7:0] q
);

reg [7:0] ram[0:65535];
reg [15:0] addr_reg;

always @ (posedge clk) begin
	if (we)
		ram[addr] <= data;
	addr_reg <= addr;
	q <= ram[addr_reg];
end

endmodule
