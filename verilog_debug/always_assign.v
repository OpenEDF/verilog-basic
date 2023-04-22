// top and test
module always_assign();

wire a, b, c;
reg  e;
reg out_reg;
wire out_wire;
assign a = b | c;    
assign a = b ? 1'b0 : 1'b1;

// assign in always@(*), wire outpot is l-value 
always @(*) begin
    a = b | c;    
end

// assign in always@(*)
always @(*) begin
    assign a = b | c;    
end

// assign in always@(*)
always @(*) begin
    e = b | c;    
end

always @(*) begin
    out_reg = (a == 1'b1) ? b : 1'b0;  // Assign b or 0 to reg out_reg
    out_wire = (a == 1'b1) ? 1'b0 : b;  // Assign 0 or b to wire out_wire
end

always @(*) begin
    if (b == 1'b1) begin
        assign a = b;
    end else begin
        assign a = c;
    end
end

// e is reg
always @(*) begin
    if (b == 1'b1) begin
        e = b;
    end else begin
        e = c;
    end
end

endmodule
