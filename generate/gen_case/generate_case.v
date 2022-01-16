// Design #1: Half adder
module ha (
    input a, b,
    output reg sum, cout
);

    always @(a or b)
        {cout, sum} = a + b;

    initial begin
        $display("Half adder instantiation");
    end

endmodule


// Design #2: Full adder
module fa (
    input a, b, cin,
    output reg sum, cout
);
    always @(a or b or cin)
        {cout, sum} = a + b + cin;

    initial begin
        $display("Full adder instantiation");
    end
endmodule


// Top Design
module generate_case (
    input a, b, cin,
    output sum,cout
);

parameter ADDER_TYPE = 1;    
    generate
        case(ADDER_TYPE)
            0 : ha u0 (.a(a), .b(b), .sum(sum), .cout(cout));
            1 : fa u1 (.a(a), .b(b), .sum(sum), .cin(cin), .cout(cout));
        endcase
    endgenerate

endmodule
