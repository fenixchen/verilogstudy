NAME=$(shell basename `pwd` | sed -e "s/^.*_//g")

PROG=${NAME}.out
SRCS=$(wildcard *.v)

run:${PROG}
	vvp ${PROG}

wave:run
	gtkwave ${NAME}_tb.vcd &

compile:
	python masm.py TM2.asm

${PROG}:${SRCS}
	iverilog -o ${PROG} ${SRCS} -y ../05_prescaler/

clean:
	-rm ${PROG} *.vcd *.list -rf

