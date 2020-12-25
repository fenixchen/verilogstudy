#include <stdio.h>
#include "Vtop.h"
#include "testb.h"
#include "verilated.h"

int main(int argc, char** argv, char** env) {
    Verilated::commandArgs(argc, argv);
    TESTB<Vtop>* tb = new TESTB<Vtop>();

    tb->opentrace("test.vcd");
    while (!tb->done()) {
        tb->tick();
        printf("counter:%d\n", tb->core()->q);
    }
    tb->closetrace();

    delete tb;

    exit(0);
}
