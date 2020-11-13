//-- shift4.v
module shift(input wire clk, output reg [3:0] data);
    
//-- parameters of the sequencer
parameter NP = 5;  //-- Bits of the prescaler
parameter INI = 1;  //-- initial value to load into the shift register
    
//-- clock from the prescaler
wire clk_pres;
    
//-- Shift / load. Signal indicating whether the register is loaded or shifted
//-- shift = 0: load
//-- shift = 1: shifted
reg load_shift = 0;
    
//-- serial input of the register
wire serin;
    
//-- Instantiate the N bit prescaler
prescaler #(.N(NP))
  pres1 (
    .clk_in(clk),
    .clk_out(clk_pres)
  );
    
//-- Initializer
always @(posedge(clk_pres)) begin
    load_shift <= 1;
end
    
//-- shift register
always @(posedge(clk_pres)) begin
  if (load_shift == 0)  //-- Load mode
    data <= INI;
  else
    data <= {data[2:0], serin};
end
    
//-- assign the MSB to the serial input to create a ring
assign serin = data[3];
    
endmodule
