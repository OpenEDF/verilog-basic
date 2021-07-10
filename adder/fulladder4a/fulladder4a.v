/* 4bit full adder */
module fulladder4a (
    input [3:0] a,
    input [3:0] b,
    input ci,
    output [3:0] so,
    output co
);

/* temp */
wire ci1, ci2, ci3;
fulladder F0 (
    .a(a[0]),
    .b(b[0]),
    .ci(ci),
    .so(so[0]),
    .co(ci1)
    );

fulladder F1 (
    .a(a[1]),
    .b(b[1]),
    .ci(ci1),
    .so(so[1]),
    .co(ci2)
    );

fulladder F2 (
    .a(a[2]),
    .b(b[2]),
    .ci(ci2),
    .so(so[2]),
    .co(ci3)
    );

fulladder F3 (
    .a(a[3]),
    .b(b[3]),
    .ci(ci3),
    .so(so[3]),
    .co(co)
    );

endmodule
