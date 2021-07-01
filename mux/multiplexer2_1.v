module multiplexer2_1 (
    input a,
    input b,
    input s,
    output y);

    wire a, b, s;
    wire y;

    assign y = (~s & a) | (s & b);
endmodule
