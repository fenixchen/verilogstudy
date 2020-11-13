module mux2_tb;


reg clk = 0;

wire [3:0] data;

mux2 #(.NP(2), .VAL0(9), .VAL1(13)) 
    MUX(.clk(clk),
        .data(data)
    );

    
always #1 clk = ~clk;

initial
    begin
        $dumpfile("mux2_tb.vcd");
        $dumpvars(0, mux2_tb);
        # 100 $finish;
    end


endmodule
