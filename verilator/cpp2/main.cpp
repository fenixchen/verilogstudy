#include <stdio.h>
#include "Vtop.h"

#include "verilated.h"

int main(int argc, char** argv, char** env) {
    int count = 100;
    Verilated::commandArgs(argc, argv);
    Vtop* top = new Vtop;

    while (!Verilated::gotFinish()) {
        top->clk = 1;
        top->eval();
        top->clk = 0;
        top->eval();
        printf("counter:%d\n", top->q);
        if (count -- == 0) break;
    }

    delete top;

    exit(0);
}
