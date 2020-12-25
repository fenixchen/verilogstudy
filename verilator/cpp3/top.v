module top(input clk, input reset, output reg [7:0] q);
    wire clk_o;

    divider #(5) div(.clk(clk), .clk_o(clk_o));

    counter cnt(.clk(clk_o), .reset(reset), .q(q)); 

endmodule;
