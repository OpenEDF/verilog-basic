// generate if
module mux_case(
    input a,
    input b,
    input sel,
    output reg out
);

    always @ (a or b or sel) begin
        case (sel)
            0 : out = a;
            1 : out = b;
        endcase
    end

    initial begin
        $display("mux_case is instantiated");
    end

endmodule
