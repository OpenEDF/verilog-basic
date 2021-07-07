module encode_74ls148(
    input I7, I6, I5, I4, I3, I2, I1, I0,
    input EI,
    output A0, A1, A2,
    output reg GS, EO
);

wire [7:0] v;
reg [2:0] y;
integer i;

assign v = {I7, I6, I5, I4, I3, I2, I1, I0};

always @ (*) begin
    if (EI) begin
        y = 3'b111;
        GS = 1'b1;
        EO = 1'b1;
    end
    else begin
        if (&v) begin
            y = 3'b111;
            GS = 1'b1;
            EO = 1'b0;
        end
        else begin
            GS = 1'b0;
            EO = 1'b1;
            for (i = 0; i <= 7; i = i + 1) begin
                if (v[i] == 0)
                    y = ~i; 
            end
        end
    end
end

assign A0 = y[0];
assign A1 = y[1];
assign A2 = y[2];
    
endmodule
