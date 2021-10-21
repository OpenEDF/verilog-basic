module regs_test;
	
parameter CR1 = 3'h2, CR2 = 3'h1;

reg [31:0] test_regs;

initial begin
	test_regs[CR1*8+:8] = 8'h55;
	test_regs[CR2*8+:8] = 8'h11;
	$display("%b", test_regs);
end 
endmodule
