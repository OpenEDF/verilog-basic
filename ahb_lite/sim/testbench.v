//--------------------------------------------------------------------------
//                         RISC-V Core
//                            V1.0.0
//                         openedf.com
//                     Copyright 2023-2024
//
//                     makermuyi@gmail.com
//
//                       License: BSD
//--------------------------------------------------------------------------
//
// Copyright (c) 2020-2021, openedf.com
// All rights reserved.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
// LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
// THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
// SUCH DAMAGE.

//--------------------------------------------------------------------------
// Designer: macro
// Brief: testbench amba 3.0 ahb lite
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------
`include "ahb_lite_config.v"

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module testbench();
//--------------------------------------------------------------------------
// Ports
//--------------------------------------------------------------------------
reg         hclk;
reg         hresetn;
// AHB master inputs
reg [31:0]  master_haddr;
reg         master_hwrite;
reg [2:0]   master_hsize;
reg [2:0]   master_hburst;
reg [3:0]   master_hport;
reg [1:0]   master_htrans;
reg         master_hmasterlock;
reg [31:0]  master_hwdata;

//custom master outputs
wire        master_hready_wait;
wire        master_hresp_error;
wire [31:0] master_out_data;
reg  [31:0] ahb_wr_addr, ahb_wr_data, ahb_rd_data;

//--------------------------------------------------------------------------
// Design: reset control logic initial
//--------------------------------------------------------------------------
initial begin
    $display("[%0t] AHB Lite testbench case...", $time);
    fork
        /* reset control logic */
        reset();

        /* init logic */
        init_and_start();
    join

    /* run */
    main();

    /* clean */
    clean_and_exit();
end

//--------------------------------------------------------------------------
// Design: create the clock
//--------------------------------------------------------------------------
initial begin
    hclk = 1'b0;
    forever #5 hclk = ~hclk;
end

//--------------------------------------------------------------------------
// Design: reset control logic initial
//--------------------------------------------------------------------------
task reset();
begin
    $display("[%0t] AHB Lite testbench reset...", $time);
    hresetn = 1'b1;
    #10
    hresetn = 1'b0;
    #10
    hresetn = 1'b1;
end
endtask

//--------------------------------------------------------------------------
// Design: initiali
//--------------------------------------------------------------------------
task init_and_start();
begin
    /* initial input signal */
    @(negedge hresetn);
    $display("[%0t] AHB Lite testbench init...", $time);
    master_haddr         <= 32'h005E_0000;
    master_hwrite        <= `MASTER_READ;
    master_hsize         <= `SIZE_WORD;
    master_hburst        <= `BURST_SINGLE;
    master_hport         <= 4'b0000;
    master_htrans        <= `TRANS_IDLE;
    master_hmasterlock   <= 1'b0;
    master_hwdata        <= 32'h0000_0000;
    #10;
end
endtask

//--------------------------------------------------------------------------
// Design: main run task
//--------------------------------------------------------------------------
task main();
begin
    $display("[%0t] AHB Lite testbench run...", $time);
end
endtask

//--------------------------------------------------------------------------
// Design: clean and exit
//--------------------------------------------------------------------------
task clean_and_exit();
begin
    $display("[%0t] AHB Lite testbench exit...", $time);
    @(posedge hclk);
    #100
    $finish();
end
endtask

//--------------------------------------------------------------------------
// Design: ahb master write task
//--------------------------------------------------------------------------
task ahb_lite_write(input [31:0] addr, data);
begin
    $display("[%0t] AHB Lite wirte test: address: 0x%h, data: 0x%h", $time, addr, data);
    master_haddr  <= addr;
    master_hwdata <= data;
    master_hwrite  <= 1'b1;
    wait (master_hready_wait) begin
        $display("[%0t] AHB Lite write done!", $time);
    end
end
endtask

//--------------------------------------------------------------------------
// Design: ahb master read task
//--------------------------------------------------------------------------
task ahb_lite_read(input [31:0] addr);
begin
    $display("[%0t] AHB Lite read test: address: 0x%h", $time, addr);
    master_haddr  <= addr;
    master_hwrite  <= 1'b0;
    wait (master_hready_wait) begin
        $display("[%0t] AHB Lite read done!", $time);
    end
end
endtask

//--------------------------------------------------------------------------
// Design: dump .fsdb file
//--------------------------------------------------------------------------
initial begin
    $fsdbDumpfile("testbench.fsdb");
    $fsdbDumpvars(0, testbench);
end

//--------------------------------------------------------------------------
// Design: instance ahb lite top
//--------------------------------------------------------------------------
ahb_lite_top ahb_lite_top_u
(
    // global inputs
    .HCLK                   (hclk),
    .HRESETn                (hresetn),

    // AHB master inputs
    .master_haddr           (master_haddr),
    .master_hwrite          (master_hwrite),
    .master_hsize           (master_hsize),
    .master_hburst          (master_hburst),
    .master_hport           (master_hport),
    .master_htrans          (master_htrans),
    .master_hmasterlock     (master_hmasterlock),
    .master_hwdata          (master_hwdata),

    //custom master outputs
    .master_hready_wait     (master_hready_wait),
    .master_hresp_error     (master_hresp_error),
    .master_out_data        (master_out_data)
);

endmodule
//--------------------------------------------------------------------------
