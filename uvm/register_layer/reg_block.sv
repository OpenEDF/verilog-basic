// RTL representation
module reg_block ();
    wire [31:0] reg_ctl;
    reg clk;

    // Delare reg variables to store register field  values.
    reg       ctl_en;
    reg [2:0] ctl_mode;
    reg       ctl_halt;
    reg       ctl_auto;
    reg [4:0] ctl_speed;

    assign reg_ctl = {16'b0, ctl_speed, 5'b0, ctl_auto, ctl_halt, ctl_mode, ctl_en};

    always @ (posedge clk) begin
        ctl_en    <= 1'b1;
        ctl_mode  <= 3'b101;
        ctl_halt  <= 1'b1;
        ctl_auto  <= 1'b0;
        ctl_speed <= 5'b11111;
    end

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        #10
        $display("The register mode reg_ctl = 0x%8h.", reg_ctl);
        #10
        $finish;
    end
endmodule


// The register mode reg_ctl = 0x0000f81b.
