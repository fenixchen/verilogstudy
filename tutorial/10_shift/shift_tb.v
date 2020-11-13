module shift_tb();
    
//-- register for the clock signal
reg clk = 0;
    
//-- output data of the component
wire [3:0] data;
    
//-- Instantiate the component
shift #(.NP(2)) 
  SHIFT (
    .clk(clk),
    .data(data)
  );
    
//-- generate the clock with a 2 cycle period
always #1 clk = ~clk;
    
//-- start process
initial begin

	//-- file to store the results
	$dumpfile("shift_tb.vcd");
	$dumpvars(0, shift_tb);

	# 100 $display("FIN de la simulacion");
	$finish;

end
endmodule
