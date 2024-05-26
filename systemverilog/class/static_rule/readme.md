### compiler log:

```shell
Error-[SV-AMC] Non-static member access
packet.sv, 62
$unit, "packet_id"
  Illegal access of non-static member 'packet_id' from static method 
  'packet::display_packets_created'.

1 error
CPU time: .481 seconds to compile
Makefile:16: recipe for target 'com' failed
```
