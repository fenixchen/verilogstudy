module tb;

    reg clk = 0, reset = 0;

    wire [31:0] q;

    always #1 clk = ~clk;

    top_module top(
        clk,
        reset,
        q); 
    
    initial
    begin
        #10 reset = 1;
        #10 reset = 0;
        #100 $finish;
    end

    initial
    begin
        $monitor("[%d] reset =  %b, q = %b", $time, reset, q);
    end

    initial
    begin
        $dumpfile("test.vcd");
        $dumpvars(0, tb);
    end
endmodule
