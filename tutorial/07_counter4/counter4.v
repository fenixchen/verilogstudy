//-- counter4.v
module counter4(input clk, output [3:0] data);
wire clk;
reg [3:0] data = 0;
    
//-- Parameter for the prescaler
parameter N = 22;
    
//-- Output clock of the prescaler
wire clk_pres;
    
//-- Instantiate the prescaler of N bits
prescaler #(.N(N))
  pres1 (
    .clk_in(clk),
    .clk_out(clk_pres)
  );
    
//-- Increment the counter on each rising edge. 
always @(posedge(clk_pres)) begin
  data <= data + 1;
end
    
endmodule
