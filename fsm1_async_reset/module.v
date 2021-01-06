module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        if (state == A) begin
            if (in == 1'b1)
                next_state = A;
            else
                next_state = B;
        end
        else if (state == B) begin
            if (in == 1'b1) 
                next_state = B;
            else
                next_state = A;
        end
    end

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
		if (areset)
			state <= B;
		else
			state <= next_state;
    end

	assign out = state == B;
    // Output logic
    // assign out = (state == ...);

endmodule
