//-- inv.v
//-- Component has an input (A) and an output (B)
module inv(input A, output B, input [3:0] C, output [3:0] D);

//-- Both the input and the output are "wires"
wire A;
wire B;
wire C;
wire D;

//-- Assign the inverse of the input, to the output
assign B = ~A;
assign D = C + 1;

endmodule
