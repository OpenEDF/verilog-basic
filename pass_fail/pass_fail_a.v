`timescale 1ns/10ps

 module testbench;

 initial begin
    integer err = 0;
    $display("--------------------------- [ Simulation Starts !! ] ---------------------------");
    $display("--------------------------- [ Simulation Stops !!  ] ---------------------------");
    err = 0;
    if (err) begin 
     	$display("============================================================================");
		$display("             ▄▄▄▄▄▄▄ "); 
		$display("         ▄▀▀▀       ▀▄"); 
		$display("       ▄▀            ▀▄ 		ERROR FOUND!!"); 
		$display("      ▄▀          ▄▀▀▄▀▄"); 
		$display("    ▄▀          ▄▀  ██▄▀▄"); 
		$display("   ▄▀  ▄▀▀▀▄    █   ▀▀ █▀▄ 	There are"); 
		$display("   █  █▄▄   █   ▀▄     ▐ █  %d errors in total.", err); 
		$display("  ▐▌  █▀▀  ▄▀     ▀▄▄▄▄▀  █ "); 
		$display("  ▐▌  █   ▄▀              █"); 
		$display("  ▐▌   ▀▀▀                ▐▌"); 
		$display("  ▐▌               ▄      ▐▌ "); 
		$display("  ▐▌         ▄     █      ▐▌ "); 
		$display("   █         ▀█▄  ▄█      ▐▌ "); 
		$display("   ▐▌          ▀▀▀▀       ▐▌ "); 
		$display("    █                     █ "); 
		$display("    ▐▌▀▄                 ▐▌"); 
		$display("     █  ▀                ▀ "); 
        $display("============================================================================");
	end else begin 
        $display("============================================================================");
        $display("/ \033[1;33m##########\                                  #########\033[m");
        $display("//\033[1;33m############/                           #############\033[m");
        $display("  \033[1;33m  (#############       /            ##################\033[m");
        $display("  \033[1;33m  ################################################ \033[m ");
        $display("  \033[1;33m     /###########################################  \033[m   ");
        $display(" \033[1;33m         //(#####################################(  \033[m    ");
        $display("   \033[1;33m        (##################################(/     \033[m    ");
		$display("   \033[1;33m     /####################################(     \033[m    ");
		$display("   \033[1;33m   #####(   /###############(    ########(   \033[m     ");
		$display("   \033[1;33m (#####       ##############     (########  \033[m	   ");
		$display(".  \033[1;33m  #######(  (################   (#########( \033[m	   ");
		$display(".   \033[1;33m/###############/  (######################/	\033[m   ");
		$display("\033[1;35m    . /////\033[m\033[1;33m############################\033[m\033[1;35m/ ///(\033\033[1;33m###( \033[m	   ");
		$display("\033[1;35m  .//////(\033[m\033[1;33m##########################\033[m\033[1;35m///////\033\033[1;33m######  \033[m	   ");
		$display("\033[1;35m   . /////\033[m \033[1;33m#########(       /#########\033[m\033[1;35m(//////\033\033[1;33m####( \033[m    ");
		$display("\033[1;35m   (#((\033[m\033[1;33m###########(        (#########\033[m\033[1;35m(((((\033\033[1;33m######/  \033[m  ");
		$display("  \033[1;33m /###############(      /(####################( \033[m   ");
		$display("   \033[1;33m/#################(  (#######################  \033[m  ");
		$display("\033[1;33m   (###########################################(  \033[m ");
		$display("\033[1;36m	^o^		WOOOOOW  YOU  PASSED!!!\033[m");
        $display("\n");
        $display("============================================================================");
	end
    $finish;
end
endmodule
