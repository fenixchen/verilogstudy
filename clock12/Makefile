.PHONY: FORCE

run:build FORCE
	vvp test.out

FORCE:

build:test.out

test.out:clock24.v tb.v
	iverilog -o $@ $^

clean:
	-rm -rf *.out *.vcd

wave:run
	gtkwave test.vcd
