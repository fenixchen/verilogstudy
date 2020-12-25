module our (reset, clk, counter);
    input reset;
	input clk;  // Clock is required to get initial activation
    output reg [7:0] counter;
	always @ (posedge clk)
	begin 
        if (reset)
            counter <= 0;
        else
            counter <= counter + 1;
		$display("counter: %d", counter); 
	end
endmodule

