`define SHIFT_LEFT  2'b10

`define SHIFT_RIGHT 2'b01

module top_module(
        input clk,
        input load,
        input [1:0] ena,
        input [99:0] data,
        output reg [99:0] q);  
    always @(posedge clk) begin
        if (load)
            q <= data;
        else if (ena == `SHIFT_LEFT)
            q <= {q[98:0], q[99]};
        else if (ena == `SHIFT_RIGHT)
            q <= {q[0], q[99:1]};
        else
            q <= q;
    end
endmodule
