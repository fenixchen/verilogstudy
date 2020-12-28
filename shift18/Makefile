.PHONY: FORCE

run:build FORCE
	vvp test.out

FORCE:

build:test.out

test.out:shift18.v tb.v
	iverilog -o $@ $^ -gstrict-expr-width

clean:
	-rm -rf *.out *.vcd

wave:run
	gtkwave test.vcd &
