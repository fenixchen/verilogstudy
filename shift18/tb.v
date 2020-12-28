module tb;

    reg clk = 0, load;
    reg ena;
    reg [1:0] amount;

    reg [63:0] data;
    wire [63:0] q;

    always #1 clk = ~clk;

    top_module shift(
        clk,
        load,
        ena,
        amount,
        data,
        q); 
    
    initial
    begin
        //data = {{50{1'b1}}, {50{1'b0}}};
        data = {63'b0, 1'b1};

        amount = 2'b00;

        #10 load = 1'b1;

        #10 load = 1'b0;

        #10 ena = 1'b1;

        #10 amount = 2'b01;

        #10 amount = 2'b10;

        #10 amount = 2'b11;

        #10 ena = 0;

        #10 data = {1'b1, 63'b0};

        #10 amount = 2'b10;

        #10 load = 1'b1;

        #10 load = 1'b0;

        #10 ena = 1'b1;

        #10 amount = 2'b11;
        #100 $finish;
    end

    initial
    begin
        $monitor("[%d] load = %b, ena = %b, amount = %b, data = %b, q=%b", $time, load, ena, amount, data, q);
    end

    initial
    begin
        $dumpfile("test.vcd");
        $dumpvars(0, tb);
    end
endmodule
