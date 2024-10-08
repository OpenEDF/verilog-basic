//--------------------------------------------------------------------------
//                            UVM Lab
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
// Brief: uvm sequence item example
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class cust_seq_item_config extends seq_item_config;

`uvm_object_utils(cust_seq_item_config)
//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function new(string name = "cust_seq_item_config");
    super.new(name);
    this.addr = 10;
    this.wr_en = 1;
    this.rd_en = 0;
    this.wdata = 16;
    this.rdata = 33;
endfunction

endclass: cust_seq_item_config
