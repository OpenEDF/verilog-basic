`timescale 1ns/1ps

/* testbench */
module stimulus;		// no any input and output

/* set the variable */
reg add_a;
reg add_b;
wire cout;
wire sum;

/* instantiate the unit under test */
halfadder uut(.a(add_a), .b(add_b), .c(cout), .s(sum));

/* initialize input */
initial begin
	/* support gtkwave */
	$dumpfile("test.vcd");
	$dumpvars(0, stimulus);
		
    add_a = 0; add_b = 0;
    #10 add_a = 0; add_b = 0;
	#10 add_a = 0; add_b = 1;
	#10 add_a = 1; add_b = 0;
	#10 add_a = 1; add_b = 1;
	$finish;
end

/* display the result */
initial begin
	$monitor("a = %d, b = %d, cout = %d, sum = %d \n", add_a, add_b, cout, sum);
end
endmodule
