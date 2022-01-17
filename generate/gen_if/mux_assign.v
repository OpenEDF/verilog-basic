// mux_assign 
module mux_assign (
    input a,
    input b,
    input sel,
    output out
);

assign out = sel ? a : b;

initial begin
    $display("mux_assign is instantiated");
end

endmodule
