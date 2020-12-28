`define SHIFT_LEFT_1   2'b00
`define SHIFT_LEFT_8   2'b01
`define SHIFT_RIGHT_1  2'b10
`define SHIFT_RIGHT_8  2'b11

module top_module(
        input clk,
        input load,
        input ena,
        input [1:0] amount,
        input [63:0] data,
        output reg [63:0] q); 

    always @(posedge clk) begin
        if (load)
            q <= data;
        else if (ena) begin
            if (amount == `SHIFT_LEFT_1)
                q <= {q[62:0], 1'b0};
            else if (amount == `SHIFT_LEFT_8)
                q <= {q[55:0], 8'b0};
            else if (amount == `SHIFT_RIGHT_1)
                q <= {{2{q[63]}}, q[62:1]}; //62-1+1 + 2
            else
                q <= {{9{q[63]}}, q[62:8]}; //62-8+1 + 9
        end
        else
            q <= q;
    end
endmodule
