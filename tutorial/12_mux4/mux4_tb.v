module mux4_tb;

    reg clk = 0;

    always  #1 clk = ~clk;

    wire [3:0] data;

    mux4 #(.NP(2))
        mux4_inst(
            .clk(clk),
            .data(data)
        );

    initial
    begin
        $dumpfile("mux4_tb.vcd");
        $dumpvars(0, mux4_tb);

        # 400 $finish;
    end


endmodule
