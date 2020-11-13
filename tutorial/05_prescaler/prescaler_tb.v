//-- prescaler_tb.v
module prescaler_tb();
    
//-- Number of bits of the tested prescaler
parameter N = 4;
    
//-- Register for generating the clock signal
reg clk = 0;
    
//-- Prescaler output
wire clk_out;
    
//-- Register for checking if the prescaler works
reg [N-1:0] counter_check = 0;
    
//-- Instantiate the N-bit prescaler
prescaler #(.N(N))  //-- N parameter
  Pres1(
    .clk_in(clk),
    .clk_out(clk_out)
  );
    
//-- Clock generator. 2 time units period
always #1 clk = ~clk;

//-- Counter value check
//-- Each falling edge, the counter output is checked.
//-- and the expected value is increased
always @(negedge clk) begin
    
  //-- Increase the check counter value
  counter_check = counter_check + 1;
    
  //-- The most significant bit must be the same as clk_out
  if (counter_check[N-1] != clk_out) begin
    $display("--->ERROR! Prescaler is malfunctioning");
    $display("Clk out: %d, counter_check[2]: %d", 
              clk_out, counter_check[N-1]);
  end
    
end
    
//-- Begin process
initial begin
    
  //-- File to store the results
  $dumpfile("prescaler_tb.vcd");
  $dumpvars(0, prescaler_tb);
    
  # 99 $display("END of simulation");
  # 100 $finish;
end
endmodule
