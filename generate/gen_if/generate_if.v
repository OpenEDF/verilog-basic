// generate if 
module generate_if (
    input a,
    input b,
    input sel,
    output out
);

parameter USE_CASE = 0;

generate 
    if (USE_CASE)
        mux_case mc (.a(a), .b(b), .sel(sel), .out(out));
    else
        mux_assign ma (.a(a), .b(b), .sel(sel), .out(out));
endgenerate

endmodule
