/* subtracter login */
module suba (
    input a, b, ci,
    output reg d, co
);

always @(*) begin
    begin 
        d = a ^ b ^ ci;
        co = (~a & b) | (~a ^ b) & ci;
    end
end    
endmodule

/* subtracter behavier */
module subb(
    input a, b, ci,
    output reg d, co
);

always @(*) begin
    begin 
        {co, d} = a - b - ci;
    end
end

endmodule


/* subtracter verilog */
module subtracterN #(
    parameter N = 8
) (
    input wire [N-1:0] a,
    input wire [N-1:0] b,
    output reg [N-1:0] y
);

always @(*) begin
    y = a - b;
end
    
endmodule
