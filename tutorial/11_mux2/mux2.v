//-- mux2.v
module mux2(input wire clk, output reg [3:0] data);
    
//-- Parametros del secuenciador:
parameter NP = 22;         //-- Bits del prescaler
parameter VAL0 = 4'b1010;  //-- Valor secuencia 0
parameter VAL1 = 4'b0101;  //-- Valor secuencia 1
    
//-- wires of the three inputs of the multiplexer 
wire [3:0] val0;
wire [3:0] val1;
wire sel;
    
//-- for the inputs of the mux we wire the input data; 
assign val0 = VAL0;
assign val1 = VAL1;
    
//-- Implementation of the multiplexer
always @(sel or val0 or val1)
  if (sel==0)
    data <= val0;
  else
    data <= val1;
    
//-- Prescaler to control the select signal of the multiplexer
prescaler #(.N(NP))
  PRES (
    .clk_in(clk),
    .clk_out(sel)
  );
    
endmodule
