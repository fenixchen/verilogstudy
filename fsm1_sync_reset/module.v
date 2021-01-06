// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    parameter A = 0;
    parameter B = 1;
    // Fill in state name declarations

    reg present_state, next_state;

    always @(posedge clk) begin
        if (reset) begin  
            present_state <= B;
            out <= 1; 
            // Fill in reset logic
        end else begin
            case (present_state)
                A: next_state = in == 1 ? A : B;
                B: next_state = in == 1 ? B : A;
            endcase

            // State flip-flops
            present_state = next_state;   

            case (present_state)
                A: out <= 0;
                B: out <= 1;
                // Fill in output logic
            endcase
        end
    end

endmodule
