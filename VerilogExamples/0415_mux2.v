// 4.15: mux2 with tristate

module mux2(input      [3:0] d0, d1,
            input            s,
            output tri [3:0] y);

   tristate t0(d0, ~s, y);
   tristate t1(d1, s,  y);
endmodule