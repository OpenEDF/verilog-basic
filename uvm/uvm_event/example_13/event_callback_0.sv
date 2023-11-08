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
// Brief: uvm barries
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
class event_callback_0 extends uvm_event_callback;

//--------------------------------------------------------------------------
// Design: register factory
//--------------------------------------------------------------------------
`uvm_object_utils(event_callback_0)

//--------------------------------------------------------------------------
// Design: constructor
//--------------------------------------------------------------------------
function new(string name = "event_callback_0");
    super.new(name);
endfunction: new

//--------------------------------------------------------------------------
// Design: pre trigger method
//--------------------------------------------------------------------------
virtual function bit pre_trigger(uvm_event e, uvm_object data);
    `uvm_info(get_type_name(), $sformatf("[callback-0] inside event pre_trigger callback"), UVM_LOW)
endfunction: pre_trigger 

//--------------------------------------------------------------------------
// Design: post trigger method
//--------------------------------------------------------------------------
virtual function void post_trigger(uvm_event e, uvm_object data);
    `uvm_info(get_type_name(), $sformatf("[callback-0] inside event post_trigger callback"), UVM_LOW)
endfunction: post_trigger 

endclass : event_callback_0 
//--------------------------------------------------------------------------
