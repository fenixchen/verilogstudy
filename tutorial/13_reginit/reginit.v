//-- reginit.v
module reginit(input wire clk, output wire [3:0] data);
    
//-- sequencer parameters:
parameter NP = 23;        //-- prescaler bits 
parameter INI = 4'b1100;  //-- value to initialize the state register to
    
//-- output clock from the prescaler
wire clk_pres;
    
//-- output of the register
reg [3:0] dout;
    
//-- input of the register
wire [3:0] din;
    
//-- select signal of the multiplexer
reg sel = 0;
    
//-- Register
always @(posedge(clk_pres))
  dout <= din;
    
//-- Connect the register to the output
assign data = dout;
    
//-- initialization multiplexer
assign din = (sel == 0) ? INI : ~dout;
    
//-- Inicializer
always @(posedge(clk_pres))
  sel <= 1;
    
//-- Prescaler
prescaler #(.N(NP))
  PRES (
    .clk_in(clk),
    .clk_out(clk_pres)
  );
    
endmodule
