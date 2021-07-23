/* Synchronous Memory Register Output True Dual Port Memory Dual Clock */
module sync_true_dual_port_ram_dual_clock_output_reg (
	input [7:0] data_a, data_b,
	input [15:0] addr_a, addr_b,
	input we_a, we_b, clk_a, clk_b,
	output reg [7:0] q_a, q_b
);

reg [7:0] ram[0:65535];

always @ (posedge clk_a) begin
	if (we_a) begin
		ram[addr_a] <= data_a;
		q_a <= data_a;
	end else
		q_a <= ram[addr_a];
end

always @ (posedge clk_b) begin
	if (we_b) begin
		ram[addr_b] <= data_b;
		q_b <= data_b;
	end else
		q_b <= ram[addr_b];
end

endmodule
