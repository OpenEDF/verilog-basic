`timescale 1ns/1ps

module testbench ();
    
reg [2:0] IN;
wire [7:0] OUT;

decode38_b test_unit(
    .A(IN),
    .Y(OUT)
);

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, testbench);

    /* enable MUX outbut */
    IN = 3'bxxx;
    #100 IN = 3'b000;
    #100 IN = 3'b001;
    #100 IN = 3'b010;
    #100 IN = 3'b011;
    #100 IN = 3'b100;
    #100 IN = 3'b101;
    #100 IN = 3'b110;
    #100 IN = 3'b111;
    #200
    $finish;
end

initial begin
    $monitor("IN = %3b  OUTB = %8b  OUT = %d \n", IN, OUT, OUT);
end

endmodule
