NAME=inv

PROG=${NAME}.out
SRCS=$(wildcard *.v)

run:${PROG}
	vvp ${PROG}

wave:run
	gtkwave ${NAME}_tb.vcd


${PROG}:${SRCS}
	iverilog -o ${PROG} ${SRCS}

clean:
	-rm ${PROG} *.vcd -rf

