//-- mpres.v
module mpres(input clk_in, output D1, output D2, output D3, output D4);
wire clk_in;
wire D1;
wire D2;
wire D3;
wire D4;
    
//-- Component parameters
//-- Bits for the different prescalers
//-- Change these values according to the desired LED sequence
parameter N0 = 21;  //-- Prescaler base
parameter N1 = 1;
parameter N2 = 2;
parameter N3 = 1;
parameter N4 = 2;
    
//-- Wire with base clock signal: the output of prescaler 0
wire clk_base;
    
//-- Base prescaler. Connected to the input clock signal
//-- Its output is for clk_base
//-- It's N0 bits wide
prescaler #(.N(N0))  
  Pres0(
   .clk_in(clk_in),
   .clk_out(clk_base)
  );
    
//-- Channel 1: Prescaler of N1 bits, connexted to LED 1
prescaler #(.N(N1))
  Pres1(
    .clk_in(clk_base),
    .clk_out(D1)
  );
    
//-- Channel 2: Prescaler of N2 bits, connexted to LED 2
prescaler #(.N(N2))
  Pres2(
    .clk_in(clk_base),
    .clk_out(D2)
  );
    
//-- Channel 3: Prescaler of N3 bits, connexted to LED 3
prescaler #(.N(N3))
  Pres3(
    .clk_in(clk_base),
    .clk_out(D3)
  );
    
//-- Channel 4: Prescaler of N4 bits, connexted to LED 4
prescaler #(.N(N4))
  Pres4(
    .clk_in(clk_base),
    .clk_out(D4)
  );
    
endmodule
