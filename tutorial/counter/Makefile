NAME=counter

PROG=${NAME}.out
SRCS=$(wildcard *.v)


run1:
	iverilog -o ${PROG} ${SRCS}
	vvp ${PROG}

run2:
	iverilog -o ${PROG} -c file_list.txt
	vvp ${PROG}

run3:
	iverilog -s test -o ${PROG} ${SRCS}
	vvp ${PROG}


clean:
	-rm ${PROG} -f

