module tb;

    reg [2:0] SW = 3'b0;
    reg [1:0] KEY = 2'b1;

    wire [2:0] LEDR;

    always #1 KEY[0] = ~KEY[0];

    top_module top(
            SW,
            KEY,
            LEDR);
    
    initial
    begin
        SW = 3'b1;
        KEY[1] = 1'b1; 
        #10 KEY[1] = 1'b0;
        #100 $finish;
    end

    initial
    begin
        $monitor("[%g] SW =  %b,  KEY = %b, LEDR = %b", $time,  SW, KEY, LEDR);
    end

    initial
    begin
        $dumpfile("test.vcd");
        $dumpvars(0, tb);
    end
endmodule
