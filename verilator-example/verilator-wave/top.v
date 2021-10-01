module top (
   input  wire       clk,
   input  wire       reset_l,
   output reg [31:0] count
);

counter counter(/*AUTOINST*/
                // Outputs
                .count                  (count),
                // Inputs
                .clk                    (clk),
                .reset_l                (reset_l));

// testbench
initial begin
    $display("[%0t] Tracing to testbench.vcd...\n", $time);
    $dumpfile("testbench.vcd");
    $dumpvars(0, top);
    $display("[%0t] Model running...\n", $time);
end

endmodule
