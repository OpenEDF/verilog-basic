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
reg [31:0]  master_in_wdata;
reg [31:0]  master_in_addr;
reg         master_en;
reg         master_wr;
//custom master outputs
wire        master_hreadyn_wait;
wire [31:0] master_out_data;

//--------------------------------------------------------------------------
// Design: create the clock
//--------------------------------------------------------------------------
initial begin
    hclk = 1'b0;
    forever #5 hclk = ~hclk;
end

//--------------------------------------------------------------------------
// Design: initial
//--------------------------------------------------------------------------
reg [31:0] ahb_wr_addr, ahb_wr_data, ahb_rd_data;
initial begin
    hresetn = 1'b0;
    #10
    hresetn = 1'b1;
    /* initial input signal */
    $display("[%0t] AHB Lite test:", $time);
    @(posedge hclk);
    master_in_addr  <= 32'h005E_0000;
    master_in_wdata <= 32'h0000_0000;
    master_en       <= 1'b1;
    master_wr       <= 1'b0;

    /* write test */
    ahb_wr_addr <= 32'h005E_0000;
    ahb_wr_data <= 32'hFFFF_0000;
    ahb_rd_data <= 32'h0000_0000;
    repeat (4) begin
        @(posedge hclk);
        ahb_lite_write(ahb_wr_addr, ahb_wr_data);
        ahb_wr_addr = ahb_wr_addr + 32'h0000_0004;
        ahb_wr_data = ahb_wr_data + 32'h0000_0001;
    end

    ahb_wr_addr <= 32'h005E_0000;
    repeat (4) begin
        @(posedge hclk);
        ahb_lite_read(ahb_wr_addr);
        ahb_wr_addr <= ahb_wr_addr + 32'h0000_0004;
    end

    #20
    @(posedge hclk);
    master_en       <= 1'b1;
    master_wr       <= 1'b0;
    master_in_addr  <= 32'h0000_0000;
    master_in_wdata <= 32'h0000_0000;
    #1000
    $finish();
end

//--------------------------------------------------------------------------
// Design: ahb master write task
//--------------------------------------------------------------------------
task ahb_lite_write(input [31:0] addr, data);
begin
    $display("[%0t] AHB Lite wirte test: address: 0x%h, data: 0x%h", $time, addr, data);
    master_in_addr  <= addr;
    master_in_wdata <= data;
    master_wr       <= 1'b1;
    wait (master_hreadyn_wait) begin
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
    master_in_addr  <= addr;
    master_wr       <= 1'b0;
    wait (master_hreadyn_wait) begin
        $display("[%0t] AHB Lite read done!", $time);
    end
end
endtask

//--------------------------------------------------------------------------
// Design: ahb lite read the data
//--------------------------------------------------------------------------
initial begin
    forever @(posedge hclk) begin
        if (master_hreadyn_wait & !master_wr) begin
            $display("[%0t] AHB Lite read data: 0x%h", $time, master_out_data);
        end
    end
end

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
    .master_in_wdata        (master_in_wdata),
    .master_in_addr         (master_in_addr),
    .master_en              (master_en),
    .master_wr              (master_wr),

    //custom master outputs
    .master_hreadyn_wait    (master_hreadyn_wait),
    .master_out_data        (master_out_data)
);

endmodule
//--------------------------------------------------------------------------
