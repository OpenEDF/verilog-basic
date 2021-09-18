module example (/*AUTOARG*/
   // Outputs
   o,
   // Inputs
   i
   );
   input i;
   output o;

   /*AUTOINPUT*/
   /*AUTOOUTPUT*/
   /*AUTOREG*/
   // Beginning of automatic regs (for this module's undeclared outputs)
   reg                  o;
   // End of automatics
   always @ (/*AUTOSENSE*/i) begin
      o = i;
   end

endmodule // example
