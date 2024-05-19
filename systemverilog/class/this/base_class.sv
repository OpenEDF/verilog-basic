//--------------------------------------------------------------------------
//                      systemverilog calss
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
// Brief: systemverilog class test
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
class base_class;
//--------------------------------------------------------------------------
// Design: class properties
//--------------------------------------------------------------------------
bit [31:0] addr;
bit [31:0] data;
bit        write;
string     pkt_type;

//--------------------------------------------------------------------------
// Design: constructor
//--------------------------------------------------------------------------
function new(bit [31:0] addr, data, bit write, string pkt_type);
    this.addr     = addr;
    this.data     = data;
    this.write    = write;
    this.pkt_type = pkt_type;
endfunction

//--------------------------------------------------------------------------
// Design: disply class prperties
//--------------------------------------------------------------------------
function void display();
    $display("---------------------------------------------------------");
    $display("\t addr      = %0h", addr);
    $display("\t data      = %0h", data);
    $display("\t write     = %0h", write);
    $display("\t pkt_type  = %0s", pkt_type);
    $display("---------------------------------------------------------");
endfunction

endclass: base_class
//--------------------------------------------------------------------------

