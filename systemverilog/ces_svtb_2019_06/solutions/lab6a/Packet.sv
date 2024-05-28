`ifndef INC_PACKET_SV
`define INC_PACKET_SV
class Packet;
  rand bit[3:0] sa, da;         // random port selection
  rand logic[7:0] payload[$];   // random payload array
       string   name;           // unique identifier

  constraint Limit {
    sa inside {[0:15]};
    da inside {[0:15]};
    payload.size() inside {[2:4]};
  }

  extern function new(string name = "Packet");
  extern virtual function bit compare(Packet pkt2cmp, ref string message);
  extern virtual function void display(string prefix = "NOTE");
  extern virtual function Packet copy();
endclass

function Packet::new(string name);
  this.name = name;
endfunction

function bit Packet::compare(Packet pkt2cmp, ref string message);
  if (payload.size() != pkt2cmp.payload.size()) begin
    message = "Payload Size Mismatch:\n";
    message = { message, $sformatf("payload.size() = %0d, pkt2cmp.payload.size() = %0d\n", payload.size(), pkt2cmp.payload.size()) };
    return(0);
  end
    if (payload == pkt2cmp.payload) ;
    else begin
      message = "Payload Content Mismatch:\n";
      message = { message, $sformatf("Packet Sent:  %p\nPkt Received: %p", payload, pkt2cmp.payload) };
      return(0);
    end
  message = "Successfully Compared";
  return(1);
endfunction

function void Packet::display(string prefix);
  $display("[%s]%t %s sa = %0d, da = %0d", prefix, $realtime, name, sa, da);
  foreach(payload[i])
    $display("[%s]%t %s payload[%0d] = %0d", prefix, $realtime, name, i, payload[i]);
endfunction

function Packet Packet::copy();
  Packet pkt_copy = new();
  pkt_copy.sa = this.sa;
  pkt_copy.da = this.da;
  pkt_copy.payload = this.payload;
  return(pkt_copy);
endfunction

`endif
