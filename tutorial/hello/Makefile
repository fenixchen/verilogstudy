NAME=hello

PROG=${NAME}.out
SRCS=$(wildcard *.v)

all:${PROG}
	vvp ${PROG}

${PROG}:${SRCS}
	iverilog -o ${PROG} ${SRCS}

clean:
	-rm ${PROG} -rf

