/* register data access */
module reg_accrss;

reg [31:0] ADDR;
reg [2:0] ADDR1;
reg [15:0] ADDR2;

/* access range */
initial begin
	ADDR = 32'h11223344;
	ADDR1 = ADDR[2:0];
	ADDR2 = ADDR[31:16];
	$display("ADDR  = %b", ADDR);
	$display("ADDR1 = %b", ADDR1);
	$display("ADDR2 = %b", ADDR2);
	$display("ADDR1 = %h", ADDR1);
	$display("ADDR2 = %h", ADDR2);
end

endmodule
/*
ADDR  = 00010001001000100011001101000100
ADDR1 = 100
ADDR2 = 0001000100100010
ADDR1 = 4
ADDR2 = 1122
*/
