`timescale 1ns/10ps
 
module clk_rst(
  i_clk,
  i_rst_n
);

output i_clk;
output i_rst_n;

reg i_clk;
reg i_rst_n;


parameter CLK_PERIOD = 20;
parameter MULT_RATIO = 10;
parameter RESET_TIME = MULT_RATIO * CLK_PERIOD + 1;
 
initial
begin
  i_rst_n <= 1'b0;
  #RESET_TIME i_rst_n <= 1'b1;
end
 
initial
begin
  i_clk <= 1'b0;
  forever
    #(CLK_PERIOD / 2) i_clk <= ~i_clk;
end
 
endmodule