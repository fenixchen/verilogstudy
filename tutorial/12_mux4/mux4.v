//-- mux4.v
module mux4(input wire clk, output reg [3:0] data);
    
//-- Parametros del secuenciador:
parameter NP = 23;         //-- Bits of the prescaler
parameter VAL0 = 4'b1000;  //-- sequence value 0
parameter VAL1 = 4'b1001;  //-- sequence value 1
parameter VAL2 = 4'b1010;  //-- sequence value 2
parameter VAL3 = 4'b1011;  //-- sequence value 3
    
//-- wires for the 5 inputs to the multiplexer
wire [3:0] val0;
wire [3:0] val1;
wire [3:0] val2;
wire [3:0] val3;
wire [1:0] sel;  //-- 2 bits of selection. 
    
//-- 2 bit counter
reg [1:0] count = 0;
wire clk_pres; //-- output clock of the prescaler 
    
//-- wire the constants to the inputs of the mux. 
assign val0 = VAL0;
assign val1 = VAL1;
assign val2 = VAL2;
assign val3 = VAL3;
    
//-- implement the 4 to 1 multiplexer 
always @*
  case (sel)
     0 : data <= val0;
     1 : data <= val1;
     2 : data <= val2;
     3 : data <= val3;
     default : data <= 0;
  endcase
    
//-- counter to drive the sel wire 
always @(posedge(clk_pres))
  count <= count + 1;
     
//-- drive the sel wire with the counter value
assign sel = count;
    
//-- prescaler that controls the counter frequency
prescaler #(.N(NP))
  PRES (
    .clk_in(clk),
    .clk_out(clk_pres)
  );
    
endmodule
