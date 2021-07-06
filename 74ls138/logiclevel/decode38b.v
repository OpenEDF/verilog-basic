module decode38_b (
    input wire [2:0] A, 
    output reg [7:0] Y
);

integer i;
always @ (*) begin
	for (i = 0; i <= 7; i = i + 1) begin
    	if (A == i)
        	Y[i] = 1;
        else
            Y[i] = 0;
	end
end
endmodule
