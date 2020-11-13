//-- counter4_tb.v
module counter4_tb();
    
//-- register to generate the clock signal
reg clk = 0;
    
//-- output data from the counter
wire [3:0] data;
    
//-- register for checking the counter
reg [3:0] counter_check = 0;
    
//-- instantiate the counter, with 1 bit prescaler during simulation
counter4 #(.N(1))
  C1(
    .clk(clk),
    .data(data)
  );

//-- clock generator with 2 cycle period
always #1 clk = ~clk;
    
//-- Check Process. Every time there's a change in 
//-- the counter, the design value is checked against the expected value
always @(data) begin
    
  if (counter_check != data)
    $display("-->ERROR!. Expected: %d. Actual: %d",counter_check, data);
    
  counter_check = counter_check + 1;
end
    
//-- Start Process
initial begin
    
  //-- result file
  $dumpfile("counter4_tb.vcd");
  $dumpvars(0, counter4_tb);
    
  //-- check the reset
  # 0.5 if (data != 0)
          $display("ERROR! Counter is NOT 0!");
        else
	  $display("Counter initialized. OK.");
    
 # 99 $display("End of the simulation");
 # 100 $finish;
end
    
endmodule
