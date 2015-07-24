`timescale 1ns/1ns

module comparetest;
    reg [7:0] a;
    reg [7:0] b;
    wire equal;
    initial
    begin
        a = 0;
        b = 0;
        #100 a = 100; b = 99;
        #100 a = 100; b = 100;
        #100 a = 99; b = 100;
        #100 $finish;
    end
    compare compare1(equal, a, b);
    initial
    begin
        $monitor("[%d] a = %d, b = %d, equal = %d", $time, a, b, equal);
    end
    initial
    begin
        $dumpfile("dump.vcd");
        $dumpvars(0,comparetest);
    end
endmodule
