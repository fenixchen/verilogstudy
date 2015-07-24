`timescale 1ns/1ns
`define clk_cycle 50

module top;
    reg clk, reset;
    wire clk_out;
    always #`clk_cycle clk=~clk;
    initial
    begin
        clk = 0;
        reset = 1;
        #100 reset = 0;
        #100 reset = 1;
        #10000 $finish;
    end

    half_clk half_clk(reset, clk, clk_out);
    initial
    begin
        $monitor("[%d] clk = %d, reset = %d, equal = %d", $time, clk, reset, clk);
    end
    initial
    begin
        $dumpfile("dump.vcd");
        $dumpvars(0, top);
    end
endmodule
