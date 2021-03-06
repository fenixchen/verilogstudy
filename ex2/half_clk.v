module half_clk(reset, clk_in, clk_out);
    input clk_in, reset;
    output clk_out;
    reg clk_out;
    reg[7:0] clk_cnt;
    reg clk_copy;
    always @(negedge clk_in)
    begin
	    if (!reset) begin clk_out <= 0; clk_cnt <= 0; end
	    else begin clk_out <= ~clk_out; clk_cnt <= clk_cnt + 1; end
    end

    always @(clk_in) clk_copy <= clk_in;

    reg[7:0] ccc;
    reg[7:0] ddd;
    always @(posedge clk_in)
    begin
	    if (!reset) begin ccc <= 0; ddd <= 0; end
	    else begin 
		    if (clk_in) ccc <= ccc + 1;
		    if (clk_copy) ddd <= ddd + 1; 
	    end
    end 
endmodule
