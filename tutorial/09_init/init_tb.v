//-- init_tb.v
module init_tb();
    
//-- register for the clock signal
reg clk = 0;
    
//-- output data of the component
wire ini;
    
//-- Instantiate the component
init 
  INIT (
    .clk(clk),
    .ini(ini)
  );
    
//-- generate the clock with a 2 cycle period
always #2 clk = ~clk;
    
//-- start process
initial begin

	//-- file to store the results
	$dumpfile("init_tb.vcd");
	$dumpvars(0, init_tb);

    # 1 if (ini != 1)
            $display("%-20t init failed", $time);
         else
            $display("%-20t init OK", $time);
    # 50 if (ini != 1)
            $display("%-20t init failed", $time);
         else
            $display("%-20t init OK", $time);
	# 100 $display("FIN de la simulacion");
	$finish;

end
endmodule
