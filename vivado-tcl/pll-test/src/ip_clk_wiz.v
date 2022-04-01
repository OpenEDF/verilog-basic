// pll clock by create ip
module ip_clk_wiz (
    // input port
    input wire sys_clk,
    input wire sys_rst_n,
    
    // output port
    output wire clk_16mhz,
    output wire clk_25mhz
);

wire locked;

// MMCM/PLL create-ip
mmcm u0(
    .resetn(sys_rst_n),
    .locked(locked),
    .clk_in1(sys_clk),

    .clk_out1(clk_16mhz),
    .clk_out2(clk_25mhz)
);

endmodule
