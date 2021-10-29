//-------------------------------------------------------------------------
// bin to gray convert
module bin_gray (
    // Inputs
    input clk,
    input rst_n,
    input en,

    // Outputs
    output reg [7:0] gray_out
);

// register temp
reg [7:0] cnt;

// counter 
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin 
        cnt <= 8'b0000_0000;
    end else if (en) begin
        cnt <= cnt + 1;
    end else begin
        cnt <= cnt;
    end
end        

// bin to gray
always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
       gray_out <= 8'b0000_0000;
    else 
       gray_out <= cnt ^ (cnt >> 1);
end        

endmodule

//-------------------------------------------------------------------------
