NAME=$(shell basename `pwd` | sed -e "s/^.*_//g")

PROG=${NAME}.out
SRCS=$(wildcard *.v)

run:${PROG}
	vvp ${PROG}

wave:run
	gtkwave ${NAME}_tb.vcd &


${PROG}:${SRCS}
	iverilog -o ${PROG} ${SRCS} -y ../05_prescaler/

clean:
	-rm *.vcd *.out -rf

