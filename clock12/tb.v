module tb;

    reg clk = 0, reset = 1, ena = 1;
    wire pm;
    wire [7:0] hh, mm, ss;

    always #1 clk = ~clk;
    top_module top(
        clk,
        reset,
        ena,
        pm,
        hh,
        mm,
        ss);
    
    initial
    begin
        reset = 1;
        ena = 1;
        #5 reset = 0;

        #10 $display("%d, %b", $time, reset);

        #400000 $finish;
    end

    initial
    begin
        //$monitor("[%d] clk=%b, pm = %b, hh = %d, mm = %d, ss = %d", $time, clk, pm, hh, mm, ss);
    end

    initial
    begin
        $dumpfile("test.vcd");
        $dumpvars(0, tb);
    end
endmodule
