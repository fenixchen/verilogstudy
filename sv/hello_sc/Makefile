# wget https://accellera.org/images/downloads/standards/systemc/systemc-2.3.3.tar.gz
# CXXFLAGS=-std=gnu++14 ../configure  --prefix=/opt/systemc
# make
# make install
export SYSTEMC_HOME=/opt/systemc
export SYSTEMC_INCLUDE=$(SYSTEMC_HOME)/include
export SYSTEMC_LIBDIR=${SYSTEMC_HOME}/lib-linux64
export LD_LIBRARY_PATH=${SYSTEMC_LIBDIR}
export SYSTEMC_CXX_FLAGS=-pthread

$(warning "SYSTEMC_INCLUDE: "$(SYSTEMC_INCLUDE))
$(warning "SYSTEMC_LIBDIR:  "$(SYSTEMC_LIBDIR))

Vour: our.v sc_main.cpp
	verilator -Wall --sc our.v
	make -C obj_dir -f Vour.mk Vour__ALL.a
	make -C obj_dir -f Vour.mk sc_main.o verilated.o
	g++ -std=gnu++14 -L$(SYSTEMC_LIBDIR) obj_dir/sc_main.o obj_dir/Vour__ALL.a obj_dir/verilated.o -o Vour -lsystemc 

run: Vour 
	./Vour

clean:
	rm obj_dir *.o *.d Vour *.vcd -rf
