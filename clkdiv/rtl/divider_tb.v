`timescale 1ns/10ps
 
module divider_tb();
 
wire i_clk;
wire i_rst_n;
wire o_clk;
 
// genrate clock
clk_rst clk_rst_inst(
  .i_clk(i_clk),
  .i_rst_n(i_rst_n)
);
 
// user logic
divider divider_inst(
  .i_clk(i_clk),
  .i_rst_n(i_rst_n),
  .o_clk(o_clk)
);
 
// dump fsdb file for debussy
initial
begin
  $fsdbDumpfile("wave.fsdb");
  $fsdbDumpvars;
end
 
endmodule