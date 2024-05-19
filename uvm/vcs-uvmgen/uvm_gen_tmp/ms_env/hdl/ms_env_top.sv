//
// Template for Top module
//

`ifndef MS_ENV_TOP__SV
`define MS_ENV_TOP__SV

module ms_env_top();

   logic clk;
   logic rst;

   // Clock Generation
   parameter sim_cycle = 10;
   
   // Reset Delay Parameter
   parameter rst_delay = 50;

   always 
      begin
         #(sim_cycle/2) clk = ~clk;
      end

   m_intf mst_if(clk,rst);
   s_intf slv_if(clk,rst);
   
   ms_env_tb_mod test(); 
   
   // ToDo: Include Dut instance here
  
   //Driver reset depending on rst_delay
   initial
      begin
         clk = 0;
         rst = 0;
      #1 rst = 1;
         repeat (rst_delay) @(clk);
         rst = 1'b0;
         @(clk);
   end

endmodule: ms_env_top

`endif // MS_ENV_TOP__SV
