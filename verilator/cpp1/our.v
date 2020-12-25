module our(input clk,
    input d,
    output reg q);
    
    always @(posedge clk) begin
        q <= d;
    end
	initial 
	begin 
		$display("Hello World"); 
		$finish; 
	end
endmodule
