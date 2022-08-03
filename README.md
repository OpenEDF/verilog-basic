# verilog_basic
## introduction

verilog_base uses Verilog to build 74x series of IP circuits to learn the basic combinational and sequential logic circuits. and build the entire chip step by step.
all kinds of ip design.

## Compile and simulation *command:*
```shell
$ iverilog -o outputfile readtestxxx.v testbench.v
$ vvp outputfile
$ gtkwave test.cvd &
```
## compiler and simv
```shell
$ asciinema ecp
$ exit [wait save and upload to cloud...]
```
## vcs & verdi

[![asciicast](https://asciinema.org/a/8AvIYNfUfi9sQypDmhYCkdzZo.svg)](https://asciinema.org/a/8AvIYNfUfi9sQypDmhYCkdzZo)


## vivado generate bit and mcs file
### create-ip and instance
```shell
$ vivado
```
### TODO:
Add the UVM example
Add the systemverilog example
