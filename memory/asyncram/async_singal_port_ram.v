/* asynchronous Memory */
module async_signle_port_ram (
    input  [7:0]  data,
    input  [15:0] addr,
    input  write, clk,
    output [7:0] Q
);

reg [7:0] ram[0:65535];

always @(posedge clk) begin
    if (write)
        ram[addr] <= data;
end

assign Q = ram[addr];

endmodule
