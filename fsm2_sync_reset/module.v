module top_module(
    input clk,
    input reset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
		case(state)
			ON:  next_state = k == 0 ? ON : OFF;
			OFF: next_state = j == 0 ? OFF: ON;
		endcase
        // State transition logic
    end

    always @(posedge clk) begin
		if (reset)
			state <= OFF;
		else
			state <= next_state;
    end

    // Output logic
    assign out = (state == ON);

endmodule
