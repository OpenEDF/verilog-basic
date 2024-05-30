// control pins:
// input: reset_n     - active low reset
// input: clk	      - master clock input

// input port pins:
// input: frame_n     - must be active during whole input packet
// input: valid_n     - valid data input
// input: din	      - the data input

// output port pins:
// output: dout	      - the data output
// output: valido_n   - tells output device that "dout" contain valid data
// output: frameo_n   - active during the whole output packet
// frame format:
//
// Frame start must look like this:
//
// frame_n:  |  1 |  0 |  0 |  0 |  0 |  0 |  0 |  0 |  0 |  0  | ...
// din:      |  X | A0 | A1 | A2 | A3 |  1 |  1 |  1 |  1 | D0  | ...
// valid_n:  |  X |  X |  X |  X |  X |  1 |  1 |  1 |  1 |  0  | ...
//
// note1: frame_n must deasserted at least one cycle between packets.
// note2: frame_n must be deasserted with the last valid din bit in the frame.

module router(input logic clk, reset_n, router_io.dut io, host_io.dut host);

parameter host_reg_base_address       = 'h1000;
parameter counter_base_address        = 'h2000;
parameter register_file_base_address  = 'h3000;
parameter ram_base_address            = 'h4000;

logic [15:0] din_reg, frame_reg, valid_reg;

wire [15:0] request0_n, request1_n, request2_n, request3_n, request4_n, request5_n, request6_n, request7_n, request8_n, request9_n, request10_n, request11_n, request12_n, request13_n, request14_n, request15_n;

wire [15:0] grant0_n, grant1_n, grant2_n, grant3_n, grant4_n, grant5_n, grant6_n, grant7_n, grant8_n, grant9_n, grant10_n, grant11_n, grant12_n, grant13_n, grant14_n, grant15_n;


wire [15:0] request_n[16], grant_n[16];

wire [3:0] ip_src_op[16];

wire [15:0] deassert, frameo_int;

logic        enable;
logic [15:0] data_out;
logic [15:0] lock;
logic [15:0] read2clear;
logic [15:0] host_reg['h100];
logic [15:0] counters['h20];
logic [15:0] ram['h1000];

logic [15:0] frame_n_previous, frameo_n_previous;
wire  [15:0] framei_complete, frameo_complete;

const logic [7:0] rev_id = 8'h03;
const logic [7:0] chip_id = 8'h5a;
const logic [15:0] host_id = { chip_id, rev_id };

assign framei_complete = ~frame_n_previous & io.frame_n;
assign frameo_complete = ~frameo_n_previous & io.frameo_n;

assign host.data = (!host.rd_n && enable)? data_out:'z;

//always_ff @(posedge io.clk) begin
always_ff @(posedge clk) begin
  frame_n_previous  <= io.frame_n;
  frameo_n_previous <= io.frameo_n;
end

//always_ff @(posedge io.clk or negedge reset_n) begin
always_ff @(posedge clk or negedge reset_n) begin
  if (!reset_n) begin
    for (int i=0; i<$size(counters); i++) begin
      counters[i] <= '0;
    end
  end
  else begin
    if (!host.rd_n && (host.address inside {['h2000:'h201f]})) begin
      counters[(host.address - counter_base_address) & 'h001f] <= 0;
    end else begin
      for (int i=0; i<16; i++) begin
        if (framei_complete[i]) counters[i] <= counters[i] + 1;
      end
      for (int i=0; i<16; i++) begin
        if (frameo_complete[i]) counters['h10 + i] <= counters['h10 + i] + 1;
      end
    end
  end
end

always_ff @(posedge clk or negedge reset_n) begin
  if (!reset_n) begin
// Need to be '1 for RAL lab
    lock       <= '0;
    read2clear <= '1;
    foreach (host_reg[i])
      host_reg[i] <= '0;
  end else begin
    if (!host.wr_n) begin
      casex(host.address)
        'h0100: lock <= ~host.data & lock;
        'h10??: host_reg[host.address - host_reg_base_address] <= host.data;
        'h4???: ram[host.address - ram_base_address] <= host.data;
      endcase
    end
    if (!host.rd_n & (host.address == 'h0101)) begin
      read2clear <= '0;
    end else begin
      read2clear <= read2clear + 1;
    end
  end
end

always_comb begin
  if (!host.rd_n) begin
    enable = 0;
    case(host.address) inside
      'h0000:         begin data_out = host_id; enable = 1; end
      'h0100:         begin data_out = lock; enable = 1; end
      'h0101:         begin data_out = read2clear; enable = 1; end
      'h10??:         begin data_out = host_reg[(host.address - host_reg_base_address) & 'h00ff]; enable = 1; end
      'h200?, 'h201?: begin data_out = counters[(host.address - counter_base_address) & 'h001f]; enable = 1; end
      'h4???:         begin data_out = ram[host.address - ram_base_address]; enable = 1; end
    endcase
  end
end



iport #(.port_number(0)) ip0(clk, reset_n, io.din, io.frame_n, lock, grant_n, request0_n, io.busy_n[0]);
iport #(.port_number(1)) ip1(clk, reset_n, io.din, io.frame_n, lock, grant_n, request1_n, io.busy_n[1]);
iport #(.port_number(2)) ip2(clk, reset_n, io.din, io.frame_n, lock, grant_n, request2_n, io.busy_n[2]);
iport #(.port_number(3)) ip3(clk, reset_n, io.din, io.frame_n, lock, grant_n, request3_n, io.busy_n[3]);
iport #(.port_number(4)) ip4(clk, reset_n, io.din, io.frame_n, lock, grant_n, request4_n, io.busy_n[4]);
iport #(.port_number(5)) ip5(clk, reset_n, io.din, io.frame_n, lock, grant_n, request5_n, io.busy_n[5]);
iport #(.port_number(6)) ip6(clk, reset_n, io.din, io.frame_n, lock, grant_n, request6_n, io.busy_n[6]);
iport #(.port_number(7)) ip7(clk, reset_n, io.din, io.frame_n, lock, grant_n, request7_n, io.busy_n[7]);
iport #(.port_number(8)) ip8(clk, reset_n, io.din, io.frame_n, lock, grant_n, request8_n, io.busy_n[8]);
iport #(.port_number(9)) ip9(clk, reset_n, io.din, io.frame_n, lock, grant_n, request9_n, io.busy_n[9]);
iport #(.port_number(10)) ip10(clk, reset_n, io.din, io.frame_n, lock, grant_n, request10_n, io.busy_n[10]);
iport #(.port_number(11)) ip11(clk, reset_n, io.din, io.frame_n, lock, grant_n, request11_n, io.busy_n[11]);
iport #(.port_number(12)) ip12(clk, reset_n, io.din, io.frame_n, lock, grant_n, request12_n, io.busy_n[12]);
iport #(.port_number(13)) ip13(clk, reset_n, io.din, io.frame_n, lock, grant_n, request13_n, io.busy_n[13]);
iport #(.port_number(14)) ip14(clk, reset_n, io.din, io.frame_n, lock, grant_n, request14_n, io.busy_n[14]);
iport #(.port_number(15)) ip15(clk, reset_n, io.din, io.frame_n, lock, grant_n, request15_n, io.busy_n[15]);

oport #(.port_number(0)) op0(clk, reset_n, request_n, lock, frameo_int, grant0_n, ip_src_op[0], deassert[0]);
oport #(.port_number(1)) op1(clk, reset_n, request_n, lock, frameo_int, grant1_n, ip_src_op[1], deassert[1]);
oport #(.port_number(2)) op2(clk, reset_n, request_n, lock, frameo_int, grant2_n, ip_src_op[2], deassert[2]);
oport #(.port_number(3)) op3(clk, reset_n, request_n, lock, frameo_int, grant3_n, ip_src_op[3], deassert[3]);
oport #(.port_number(4)) op4(clk, reset_n, request_n, lock, frameo_int, grant4_n, ip_src_op[4], deassert[4]);
oport #(.port_number(5)) op5(clk, reset_n, request_n, lock, frameo_int, grant5_n, ip_src_op[5], deassert[5]);
oport #(.port_number(6)) op6(clk, reset_n, request_n, lock, frameo_int, grant6_n, ip_src_op[6], deassert[6]);
oport #(.port_number(7)) op7(clk, reset_n, request_n, lock, frameo_int, grant7_n, ip_src_op[7], deassert[7]);
oport #(.port_number(8)) op8(clk, reset_n, request_n, lock, frameo_int, grant8_n, ip_src_op[8], deassert[8]);
oport #(.port_number(9)) op9(clk, reset_n, request_n, lock, frameo_int, grant9_n, ip_src_op[9], deassert[9]);
oport #(.port_number(10)) op10(clk, reset_n, request_n, lock, frameo_int, grant10_n, ip_src_op[10], deassert[10]);
oport #(.port_number(11)) op11(clk, reset_n, request_n, lock, frameo_int, grant11_n, ip_src_op[11], deassert[11]);
oport #(.port_number(12)) op12(clk, reset_n, request_n, lock, frameo_int, grant12_n, ip_src_op[12], deassert[12]);
oport #(.port_number(13)) op13(clk, reset_n, request_n, lock, frameo_int, grant13_n, ip_src_op[13], deassert[13]);
oport #(.port_number(14)) op14(clk, reset_n, request_n, lock, frameo_int, grant14_n, ip_src_op[14], deassert[14]);
oport #(.port_number(15)) op15(clk, reset_n, request_n, lock, frameo_int, grant15_n, ip_src_op[15], deassert[15]);

assign frameo_int[0] = frame_reg[ip_src_op[0]];
assign frameo_int[1] = frame_reg[ip_src_op[1]];
assign frameo_int[2] = frame_reg[ip_src_op[2]];
assign frameo_int[3] = frame_reg[ip_src_op[3]];
assign frameo_int[4] = frame_reg[ip_src_op[4]];
assign frameo_int[5] = frame_reg[ip_src_op[5]];
assign frameo_int[6] = frame_reg[ip_src_op[6]];
assign frameo_int[7] = frame_reg[ip_src_op[7]];
assign frameo_int[8] = frame_reg[ip_src_op[8]];
assign frameo_int[9] = frame_reg[ip_src_op[9]];
assign frameo_int[10] = frame_reg[ip_src_op[10]];
assign frameo_int[11] = frame_reg[ip_src_op[11]];
assign frameo_int[12] = frame_reg[ip_src_op[12]];
assign frameo_int[13] = frame_reg[ip_src_op[13]];
assign frameo_int[14] = frame_reg[ip_src_op[14]];
assign frameo_int[15] = frame_reg[ip_src_op[15]];

assign io.frameo_n = frameo_int | deassert;

assign io.valido_n[0] = valid_reg[ip_src_op[0]] | deassert[0];
assign io.valido_n[1] = valid_reg[ip_src_op[1]] | deassert[1];
assign io.valido_n[2] = valid_reg[ip_src_op[2]] | deassert[2];
assign io.valido_n[3] = valid_reg[ip_src_op[3]] | deassert[3];
assign io.valido_n[4] = valid_reg[ip_src_op[4]] | deassert[4];
assign io.valido_n[5] = valid_reg[ip_src_op[5]] | deassert[5];
assign io.valido_n[6] = valid_reg[ip_src_op[6]] | deassert[6];
assign io.valido_n[7] = valid_reg[ip_src_op[7]] | deassert[7];
assign io.valido_n[8] = valid_reg[ip_src_op[8]] | deassert[8];
assign io.valido_n[9] = valid_reg[ip_src_op[9]] | deassert[9];
assign io.valido_n[10] = valid_reg[ip_src_op[10]] | deassert[10];
assign io.valido_n[11] = valid_reg[ip_src_op[11]] | deassert[11];
assign io.valido_n[12] = valid_reg[ip_src_op[12]] | deassert[12];
assign io.valido_n[13] = valid_reg[ip_src_op[13]] | deassert[13];
assign io.valido_n[14] = valid_reg[ip_src_op[14]] | deassert[14];
assign io.valido_n[15] = valid_reg[ip_src_op[15]] | deassert[15];

assign io.dout[0] = (din_reg[ip_src_op[0]] | valid_reg[ip_src_op[0]] | deassert[0]);
assign io.dout[1] = (din_reg[ip_src_op[1]] | valid_reg[ip_src_op[1]] | deassert[1]);
assign io.dout[2] = (din_reg[ip_src_op[2]] | valid_reg[ip_src_op[2]] | deassert[2]);
assign io.dout[3] = (din_reg[ip_src_op[3]] | valid_reg[ip_src_op[3]] | deassert[3]);
assign io.dout[4] = (din_reg[ip_src_op[4]] | valid_reg[ip_src_op[4]] | deassert[4]);
assign io.dout[5] = (din_reg[ip_src_op[5]] | valid_reg[ip_src_op[5]] | deassert[5]);
assign io.dout[6] = (din_reg[ip_src_op[6]] | valid_reg[ip_src_op[6]] | deassert[6]);
assign io.dout[7] = (din_reg[ip_src_op[7]] | valid_reg[ip_src_op[7]] | deassert[7]);
assign io.dout[8] = (din_reg[ip_src_op[8]] | valid_reg[ip_src_op[8]] | deassert[8]);
assign io.dout[9] = (din_reg[ip_src_op[9]] | valid_reg[ip_src_op[9]] | deassert[9]);
assign io.dout[10] = (din_reg[ip_src_op[10]] | valid_reg[ip_src_op[10]] | deassert[10]);
assign io.dout[11] = (din_reg[ip_src_op[11]] | valid_reg[ip_src_op[11]] | deassert[11]);
assign io.dout[12] = (din_reg[ip_src_op[12]] | valid_reg[ip_src_op[12]] | deassert[12]);
assign io.dout[13] = (din_reg[ip_src_op[13]] | valid_reg[ip_src_op[13]] | deassert[13]);
assign io.dout[14] = (din_reg[ip_src_op[14]] | valid_reg[ip_src_op[14]] | deassert[14]);
assign io.dout[15] = (din_reg[ip_src_op[15]] | valid_reg[ip_src_op[15]] | deassert[15]);

assign grant_n[0] = {grant15_n[0], grant14_n[0], grant13_n[0], grant12_n[0], grant11_n[0], grant10_n[0], grant9_n[0], grant8_n[0], grant7_n[0], grant6_n[0], grant5_n[0], grant4_n[0], grant3_n[0], grant2_n[0], grant1_n[0], grant0_n[0]}; 
assign grant_n[1] = {grant15_n[1], grant14_n[1], grant13_n[1], grant12_n[1], grant11_n[1], grant10_n[1], grant9_n[1], grant8_n[1], grant7_n[1], grant6_n[1], grant5_n[1], grant4_n[1], grant3_n[1], grant2_n[1], grant1_n[1], grant0_n[1]}; 
assign grant_n[2] = {grant15_n[2], grant14_n[2], grant13_n[2], grant12_n[2], grant11_n[2], grant10_n[2], grant9_n[2], grant8_n[2], grant7_n[2], grant6_n[2], grant5_n[2], grant4_n[2], grant3_n[2], grant2_n[2], grant1_n[2], grant0_n[2]}; 
assign grant_n[3] = {grant15_n[3], grant14_n[3], grant13_n[3], grant12_n[3], grant11_n[3], grant10_n[3], grant9_n[3], grant8_n[3], grant7_n[3], grant6_n[3], grant5_n[3], grant4_n[3], grant3_n[3], grant2_n[3], grant1_n[3], grant0_n[3]}; 
assign grant_n[4] = {grant15_n[4], grant14_n[4], grant13_n[4], grant12_n[4], grant11_n[4], grant10_n[4], grant9_n[4], grant8_n[4], grant7_n[4], grant6_n[4], grant5_n[4], grant4_n[4], grant3_n[4], grant2_n[4], grant1_n[4], grant0_n[4]}; 
assign grant_n[5] = {grant15_n[5], grant14_n[5], grant13_n[5], grant12_n[5], grant11_n[5], grant10_n[5], grant9_n[5], grant8_n[5], grant7_n[5], grant6_n[5], grant5_n[5], grant4_n[5], grant3_n[5], grant2_n[5], grant1_n[5], grant0_n[5]}; 
assign grant_n[6] = {grant15_n[6], grant14_n[6], grant13_n[6], grant12_n[6], grant11_n[6], grant10_n[6], grant9_n[6], grant8_n[6], grant7_n[6], grant6_n[6], grant5_n[6], grant4_n[6], grant3_n[6], grant2_n[6], grant1_n[6], grant0_n[6]}; 
assign grant_n[7] = {grant15_n[7], grant14_n[7], grant13_n[7], grant12_n[7], grant11_n[7], grant10_n[7], grant9_n[7], grant8_n[7], grant7_n[7], grant6_n[7], grant5_n[7], grant4_n[7], grant3_n[7], grant2_n[7], grant1_n[7], grant0_n[7]}; 
assign grant_n[8] = {grant15_n[8], grant14_n[8], grant13_n[8], grant12_n[8], grant11_n[8], grant10_n[8], grant9_n[8], grant8_n[8], grant7_n[8], grant6_n[8], grant5_n[8], grant4_n[8], grant3_n[8], grant2_n[8], grant1_n[8], grant0_n[8]}; 
assign grant_n[9] = {grant15_n[9], grant14_n[9], grant13_n[9], grant12_n[9], grant11_n[9], grant10_n[9], grant9_n[9], grant8_n[9], grant7_n[9], grant6_n[9], grant5_n[9], grant4_n[9], grant3_n[9], grant2_n[9], grant1_n[9], grant0_n[9]}; 
assign grant_n[10] = {grant15_n[10], grant14_n[10], grant13_n[10], grant12_n[10], grant11_n[10], grant10_n[10], grant9_n[10], grant8_n[10], grant7_n[10], grant6_n[10], grant5_n[10], grant4_n[10], grant3_n[10], grant2_n[10], grant1_n[10], grant0_n[10]}; 
assign grant_n[11] = {grant15_n[11], grant14_n[11], grant13_n[11], grant12_n[11], grant11_n[11], grant10_n[11], grant9_n[11], grant8_n[11], grant7_n[11], grant6_n[11], grant5_n[11], grant4_n[11], grant3_n[11], grant2_n[11], grant1_n[11], grant0_n[11]}; 
assign grant_n[12] = {grant15_n[12], grant14_n[12], grant13_n[12], grant12_n[12], grant11_n[12], grant10_n[12], grant9_n[12], grant8_n[12], grant7_n[12], grant6_n[12], grant5_n[12], grant4_n[12], grant3_n[12], grant2_n[12], grant1_n[12], grant0_n[12]}; 
assign grant_n[13] = {grant15_n[13], grant14_n[13], grant13_n[13], grant12_n[13], grant11_n[13], grant10_n[13], grant9_n[13], grant8_n[13], grant7_n[13], grant6_n[13], grant5_n[13], grant4_n[13], grant3_n[13], grant2_n[13], grant1_n[13], grant0_n[13]}; 
assign grant_n[14] = {grant15_n[14], grant14_n[14], grant13_n[14], grant12_n[14], grant11_n[14], grant10_n[14], grant9_n[14], grant8_n[14], grant7_n[14], grant6_n[14], grant5_n[14], grant4_n[14], grant3_n[14], grant2_n[14], grant1_n[14], grant0_n[14]}; 
assign grant_n[15] = {grant15_n[15], grant14_n[15], grant13_n[15], grant12_n[15], grant11_n[15], grant10_n[15], grant9_n[15], grant8_n[15], grant7_n[15], grant6_n[15], grant5_n[15], grant4_n[15], grant3_n[15], grant2_n[15], grant1_n[15], grant0_n[15]}; 

assign request_n[0] = {request15_n[0], request14_n[0], request13_n[0], request12_n[0], request11_n[0], request10_n[0], request9_n[0], request8_n[0], request7_n[0], request6_n[0], request5_n[0], request4_n[0], request3_n[0], request2_n[0], request1_n[0], request0_n[0]}; 
assign request_n[1] = {request15_n[1], request14_n[1], request13_n[1], request12_n[1], request11_n[1], request10_n[1], request9_n[1], request8_n[1], request7_n[1], request6_n[1], request5_n[1], request4_n[1], request3_n[1], request2_n[1], request1_n[1], request0_n[1]}; 
assign request_n[2] = {request15_n[2], request14_n[2], request13_n[2], request12_n[2], request11_n[2], request10_n[2], request9_n[2], request8_n[2], request7_n[2], request6_n[2], request5_n[2], request4_n[2], request3_n[2], request2_n[2], request1_n[2], request0_n[2]}; 
assign request_n[3] = {request15_n[3], request14_n[3], request13_n[3], request12_n[3], request11_n[3], request10_n[3], request9_n[3], request8_n[3], request7_n[3], request6_n[3], request5_n[3], request4_n[3], request3_n[3], request2_n[3], request1_n[3], request0_n[3]}; 
assign request_n[4] = {request15_n[4], request14_n[4], request13_n[4], request12_n[4], request11_n[4], request10_n[4], request9_n[4], request8_n[4], request7_n[4], request6_n[4], request5_n[4], request4_n[4], request3_n[4], request2_n[4], request1_n[4], request0_n[4]}; 
assign request_n[5] = {request15_n[5], request14_n[5], request13_n[5], request12_n[5], request11_n[5], request10_n[5], request9_n[5], request8_n[5], request7_n[5], request6_n[5], request5_n[5], request4_n[5], request3_n[5], request2_n[5], request1_n[5], request0_n[5]}; 
assign request_n[6] = {request15_n[6], request14_n[6], request13_n[6], request12_n[6], request11_n[6], request10_n[6], request9_n[6], request8_n[6], request7_n[6], request6_n[6], request5_n[6], request4_n[6], request3_n[6], request2_n[6], request1_n[6], request0_n[6]}; 
assign request_n[7] = {request15_n[7], request14_n[7], request13_n[7], request12_n[7], request11_n[7], request10_n[7], request9_n[7], request8_n[7], request7_n[7], request6_n[7], request5_n[7], request4_n[7], request3_n[7], request2_n[7], request1_n[7], request0_n[7]}; 
assign request_n[8] = {request15_n[8], request14_n[8], request13_n[8], request12_n[8], request11_n[8], request10_n[8], request9_n[8], request8_n[8], request7_n[8], request6_n[8], request5_n[8], request4_n[8], request3_n[8], request2_n[8], request1_n[8], request0_n[8]}; 
assign request_n[9] = {request15_n[9], request14_n[9], request13_n[9], request12_n[9], request11_n[9], request10_n[9], request9_n[9], request8_n[9], request7_n[9], request6_n[9], request5_n[9], request4_n[9], request3_n[9], request2_n[9], request1_n[9], request0_n[9]}; 
assign request_n[10] = {request15_n[10], request14_n[10], request13_n[10], request12_n[10], request11_n[10], request10_n[10], request9_n[10], request8_n[10], request7_n[10], request6_n[10], request5_n[10], request4_n[10], request3_n[10], request2_n[10], request1_n[10], request0_n[10]}; 
assign request_n[11] = {request15_n[11], request14_n[11], request13_n[11], request12_n[11], request11_n[11], request10_n[11], request9_n[11], request8_n[11], request7_n[11], request6_n[11], request5_n[11], request4_n[11], request3_n[11], request2_n[11], request1_n[11], request0_n[11]}; 
assign request_n[12] = {request15_n[12], request14_n[12], request13_n[12], request12_n[12], request11_n[12], request10_n[12], request9_n[12], request8_n[12], request7_n[12], request6_n[12], request5_n[12], request4_n[12], request3_n[12], request2_n[12], request1_n[12], request0_n[12]}; 
assign request_n[13] = {request15_n[13], request14_n[13], request13_n[13], request12_n[13], request11_n[13], request10_n[13], request9_n[13], request8_n[13], request7_n[13], request6_n[13], request5_n[13], request4_n[13], request3_n[13], request2_n[13], request1_n[13], request0_n[13]}; 
assign request_n[14] = {request15_n[14], request14_n[14], request13_n[14], request12_n[14], request11_n[14], request10_n[14], request9_n[14], request8_n[14], request7_n[14], request6_n[14], request5_n[14], request4_n[14], request3_n[14], request2_n[14], request1_n[14], request0_n[14]}; 
assign request_n[15] = {request15_n[15], request14_n[15], request13_n[15], request12_n[15], request11_n[15], request10_n[15], request9_n[15], request8_n[15], request7_n[15], request6_n[15], request5_n[15], request4_n[15], request3_n[15], request2_n[15], request1_n[15], request0_n[15]}; 

always_ff @(posedge io.clk) begin
  din_reg <= io.din;
  frame_reg <= io.frame_n;
  valid_reg <= io.valid_n;
end

endmodule  //router

module iport(input logic clk, reset_n, input logic[15:0] din, frame_n, lock, grant_n[16], output logic[15:0] request_n, output logic busy_n);
parameter port_number = 0;

logic [3:0] state, nxt_state, oport_no, nxt_oport_no;
logic       busy_n_int;

always_ff @(posedge clk or negedge reset_n) begin
  if (!reset_n) begin
    state    <= 0;
    oport_no <= 0;
    busy_n   <= 1'b1;
  end
  else if (lock[port_number] == 0) begin
    state    <= nxt_state;
    oport_no <= nxt_oport_no;
    busy_n   <= busy_n_int;
  end
end

always_comb begin
  request_n = '1;
  nxt_state = state + 1;
  busy_n_int = 1'b1;
  nxt_oport_no = oport_no;
  unique case(state) inside
    [0:3]:   if (frame_n[port_number] == 1'b1) nxt_state = 0;
             else begin
               nxt_oport_no[state] = din[port_number];
             end
    [4:5]:   if ((frame_n[port_number] == 1'b1) || (din[port_number] == 1'b0)) nxt_state = 0;
    6:       if ((frame_n[port_number] == 1'b1) || (din[port_number] == 1'b0)) nxt_state = 0;
             else begin
               request_n[oport_no] = 1'b0;
             end
    7:       if ((frame_n[port_number] == 1'b1) || (din[port_number] == 1'b0)) nxt_state = 0;
             else if (grant_n[port_number][oport_no] == 1'b1) begin
               request_n[oport_no] = 1'b0;
               busy_n_int = 1'b0;
               nxt_state = state;
             end
    8:       begin
//               busy_n_int = 1'b0;
               if (frame_n[port_number] == 1'b1) begin
                 nxt_state = 0;
               end else begin
                 nxt_state = state;
               end
             end
    default: nxt_state = 0;
  endcase
end

endmodule  //iport

module oport(input logic clk, reset_n, input logic[15:0] request_n[16], input logic[15:0] lock, frame_n, output logic[15:0] grant_n, output logic[3:0] ip_src_op, output logic deassert);

parameter port_number = 0;

logic [3:0] port_last, nxt_port, port_no, nxt_ip_src_op;
logic [2:0] state, nxt_state;
logic       hit;

wire [15:0] request_int;

assign request_int = (request_n[port_number] >> (port_last+1)) | (request_n[port_number] << (16-(port_last+1)));

always_comb begin
  hit = 1'b1;
  port_no = 0;
  case(1'b0)
    request_int[0]:  port_no = 0;
    request_int[1]:  port_no = 1;
    request_int[2]:  port_no = 2;
    request_int[3]:  port_no = 3;
    request_int[4]:  port_no = 4;
    request_int[5]:  port_no = 5;
    request_int[6]:  port_no = 6;
    request_int[7]:  port_no = 7;
    request_int[8]:  port_no = 8;
    request_int[9]:  port_no = 9;
    request_int[10]:  port_no = 10;
    request_int[11]:  port_no = 11;
    request_int[12]:  port_no = 12;
    request_int[13]:  port_no = 13;
    request_int[14]:  port_no = 14;
    request_int[15]:  port_no = 15;
    default: hit = 1'b0;
  endcase
end

always_ff @(posedge clk or negedge reset_n) begin
  if (!reset_n) begin
    state     <= 1;
    port_last <= '1;
    ip_src_op <= 0;
  end
  else if (lock[port_number] == 0) begin
    state     <= nxt_state;
    port_last <= nxt_port;
    ip_src_op <= nxt_ip_src_op;
  end
end

always_comb begin
  nxt_state     = '0;
  nxt_port      = port_last;
  nxt_ip_src_op = ip_src_op;
  deassert      = 0;
  grant_n = '1;
    case(1'b1)
      state[0]: if (hit) begin
                  nxt_port        = port_no + port_last + 1;
                  nxt_state[1]    = 1;
                  nxt_ip_src_op   = nxt_port;
                  deassert        = 1;
                end
                else begin
                  nxt_state[0]    = 1;
                  deassert        = 1;
                end
      state[1]: begin
                  grant_n[port_last] = 1'b0;
                  nxt_state[2]       = 1;
                end
      state[2]: if (frame_n[port_number]) nxt_state[0] = 1;
                else nxt_state[2] = 1;
    endcase
end

endmodule  //oport
