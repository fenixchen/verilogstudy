module tb;

    reg clk = 1'b0;

    reg areset = 1'b0;

    always #1 clk = ~clk;

    reg j = 1'b0;
    reg k = 1'b0;

    wire out;

    top_module top(
        clk,
        areset,
        j,
        k,
        out); 
    
    initial
    begin
        areset = 1'b0;
        #5 areset = 1'b1;
        #5 areset = 1'b0;
        #5 j = 1'b0;
        #5 k = 1'b1;
        #5 j = 1'b1;
        #5 k = 1'b1;
        #5 j = 1'b0;
        #5 k = 1'b1;
        #100 $finish;
    end

    initial
    begin
        $monitor("[%g] areset = %b, j = %b, k = %b out = %h", $time, areset, j, k, out);
    end

    initial
    begin
        $dumpfile("test.vcd");
        $dumpvars(0, tb);
    end
endmodule
