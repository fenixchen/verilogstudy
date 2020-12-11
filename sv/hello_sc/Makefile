export SYSTEMC_INCLUDE=/home/csky/systemc-2.3.3/include
export SYSTEMC_LIBDIR=/home/csky/systemc-2.3.3/lib-linux64/


$(warning "SYSTEMC_INCLUDE: "$(SYSTEMC_INCLUDE))
$(warning "SYSTEMC_LIBDIR:  "$(SYSTEMC_LIBDIR))

all:
	verilator -Wall --sc our.v
	make -C obj_dir -f Vour.mk
	make -C obj_dir -f Vour.mk sc_main.o verilated.o
	g++ -L$(SYSTEM_LIBDIR)

clean:
	rm obj_dir -rf
