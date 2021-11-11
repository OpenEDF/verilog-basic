// two elem for { }
module two_elem;

reg [2:0] a_in;
reg b_in;

initial begin
	{b_in, a_in} = 3'b011 + 3'b001;
	#10 {b_in, a_in} = 3'b110 + 3'b001;
	#10 {b_in, a_in} = 3'b110 + 3'b000;
	#10 {b_in, a_in} = 3'b110 + 3'b011;
end

initial begin
	$monitor("a_in = %b, b_in = %b", a_in, b_in);
end

endmodule
/* run result
a_in = 100, b_in = 0
a_in = 111, b_in = 0
a_in = 110, b_in = 0
a_in = 001, b_in = 1
*/
