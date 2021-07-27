`timescale 1ps/1ps
module tb;

    reg clk = 1'b0;

    reg reset = 1'b0;

    reg in = 1'b0;

    always #2 clk = ~clk;

    wire out;

    top_module top(
        clk,
        in,
        reset,
        out);

    initial
    begin
        reset = 1'b0;
        #5 reset = 1'b1;
        #5 reset = 1'b0;
        #5 in = 1'b0;
        #5 in = 1'b1;
        #5 in = 1'b0;
        #5 in = 1'b1;
        #100 $finish;
    end

    initial
    begin
        $monitor("[%g] reset = %b, in = %b, out = %h", $time, reset, in, out);
    end

    initial
    begin
        $dumpfile("test.vcd");
        $dumpvars(0, tb);
    end
endmodule
