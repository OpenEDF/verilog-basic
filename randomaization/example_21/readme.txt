Error-[CNST-CIF] Constraints inconsistency failure
testbench.sv, 55
  Constraints are inconsistent and cannot be solved.
  Please check the inconsistent constraints being printed above and rewrite
  them.

time: 0 pkt.addr = 0

=======================================================

Solver failed when solving following set of constraints


rand bit[7:0] addr; // rand_mode = ON

constraint addr_range    // (from this) (constraint_mode = ON) (packet.sv:48)
{
   (addr > 8'ha);
}
constraint WITH_CONSTRAINT    // (from this) (constraint_mode = ON) (testbench.sv:55)
{
   (addr < 8'ha);
}


