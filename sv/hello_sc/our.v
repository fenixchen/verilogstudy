module our (clk, counter);
	input clk;  // Clock is required to get initial activation
    output reg [7:0] counter;
	always @ (posedge clk)
	begin 
        counter <= counter + 1;
		$display("counter: %d", counter); 
	end
endmodule

