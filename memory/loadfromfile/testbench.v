`timescale 1ns/1ps
module testbench ();

reg [7:0]data;
reg [7:0] addr;
reg w;
reg clk;
wire [7:0] outdata;

async_signle_port_ram uut (
    .data(data),
    .addr(addr),
    .write(w),
    .clk(clk),
    .Q(outdata)
);

/* generated clock */
initial begin
	clk = 0;
    forever #100 clk = ~clk;
end

/* load data form file to memory */
reg [7:0] mem[0:255];
initial begin 
	$readmemh("mem.data", mem);
end

integer i;
initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, testbench);

    #1000
    #200 w = 1;
	for (i = 0; i <= 255; i = i + 1) begin
        #200 addr = i; data = mem[i];
	end
    #200 w = 0;
    #2000
    $finish;
end

initial begin
    $monitor("W = %d  ADDR = %8b   DATA = %d\n", w, addr, data);
end

endmodule
