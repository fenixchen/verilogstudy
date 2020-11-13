//-----------------------------------
//-- Input: clock signal
//-- Output: 26-bit counter
//-----------------------------------
module counter(input clk, output [25:0] data);
wire clk;
    
//-- Output is 26-bit bus, initialized at 0
reg [25:0] data = 0;
    
//-- Sensitive to rising edge
always @(posedge clk) begin
  //-- Incrementar el registro
  data <= data + 1;
end
endmodule
