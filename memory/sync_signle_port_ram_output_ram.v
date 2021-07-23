/* synchronous memory - Register Output - Single port */
module sync_signle_port_ram_output_ram (
	input [7:0] data,
	input [15:0] addr,
	input we, clk,
	output reg [7:0] q
);

reg [7:0] ram[0:65535];

always @ (posedge clk) begin
	if (we)
		ram[addr] <= data;
	q <= ram[addr];
end

endmodule
