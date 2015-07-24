.PHONY: FORCE

run:build FORCE
	vvp test.out

FORCE:

build:test.out

test.out:compare.v compare_tb.v
	iverilog -o $@ $^

clean:
	-rm -rf *.out *.vcd
