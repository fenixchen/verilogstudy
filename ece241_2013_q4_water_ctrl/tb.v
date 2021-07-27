`timescale 1ps/1ps
module tb;

    reg clk = 1'b0;

    reg reset = 1'b0;

    reg [3:1] s = 3'b0;

    always #2 clk = ~clk;

    wire fr1, fr2, fr3, dfr;

    top_module top(
        clk,
        reset,
        s,
        fr3,
        fr2,
        fr1,
        dfr);

    initial
    begin
        reset = 1'b0;
        #5 reset = 1'b1;
        #5 reset = 1'b0;
        #5 s = 0;
        #5 s = 1;
        #5 s = 3;
        #5 s = 7;
        #5 s = 3;
        #5 s = 1;
        #5 s = 0;
        #100 $finish;
    end

    initial
    begin
        $monitor("[%g] reset = %b, s = %b, fr = %h, %h, %h, %h", $time, reset, s, fr1, fr2, fr3, dfr);
    end

    initial
    begin
        $dumpfile("test.vcd");
        $dumpvars(0, tb);
    end
endmodule
