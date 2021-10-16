/* The function will be call to other module */
module function_only;

function [7:0] adder (input [7:0] x, y);
begin
    adder = x + y;
end                
endfunction

endmodule
