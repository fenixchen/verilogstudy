SRCS=$(wildcard *.v)

.PHONY: FORCE

run:build FORCE
	vvp test.out

wave:build dump.vcd FORCE
	gtkwave dump.vcd &

FORCE:

build:test.out

test.out:$(SRCS)
	iverilog -o $@ $^

clean:
	-rm -rf *.out *.vcd
