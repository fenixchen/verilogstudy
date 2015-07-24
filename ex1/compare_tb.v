`timescale 1ns/1ns

module comparetest;
    reg a, b;
    wire equal;
    initial
    begin
        a = 0;
        b = 0;
        #100 a = 0; b = 1;
        #100 a = 0; b = 0;
        #100 a = 1; b = 1;
        #100 a = 1; b = 0;
        #100 $finish;
    end
    compare compare1(equal, a, b);
    initial
    begin
        $monitor("[%d] a = %d, b = %d, equal = %d", $time, a, b, equal);
    end
endmodule
