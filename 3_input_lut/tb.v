module tb;

    reg clk = 1'b0;
    reg S, A, B, C;
    reg enable;
    wire Z;

    always #1 clk = ~clk;

    top_module top(
        clk, enable, S, A, B, C, Z
    );
    
    initial
    begin
        enable = 1'b1;
        A = 1'b0;
        B = 1'b0;
        C = 1'b0;

        S = 1'b0;
        #2 S = 1'b1;
        #2 S = 1'b0;

        #100 $finish;
    end

    initial
    begin
        $monitor("[%g] clk = %b, enable =  %b, S = %b, A = %b, B = %b, C = %b, Z = %b", 
            $time, clk, enable, S, A, B, C, Z);
    end

    initial
    begin
        $dumpfile("test.vcd");
        $dumpvars(0, tb);
    end
endmodule
