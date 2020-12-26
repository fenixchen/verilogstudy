module time_counter(input clk, 
                    input reset,
                    input ena,
                    output reg [7:0] q);
    parameter MAX = 8'd59;
    parameter INIT = 8'd0;
    parameter RESET = 8'd0;
    always @(posedge clk) begin
        if (reset)
            q <= INIT;
        else if (ena) begin            
            if (q == MAX)
                q = RESET;
            else if (q[3:0] == 4'd9) begin
                q[7:4] <= q[7:4] + 4'b1;
                q[3:0] <= 0;
            end
            else
                q <= q + 8'd1;
        end
        
        else
            q <= q;
    end
endmodule

module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 

    wire [7:0] hh24;
    
    wire ena_mm = ena && ss == 8'h59;

    wire ena_hh = ena && ss == 8'h59 && mm == 8'h59;

    assign pm = hh24 >= 8'h12 && hh24 != 8'h24;
    assign hh = hh24 <= 8'h12 ? hh24 : 
        hh24[3:0] >= 4'd2 ? hh24 - 8'h12:
        {4'b0, 4'd8 + hh24[3:0]};

    time_counter #(.MAX(8'h59), .INIT(8'h00)) t_ss(clk, reset, ena, ss);
    time_counter #(.MAX(8'h59), .INIT(8'h00)) t_mm(clk, reset, ena_mm, mm);
    time_counter #(.MAX(8'h24), .INIT(8'h24), .RESET(8'd1)) t_hh(clk, reset, ena_hh, hh24);
	
endmodule
