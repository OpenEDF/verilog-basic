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
// Brief: uvm sequence
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class intr_seq extends uvm_sequence#(seq_item);

//--------------------------------------------------------------------------
// Design: declear and register
//--------------------------------------------------------------------------
seq_item req;
uvm_event intr_e;
`uvm_object_utils(intr_seq);

//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function new(string name = "intr_seq");
    super.new(name);
    intr_e = uvm_event_pool::get_global("INT");
endfunction

//--------------------------------------------------------------------------
// Design: sequence, your stimulus code, this is the user-defined task
//         whers the main sequence code resides.
// uvm_do:
//        start_item(item);
//        item.randaomize();
//        finish_item(item);
//--------------------------------------------------------------------------
task body();
    intr_e.wait_trigger();
    `uvm_info(get_type_name(), "interrupt seq: inside body", UVM_LOW);

    /* grab sequencer for exclusive access */
    grab();

    `uvm_do_with(req, {ina == 10; inb == 20;});

    /* ungrab sequencer once service is finished */
    ungrab();
    `uvm_info(get_type_name(), "interrupt seq: body finished", UVM_LOW);
    intr_e.reset();
endtask

endclass: intr_seq
//--------------------------------------------------------------------------
