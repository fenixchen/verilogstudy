.PHONY: FORCE

run:build FORCE
	vvp test.out

FORCE:

build:test.out

test.out:compare_8bit.v compare_8bit_tb.v
	iverilog -o $@ $^

clean:
	-rm -rf *.out *.vcd
