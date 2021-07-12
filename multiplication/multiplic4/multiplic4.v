/* multiplic [3:0] bit */
module multiplic4 (
	input wire [3:0] a,
	input wire [3:0] b,
	output reg [7:0] p
);

reg [7:0] pv;
reg [7:0] ap;
integer i;

always @ (*) begin
	pv = 8'b00000000;
	ap = {4'b0000, a};

	for (i = 0; i < 4; i++) begin
		if (b[i] == 1) begin
			pv = pv + ap;
			ap = {ap[6:0], 1'b0}; /* left shift 1 bit */
		end
		else begin
			ap = {ap[6:0], 1'b0}; /* left shift 1 bit */
		end
	end
	p =pv;
end

endmodule
