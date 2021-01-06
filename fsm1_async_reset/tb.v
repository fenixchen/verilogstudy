module tb;

    reg clk = 1'b0;

    reg areset = 1'b0;

    always #1 clk = ~clk;

    reg in = 1'b0;

    wire out;

    top_module top(
        clk,
        areset,
        in,
        out); 
    
    initial
    begin
        areset = 1'b0;
        #5 areset = 1'b1;
        #5 areset = 1'b0;
        #5 in = 1'b0;
        #5 in = 1'b1;
        #5 in = 1'b1;
        #5 in = 1'b1;
        #5 in = 1'b0;
        #5 in = 1'b1;
        #100 $finish;
    end

    initial
    begin
        $monitor("[%g] areset = %b, in = %h, out = %h", $time, areset, in, out);
    end

    initial
    begin
        $dumpfile("test.vcd");
        $dumpvars(0, tb);
    end
endmodule
