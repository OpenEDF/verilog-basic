//A logic sythesizer may infer two adders from the following description rather than
//shaping a single adder.
module Add_A (sel, a, b, c, d, y);
input a, b, c, d, sel; output y; reg y;
always @(sel or a or b or c or d)
begin if (sel == 0) y <= a + b; else y <= c + d; end
endmodule
//To imply the presence of a MUX before a single adder we can use temporary variables.
//For example, the synthesizer should use only one adder for the following code:
module Add_B (sel, a, b, c, d, y);
input a, b, c, d, sel; output y; reg t1, t2, y;
always @(sel or a or b or c or d) begin
if (sel == 0) begin t1 = a; t2 = b; end // Temporary
else begin t1 = c; t2 = d; end // variables.
y = t1 + t2; end
endmodule

//12.5 Verilog and Logic Synthesis http://iroi.seu.edu.cn/books/asics/Book2/CH12/CH12.5.htm
//If a synthesis tool is capable of performing resource allocation and resource sharing
//in these situations, the coding style may not matter.