//
// Template for Top module
//

`ifndef TOP_ENV_TOP__SV
`define TOP_ENV_TOP__SV

module top_env_top();

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

   inte1 mst_if(clk,rst);
   inte2 slv_if(clk,rst);
   
   top_env_tb_mod test(); 
   
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

endmodule: top_env_top

`endif // TOP_ENV_TOP__SV
