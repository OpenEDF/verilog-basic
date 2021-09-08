set -e

if [ -d "obj_dir" ]; then
  rm -r obj_dir
fi

# to create the obj dir:
verilator -Wall --cc alu.v --exe main.cpp

# to compile:
make -j -C obj_dir -f Valu.mk Valu
