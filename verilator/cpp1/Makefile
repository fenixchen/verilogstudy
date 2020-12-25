all: our.v sim_main.cpp
	verilator -Wall --cc our.v --exe sim_main.cpp
	make -j -C obj_dir -f Vour.mk Vour

run: all
	obj_dir/Vour

clean:
	rm obj_dir -rf
