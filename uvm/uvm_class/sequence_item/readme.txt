Contains Synopsys proprietary information.
Compiler version O-2018.09-SP2_Full64; Runtime version O-2018.09-SP2_Full64;  Oct 19 07:56 2023
UVM_INFO testbench.sv(64) @ 0: reporter [TEST] uvm base class method test start !
-----------------------------------
Name      Type          Size  Value
-----------------------------------
seq_item  mem_seq_item  -     @335
  addr    integral      4     'h9
  wr_en   integral      1     'h1
  rd_en   integral      1     'h0
  wdata   integral      8     'h6c
-----------------------------------
-------------------------------------
Name        Type          Size  Value
-------------------------------------
seq_item_1  mem_seq_item  -     @339
  addr      integral      4     'h9
  wr_en     integral      1     'h1
  rd_en     integral      1     'h0
  wdata     integral      8     'h6c
-------------------------------------
-----------------------------------
Name      Type          Size  Value
-----------------------------------
seq_item  mem_seq_item  -     @355
  addr    integral      4     'h9
  wr_en   integral      1     'h1
  rd_en   integral      1     'h0
  wdata   integral      8     'h6c
-----------------------------------
UVM_INFO testbench.sv(88) @ 0: reporter [] sequ_item matching with seq_item_1
UVM_INFO testbench.sv(89) @ 0: reporter [] sequ_item matching with seq_item_1 begin end test!
-------------------------------------
Name        Type          Size  Value
-------------------------------------
seq_item_1  mem_seq_item  -     @339
  addr      integral      4     'h7
  wr_en     integral      1     'h1
  rd_en     integral      1     'h0
  wdata     integral      8     'h14
-------------------------------------
UVM_INFO /home/macro/synopsys/uvm_lib/uvm-1.2/src/base/uvm_comparer.svh(351) @ 0: reporter [MISCMP] Miscompare for seq_item.addr: lhs = 'h9 : rhs = 'h7
UVM_INFO /home/macro/synopsys/uvm_lib/uvm-1.2/src/base/uvm_comparer.svh(382) @ 0: reporter [MISCMP] 1 Miscompare(s) for object seq_item_1@339 vs. seq_item@335
UVM_ERROR testbench.sv(100) @ 0: reporter [COMPARE] sequ_item is not matching with seq_item_1
-----------------------------------
Name      Type          Size  Value
-----------------------------------
seq_item  mem_seq_item  -     @335
  addr    integral      4     'h9
  wr_en   integral      1     'h1
  rd_en   integral      1     'h0
  wdata   integral      8     'h6c
-----------------------------------
UVM_INFO testbench.sv(106) @ 0: reporter [PACK] bit_packed_data[0] = 1
UVM_INFO testbench.sv(106) @ 0: reporter [PACK] bit_packed_data[1] = 0
UVM_INFO testbench.sv(106) @ 0: reporter [PACK] bit_packed_data[2] = 0
UVM_INFO testbench.sv(106) @ 0: reporter [PACK] bit_packed_data[3] = 1
UVM_INFO testbench.sv(106) @ 0: reporter [PACK] bit_packed_data[4] = 1
UVM_INFO testbench.sv(106) @ 0: reporter [PACK] bit_packed_data[5] = 0
UVM_INFO testbench.sv(106) @ 0: reporter [PACK] bit_packed_data[6] = 0
UVM_INFO testbench.sv(106) @ 0: reporter [PACK] bit_packed_data[7] = 1
UVM_INFO testbench.sv(106) @ 0: reporter [PACK] bit_packed_data[8] = 1
UVM_INFO testbench.sv(106) @ 0: reporter [PACK] bit_packed_data[9] = 0
UVM_INFO testbench.sv(106) @ 0: reporter [PACK] bit_packed_data[10] = 1
UVM_INFO testbench.sv(106) @ 0: reporter [PACK] bit_packed_data[11] = 1
UVM_INFO testbench.sv(106) @ 0: reporter [PACK] bit_packed_data[12] = 0
UVM_INFO testbench.sv(106) @ 0: reporter [PACK] bit_packed_data[13] = 0
UVM_INFO testbench.sv(109) @ 0: reporter [UNPACK] before unpack
-------------------------------------
Name        Type          Size  Value
-------------------------------------
seq_item_3  mem_seq_item  -     @343
  addr      integral      4     'h0
  wr_en     integral      1     'h0
  rd_en     integral      1     'h0
  wdata     integral      8     'h0
-------------------------------------
UVM_INFO testbench.sv(112) @ 0: reporter [UNPACK] after unpack
-------------------------------------
Name        Type          Size  Value
-------------------------------------
seq_item_3  mem_seq_item  -     @343
  addr      integral      4     'h9
  wr_en     integral      1     'h1
  rd_en     integral      1     'h0
  wdata     integral      8     'h6c
-------------------------------------
-----------------------------------
Name      Type          Size  Value
-----------------------------------
seq_item  mem_seq_item  -     @335
  addr    integral      4     'h9
  wr_en   integral      1     'h1
  rd_en   integral      1     'h0
  wdata   integral      8     'h6c
-----------------------------------
UVM_INFO testbench.sv(119) @ 0: reporter [PACK] bit_packed_data[0] = 10011001
UVM_INFO testbench.sv(119) @ 0: reporter [PACK] bit_packed_data[1] = 10110000
UVM_INFO testbench.sv(122) @ 0: reporter [UNPACK] before unpack
-------------------------------------
Name        Type          Size  Value
-------------------------------------
seq_item_4  mem_seq_item  -     @347
  addr      integral      4     'h0
  wr_en     integral      1     'h0
  rd_en     integral      1     'h0
  wdata     integral      8     'h0
-------------------------------------
UVM_INFO testbench.sv(125) @ 0: reporter [UNPACK] after unpack
-------------------------------------
Name        Type          Size  Value
-------------------------------------
seq_item_4  mem_seq_item  -     @347
  addr      integral      4     'h9
  wr_en     integral      1     'h1
  rd_en     integral      1     'h0
  wdata     integral      8     'h6c
-------------------------------------
-----------------------------------
Name      Type          Size  Value
-----------------------------------
seq_item  mem_seq_item  -     @335
  addr    integral      4     'h9
  wr_en   integral      1     'h1
  rd_en   integral      1     'h0
  wdata   integral      8     'h6c
-----------------------------------
UVM_INFO testbench.sv(132) @ 0: reporter [PACK] bit_packed_data[0] = 10011001101100000000000000000000
UVM_INFO testbench.sv(133) @ 0: reporter [PACK] bit_packed_data[0] = 2578448384
UVM_INFO testbench.sv(137) @ 0: reporter [UNPACK] before unpack
-------------------------------------
Name        Type          Size  Value
-------------------------------------
seq_item_5  mem_seq_item  -     @351
  addr      integral      4     'h0
  wr_en     integral      1     'h0
  rd_en     integral      1     'h0
  wdata     integral      8     'h0
-------------------------------------
UVM_INFO testbench.sv(140) @ 0: reporter [UNPACK] after unpack
-------------------------------------
Name        Type          Size  Value
-------------------------------------
seq_item_5  mem_seq_item  -     @351
  addr      integral      4     'h9
  wr_en     integral      1     'h1
  rd_en     integral      1     'h0
  wdata     integral      8     'h6c
-------------------------------------
UVM_INFO testbench.sv(143) @ 0: reporter [TEST] uvm base class method test end !
           V C S   S i m u l a t i o n   R e p o r t
Time: 0 ps
CPU Time:      0.610 seconds;       Data structure size:   0.2Mb
Thu Oct 19 07:56:23 2023

