//-- reginit_tb.v
module reginit_tb();
    
//-- Register for the clock
reg clk = 0;
    
//-- data from the component
wire [3:0] data;

//-- Instantiate the component with prescaler set to 1
reginit #(.NP(1))
  dut(
   .clk(clk),
   .data(data)
  );
    
//-- generate the clock
always #1 clk = ~clk;
    
//-- initialization process
initial begin
    
  //-- files for the results
  $dumpfile("reginit_tb.vcd");
  $dumpvars(0, reginit_tb);
    
  # 30 $display("FIN de la simulacion");
  $finish;
end
endmodule
