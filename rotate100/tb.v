module tb;

    reg clk = 0, load = 0;
    reg [1:0] ena = 0;
    reg [99:0] data;
    wire [99:0] q;

    always #1 clk = ~clk;

    top_module top(
        clk,
        load,
        ena,
        data,
        q);
    
    initial
    begin
        //data = {{50{1'b1}}, {50{1'b0}}};
        data = {99'b0, 1'b1};

        #10 load = 1'b1;

        #10 load = 1'b0;

        #10 ena = 2'b01;

        #10 ena = 2'b10;

        #10 ena = 2'b00;

        #100 $finish;
    end

    initial
    begin
        $monitor("[%d] load = %b, ena = %b, data = %b, q=%b", $time, load, ena, data, q);
    end

    initial
    begin
        $dumpfile("test.vcd");
        $dumpvars(0, tb);
    end
endmodule
