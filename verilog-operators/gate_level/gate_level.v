// Gate level test xor and or 
module gate_level(
    input a,
    input b,
    output out
);

xor inst1 (out, a, b);

endmodule
