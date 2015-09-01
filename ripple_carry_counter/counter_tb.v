module COUNTER_TB;

reg clk;
reg reset;
wire[3:0] q;

COUNTER counter(q, clk, reset);

initial
    clk = 1'b0;
always
    #5 clk = ~clk;


initial
begin
    reset = 1'b1;
    #15 reset=1'b0;
    #180 reset=1'b1;
    #10 reset=1'b0;
    #20 $finish;    
end

initial
    $monitor($time, " Output q=%d", q);

initial
begin
    $dumpfile("dump.vcd");
    $dumpvars(0, COUNTER_TB);
end

endmodule
