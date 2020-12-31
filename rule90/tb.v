module tb;

    reg clk = 1'b0;

    reg load = 1'b0;

    always #1 clk = ~clk;

    reg [511:0] data;

    wire [511:0] q;

    top_module top(
        clk,
        load,
        data,
        q); 
    
    initial
    begin
        data = {1'b1, {510{1'b0}}, 1'b1};
        load = 1'b1;
        #10 load = 1'b0;
        #100 $finish;
    end

    initial
    begin
        $monitor("[%g] load = %b, data = %h, q = %h", $time, load, data, q);
    end

    initial
    begin
        $dumpfile("test.vcd");
        $dumpvars(0, tb);
    end
endmodule
