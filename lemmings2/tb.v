`timescale 1ps/1ps
module tb;

    reg clk = 1'b0;

    always #1 clk = ~clk;

    reg areset = 1'b0;

    reg bump_left = 1'b0, bump_right = 1'b0, ground=1'b1;

    wire walk_left, walk_right, aaah;

    top_module top(
        clk,
        areset,
        bump_left,
        bump_right,
        ground,
        walk_left,
        walk_right,
        aaah
        );
    initial
    begin
        areset = 1'b0;
        #4 areset = 1'b1;
        #4 areset = 1'b0;
        #3 bump_right = 1;
        #2 bump_right = 0;
        #4 bump_left = 1;
        #2 bump_left = 0;
        #5 bump_left = 1;
           bump_right = 1;
        #4 bump_left = 0;
           bump_right = 0;

        #4 ground = 0;
        #4 ground = 1;

        #100 $finish;
    end

    initial
    begin
        $monitor("[%g] areset = %b, bump_left=%b, bump_right=%b, walk_left=%b, walk_right=%b, ground=%b, aaah=%b",
            $time, areset, bump_left, bump_right, walk_left, walk_right, ground, aaah);
    end

    initial
    begin
        $dumpfile("test.vcd");
        $dumpvars(0, tb);
    end
endmodule
