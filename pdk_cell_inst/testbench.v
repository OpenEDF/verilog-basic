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
// Brief: testbench for verilog timeformat 
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
reg ir, oenr, renr;
wire padr, cr;

//--------------------------------------------------------------------------
// Design: timeformat system function
//--------------------------------------------------------------------------
PDDW04DGZ_H_G u0(
    .I(ir),
    .OEN(oenr),
    .REN(renr),
    .PAD(padr),
    .C(cr)
);

assign padr = 1'b1;
initial begin
    $timeformat(-9, 2, "ns");
    #10;
    ir   = 1'b1;
    oenr = 1'b1;
    renr = 1'b1;
    $display("[T=%0t] PAD = %0b, C = %0b", $realtime, padr, cr);    
    
    #10;
    ir   = 1'b0;
    oenr = 1'b0;
    renr = 1'b0;
    $display("[T=%0t] PAD = %0b, C = %0b", $realtime, padr, cr);    

    #10;
    ir   = 1'b1;
    oenr = 1'b1;
    renr = 1'b1;
    $display("[T=%0t] PAD = %0b, C = %0b", $realtime, padr, cr);    

    #10;
    $finish();
end

endmodule
//--------------------------------------------------------------------------
