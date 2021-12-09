//
// Verilog description for cell controller, 
// 01/07/14 00:04:50
//
// Precision RTL Synthesis, 2013a.9//


module controller ( load_s, load_b, load_f, load_pc, inc_pc, set_br, rslt_oeN, 
                    dout_oeN, dmem_rdN, dmem_wrN, halt, instruction, exception, 
                    zero_flag, branching, clk, rstN ) ;

    output load_s ;
    output load_b ;
    output load_f ;
    output load_pc ;
    output inc_pc ;
    output set_br ;
    output rslt_oeN ;
    output dout_oeN ;
    output dmem_rdN ;
    output dmem_wrN ;
    output halt ;
    input [3:0]instruction ;
    input exception ;
    input zero_flag ;
    input branching ;
    input clk ;
    input rstN ;

    wire [3:1]state;
    wire [3:0]instruction_int;
    wire exception_int, zero_flag_int, branching_int, clk_int, rstN_int, 
         load_s_dup_0, load_b_dup_0, dout_oeN_dup_0, dmem_wrN_dup_0, halt_dup_0, 
         load_f_dup_0, load_pc_dup_0, rslt_oeN_dup_0, dmem_rdN_dup_0, not_rstN, 
         nx28524z1, nx9700z1, nx59839z1, nx9700z2, nx9700z3, nx24688z1, 
         nx57096z1, nx28816z1, nx43040z1, nx43040z2, nx24688z2, nx39541z1, 
         nx39541z2;



    OBUF halt_obuf (.O (halt), .I (halt_dup_0)) ;
    OBUF dmem_wrN_obuf (.O (dmem_wrN), .I (dmem_wrN_dup_0)) ;
    OBUF dmem_rdN_obuf (.O (dmem_rdN), .I (dmem_rdN_dup_0)) ;
    OBUF dout_oeN_obuf (.O (dout_oeN), .I (dout_oeN_dup_0)) ;
    OBUF rslt_oeN_obuf (.O (rslt_oeN), .I (rslt_oeN_dup_0)) ;
    OBUF set_br_obuf (.O (set_br), .I (load_pc_dup_0)) ;
    OBUF inc_pc_obuf (.O (inc_pc), .I (load_f_dup_0)) ;
    OBUF load_pc_obuf (.O (load_pc), .I (load_pc_dup_0)) ;
    OBUF load_f_obuf (.O (load_f), .I (load_f_dup_0)) ;
    OBUF load_b_obuf (.O (load_b), .I (load_b_dup_0)) ;
    OBUF load_s_obuf (.O (load_s), .I (load_s_dup_0)) ;
    IBUF rstN_ibuf (.O (rstN_int), .I (rstN)) ;
    IBUF branching_ibuf (.O (branching_int), .I (branching)) ;
    IBUF zero_flag_ibuf (.O (zero_flag_int), .I (zero_flag)) ;
    IBUF exception_ibuf (.O (exception_int), .I (exception)) ;
    IBUF \instruction_ibuf(0)  (.O (instruction_int[0]), .I (instruction[0])) ;
    IBUF \instruction_ibuf(1)  (.O (instruction_int[1]), .I (instruction[1])) ;
    IBUF \instruction_ibuf(2)  (.O (instruction_int[2]), .I (instruction[2])) ;
    IBUF \instruction_ibuf(3)  (.O (instruction_int[3]), .I (instruction[3])) ;
    FDC \reg_state(3)  (.Q (state[3]), .D (state[2]), .C (clk_int), .CLR (
        not_rstN)) ;
    FDC \reg_state(2)  (.Q (state[2]), .D (state[1]), .C (clk_int), .CLR (
        not_rstN)) ;
    FDC \reg_state(1)  (.Q (state[1]), .D (nx28524z1), .C (clk_int), .CLR (
        not_rstN)) ;
    MUXF5 ix39541z55178 (.O (load_s_dup_0), .I0 (nx39541z1), .I1 (nx39541z2), .S (
          instruction_int[0])) ;
    MUXF5 ix24688z55178 (.O (load_b_dup_0), .I0 (nx24688z1), .I1 (nx24688z2), .S (
          instruction_int[0])) ;
    MUXF5 ix43040z55178 (.O (dout_oeN_dup_0), .I0 (nx43040z1), .I1 (nx43040z2), 
          .S (instruction_int[0])) ;
    MUXF5 ix28816z55178 (.O (dmem_wrN_dup_0), .I0 (nx28816z1), .I1 (nx43040z1), 
          .S (instruction_int[0])) ;
    MUXF5 ix57096z55178 (.O (halt_dup_0), .I0 (nx24688z1), .I1 (nx57096z1), .S (
          instruction_int[0])) ;
    LUT4 ix9700z1311 (.O (load_f_dup_0), .I0 (instruction_int[2]), .I1 (nx9700z1
         ), .I2 (nx9700z2), .I3 (nx9700z3)) ;
         defparam ix9700z1311.INIT = 16'hFFFD;
    LUT4 ix59839z1346 (.O (load_pc_dup_0), .I0 (nx59839z1), .I1 (nx9700z3), .I2 (
         instruction_int[2]), .I3 (branching_int)) ;
         defparam ix59839z1346.INIT = 16'h0020;
    LUT4 ix21185z1346 (.O (rslt_oeN_dup_0), .I0 (state[3]), .I1 (
         instruction_int[1]), .I2 (instruction_int[3]), .I3 (instruction_int[2])
         ) ;
         defparam ix21185z1346.INIT = 16'h0020;
    LUT4 ix40977z1305 (.O (dmem_rdN_dup_0), .I0 (state[3]), .I1 (
         instruction_int[3]), .I2 (instruction_int[2]), .I3 (instruction_int[1])
         ) ;
         defparam ix40977z1305.INIT = 16'hFFF7;
    LUT1 ix28524z1316 (.O (not_rstN), .I0 (rstN_int)) ;
         defparam ix28524z1316.INIT = 4'h1;
    LUT2 ix28524z1315 (.O (nx28524z1), .I0 (state[2]), .I1 (state[1])) ;
         defparam ix28524z1315.INIT = 4'h1;
    LUT4 ix9700z2643 (.O (nx9700z1), .I0 (zero_flag_int), .I1 (exception_int), .I2 (
         instruction_int[1]), .I3 (instruction_int[0])) ;
         defparam ix9700z2643.INIT = 16'h0530;
    LUT4 ix59839z31316 (.O (nx59839z1), .I0 (instruction_int[1]), .I1 (
         instruction_int[0]), .I2 (exception_int), .I3 (zero_flag_int)) ;
         defparam ix59839z31316.INIT = 16'h7531;
    LUT3 ix9700z1428 (.O (nx9700z2), .I0 (instruction_int[1]), .I1 (
         instruction_int[0]), .I2 (branching_int)) ;
         defparam ix9700z1428.INIT = 8'h70;
    LUT2 ix9700z1324 (.O (nx9700z3), .I0 (state[3]), .I1 (instruction_int[3])) ;
         defparam ix9700z1324.INIT = 4'h7;
    GND ps_gnd (.G (nx24688z1)) ;
    LUT4 ix57096z34083 (.O (nx57096z1), .I0 (state[3]), .I1 (instruction_int[3])
         , .I2 (instruction_int[2]), .I3 (instruction_int[1])) ;
         defparam ix57096z34083.INIT = 16'h8000;
    LUT4 ix28816z64802 (.O (nx28816z1), .I0 (state[2]), .I1 (instruction_int[3])
         , .I2 (instruction_int[2]), .I3 (instruction_int[1])) ;
         defparam ix28816z64802.INIT = 16'hF7FF;
    VCC ps_vcc (.P (nx43040z1)) ;
    LUT4 ix43040z64803 (.O (nx43040z2), .I0 (state[3]), .I1 (instruction_int[3])
         , .I2 (instruction_int[2]), .I3 (instruction_int[1])) ;
         defparam ix43040z64803.INIT = 16'hF7FF;
    LUT4 ix24688z1324 (.O (nx24688z2), .I0 (state[3]), .I1 (instruction_int[3])
         , .I2 (instruction_int[2]), .I3 (instruction_int[1])) ;
         defparam ix24688z1324.INIT = 16'h0008;
    LUT4 ix39541z10059 (.O (nx39541z1), .I0 (state[3]), .I1 (instruction_int[3])
         , .I2 (instruction_int[2]), .I3 (instruction_int[1])) ;
         defparam ix39541z10059.INIT = 16'h2228;
    LUT2 ix39541z1318 (.O (nx39541z2), .I0 (state[3]), .I1 (instruction_int[3])
         ) ;
         defparam ix39541z1318.INIT = 4'h2;
    BUFGP clk_ibuf (.O (clk_int), .I (clk)) ;
endmodule

