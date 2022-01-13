module generate_for (
    input a,
    input b,
    output sum,
    output cout
);
    assign sum  = a ^ b;
    assign cout = a & b;

endmodule

// top
module my_design #(
    parameter N = 4
)(
    input  [N-1:0] a,
    input  [N-1:0] b,
    output [N-1:0] sum,
    output [N-1:0] cout
);
    genvar i;

    // Generate for loop to instantiate N times
    generate
        for (i = 0; i < N; i = i + 1 ) begin:test
            generate_for u0(
                .a(a[i]),
                .b(b[i]),
                .sum(sum[i]),
                .cout(cout[i])
            );
        end
    endgenerate

endmodule

/*
a=0x0 b=0x0 sum=0x0 cout=0x0
a=0x2 b=0x3 sum=0x1 cout=0x2
a=0x2 b=0x0 sum=0x2 cout=0x0
a=0x1 b=0x0 sum=0x1 cout=0x0
           V C S   S i m u l a t i o n   R e p o r t
*/
