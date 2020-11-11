NAME=counter

PROG=${NAME}.out
SRCS=$(wildcard *.v)


run:
	iverilog -o ${PROG} ${SRCS}
	vvp ${PROG}

run2:
	iverilog -o ${PROG} ${SRCS}
	vvp ${PROG} -lxt2

clean:
	-rm ${PROG} *.vcd *.lxt -f

