#### sed replace

```shell

find -name Makefile -exec sed -i 's/-cpp g++-4.8//' {} +
find -name Makefile -exec sed -i '/-cc gcc-4.8 -LDFLAGS -Wl,--no-as-needed +incdir+$(UVM_HOME)\/src/d' {} +
find -name Makefile -exec sed -i 's/$(UVM_HOME)\/src\/uvm.sv $(UVM_HOME)\/src\/dpi\/uvm_dpi.cc/ -ntb_opts uvm-1.2/' {} +
```
