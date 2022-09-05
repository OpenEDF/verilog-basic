module testbench;

parameter N = 2;

reg [N-1:0] a, b;
wire [N-1:0] sum, cout;

my_design #(.N(N)) md(
    .a(a),
    .b(b),
    .sum(sum),
    .cout(cout));

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, testbench);

    a <= 0;
    b <= 0;

    $monitor("a=0x%0h b=0x%0h sum=0x%0h cout=0x%0h", a, b, sum, cout);

    #10 a = 'h2;
        b = 'h3;
    #20 b = 'h4;
    #10 a = 'h5;
end

endmodule
