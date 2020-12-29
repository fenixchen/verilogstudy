module tb;

    reg clk = 0, resetn = 1;

    reg in;
    wire out;

    always #1 clk = ~clk;

    top_module top(
        clk,
        resetn,
        in,
        out); 
    
    initial
    begin
        in = 1'b1;
        #2 resetn = 0;
        #2 resetn = 1;
        #2 in = 1'b0;
        #2 in = 1'b1;
        #100 $finish;
    end

    initial
    begin
        $monitor("[%g] clk = %b, resetn =  %b, out = %b", $time, clk, resetn, out);
    end

    initial
    begin
        $dumpfile("test.vcd");
        $dumpvars(0, tb);
    end
endmodule
