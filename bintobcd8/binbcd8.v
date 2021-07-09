module binbcd8 (
    input wire [7:0] b,
    output reg [9:0] p
);

/* temp */
reg [17:0] z;
integer i;

always @(*) begin
    for (i = 0; i <= 17; i = i + 1)
        z[i] = 0;
    z[10:3] = b;

    repeat(5) begin
        if (z[11:8] > 4)
            z[11:8] = z[11:8] + 3;

        if (z[15:12] > 4)
            z[15:12] = z[15:12] + 3;

        z[17:1] = z[16:0];
    end
    p = z[17:8];
end
    
endmodule
