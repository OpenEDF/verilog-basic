/* define the timescale */
`timescale 1ns/1ps

/* testbench */
module testbench();

reg [2:0] DS;
reg [7:0] DATA;
reg EN_n;
wire Y, W;

/* instantiation */
mux8_1 uut (
	.D0(DATA[0]),
	.D1(DATA[1]),
	.D2(DATA[2]),
	.D3(DATA[3]),
	.D4(DATA[4]),
	.D5(DATA[5]),
	.D6(DATA[6]),
	.D7(DATA[7]),
	.DS0(DS[0]),
	.DS1(DS[1]),
	.DS2(DS[2]),
	.G_n(EN_n),
	.Y(Y),
	.Y_n(W)
);

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, testbench);
	DATA = 8'b10010110;
    $display("INPUT DATA: %8b\n", DATA);

    /* enable MUX outbut */
        EN_n = 1'b1; DS = 3'bxxx;  
	#10 EN_n = 1'b0; DS = 3'b000;  
	#10 EN_n = 1'b0; DS = 3'b001;  
	#10 EN_n = 1'b0; DS = 3'b010;  
	#10 EN_n = 1'b0; DS = 3'b011;  
	#10 EN_n = 1'b0; DS = 3'b100;  
	#10 EN_n = 1'b0; DS = 3'b101;  
	#10 EN_n = 1'b0; DS = 3'b110;  
	#10 EN_n = 1'b0; DS = 3'b111; 
    #10	
    $finish;
end

initial begin
    $monitor("EN_n = %d  DS = %3b  Y = %d  W = %d\n", EN_n, DS,  Y, W);
end
    
endmodule
