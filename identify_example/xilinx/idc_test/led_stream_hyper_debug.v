// available hyper connections - for debug and ip models
// timestamp: 1691195877


`ifndef SYN_HYPER_CONNECT
`define SYN_HYPER_CONNECT 1
module syn_hyper_connect(out) /* synthesis syn_black_box=1 syn_noprune=1 */;
parameter w = 1;
parameter tag = "xxx";
parameter dflt = 0;
parameter mustconnect = 1'b1;
output [w-1:0] out;
endmodule
`endif

module led_stream_hyper_debug(dummy);
input dummy; /* avoid compiler error for no ports */

wire [7:0] led_0;
syn_hyper_connect led_connect_0(led_0);
defparam led_connect_0.w = 8;
defparam led_connect_0.tag = "led";


wire clk_0;
syn_hyper_connect clk_connect_0(clk_0);
defparam clk_connect_0.tag = "clk";


wire rst_n_0;
syn_hyper_connect rst_n_connect_0(rst_n_0);
defparam rst_n_connect_0.tag = "rst_n";


wire [31:0] cnt_0;
syn_hyper_connect cnt_connect_0(cnt_0);
defparam cnt_connect_0.w = 32;
defparam cnt_connect_0.tag = "cnt";


wire [2:0] led_on_number_0;
syn_hyper_connect led_on_number_connect_0(led_on_number_0);
defparam led_on_number_connect_0.w = 3;
defparam led_on_number_connect_0.tag = "led_on_number";


wire Identify_IICE_trigger_ext_0;
syn_hyper_connect Identify_IICE_trigger_ext_connect_0(Identify_IICE_trigger_ext_0);
defparam Identify_IICE_trigger_ext_connect_0.tag = "ident_coreinst.IICE_INST.Identify_IICE_trigger_ext";


wire identify_sampler_ready_0;
syn_hyper_connect identify_sampler_ready_connect_0(identify_sampler_ready_0);
defparam identify_sampler_ready_connect_0.tag = "ident_coreinst.IICE_INST.b3_SoW.identify_sampler_ready";

endmodule
