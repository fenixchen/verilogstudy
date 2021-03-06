//-- counter_tb.v
module counter_tb();
    
//-- Register for generating the clock signal
reg clk = 0;
    
//-- Counter's output data
wire [25:0] data;

//-- Register for checking if the counter is counting properly
reg [25:0] counter_check = 1;
    
//-- Instantiating the counter
counter C1(
  .clk(clk),
  .data(data)
);
    
//-- Clock generator. 2 unit period
always #1 clk = ~clk;
    
//-- Counter value check
//-- Upon each rising edge, the counter's output is checked
//-- and it's incremented by the expected value
always @(negedge clk) begin
  if (counter_check != data)
    $display("-->ERROR!. Expected: %d. Read: %d",counter_check, data);
  else
    $display("Expected: %d. Read: %d",counter_check, data);
    
  counter_check <= counter_check + 1;
end
    
//-- Begin process
initial begin
    
  //-- File for storing the results
  $dumpfile("counter_tb.vcd");
  $dumpvars(0, counter_tb);
    
  //-- Reset check.
  # 0.5 if (data != 0)
          $display("ERROR! Counter is not 0!");
        else
          $display("Counter initialized. OK.");

  # 99 $display("END of simulation");
  # 100 $finish;
 end
endmodule
