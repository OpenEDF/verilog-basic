`timescale 1ns/10ps

 module testbench;

 initial begin
    integer err = 0;
    $display("-------------------- [ Simulation Starts !! ] --------------------");
    $display("-------------------- [ Simulation Stops !!  ] --------------------");
    err = 0;
    if (!err) begin 
        $display("==================================================================");
        $display("==================================================================");
        $display("=========                                              ===========");
        $display("=========    PPPPPPPP      A        SSSSS    SSSSS     ===========");
        $display("=========    P      P     A A      S     S  S     S    ===========");
        $display("=========    P      P    A   A     S        S          ===========");
        $display("=========    PPPPPP     AAAAAAA     SSSSS    SSSSS     ===========");
        $display("=========    P         A       A         S        S    ===========");
        $display("=========    P        A         A        S        S    ===========");
        $display("=========    P       A           A  SSSSS    SSSSS     ===========");
        $display("==================================================================");
        $display("========= This case is pass !!! %d", $time);
        $display("==================================================================");
	end else begin 
        $display("==================================================================");
        $display("==================================================================");
        $display("=========                                             ============");
        $display("=========     FFFFFFF       A         III   L         ============");
        $display("=========     F            A A         I    L         ============");
        $display("=========     F           A   A        I    L         ============");
        $display("=========     FFFFFFF    AAAAAAA       I    L         ============");
        $display("=========     F         A       A      I    L         ============");
        $display("=========     F        A         A     I    L         ============");
        $display("=========     F       A           A   III   LLLLLLL   ============");
        $display("==================================================================");
        $display("========= This case is failed !!! %d", err);
        $display("==================================================================");
	end
    $finish;
end
endmodule
