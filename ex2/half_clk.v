module half_clk(reset, clk_in, clk_out);
    input clk_in, reset;
    output clk_out;
    reg clk_out;
    reg[7:0] clk_cnt;
    always @(negedge clk_in)
    begin
	    if (!reset) begin clk_out = 0; clk_cnt = 0; end
	    else begin clk_out = ~clk_out; clk_cnt = clk_cnt + 1; end
    end
endmodule
