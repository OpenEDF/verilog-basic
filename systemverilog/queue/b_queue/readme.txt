Chronologic VCS simulator copyright 1991-2018
Contains Synopsys proprietary information.
Compiler version O-2018.09-SP2_Full64; Runtime version O-2018.09-SP2_Full64;  Jul 12 22:40 2024
-------- queue 1 size is 6 --------
	queue_1 = '{0, 1, 2, 3, 4, 5} 

Warning-[DT-OOBBQ] Out of bound addition in bounded queue
testbench.sv, 60
  Addition of new element beyond the upper bound (6) of the queue shall be 
  ignored.
  Please make sure that the queue is not full or the index is within the 
  bounds of the queue.

-------- queue 1 size after delete is 6 --------
	queue_1[0] = 0
	queue_1[1] = 1
	queue_1[2] = 2
	queue_1[3] = 3
	queue_1[4] = 4
	queue_1[5] = 5

Warning-[DT-HEBQD] Highest-numbered element of bounded queue deleted
testbench.sv, 66
  Addition of new element in bounded queue exceeded the queue's bound.
  It would cause deletion of highest-numbered element of queue.

-------- queue 1 size after push front is 6 --------
	queue_1[0] = 99
	queue_1[1] = 0
	queue_1[2] = 1
	queue_1[3] = 2
	queue_1[4] = 3
	queue_1[5] = 4
$finish at simulation time                    0
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0
CPU Time:      0.340 seconds;       Data structure size:   0.0Mb
Fri Jul 12 22:40:54 2024
CPU time: .222 seconds to compile + .248 seconds to elab + .195 seconds to link + .359 seconds in simulation
