`timescale  1ns/1ps
module testbench;

reg mux_a;
reg mux_b;
reg mux_s;
wire mux_y;

multiplexer2_1 testuut(
    .a(mux_a),
    .b(mux_b),
    .s(mux_s),
    .y(mux_y));

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, testbench);

    mux_a = 1; mux_b = 0; 
    #10 mux_s = 0;
    #10 mux_s = 1;
    $finish;
end

initial begin
    $monitor("a = %d, b = %d, s = %d, y = %d \n", mux_a, mux_b, mux_s, mux_y);
end
 
endmodule
