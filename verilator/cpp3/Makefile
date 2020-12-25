all: counter.v divider.v top.v main.cpp
	verilator --trace -Wall --cc top.v --exe main.cpp
	make -j -C obj_dir -f Vtop.mk Vtop

run: all
	obj_dir/Vtop

clean:
	rm obj_dir -rf
