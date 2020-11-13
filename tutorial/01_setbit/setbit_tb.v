//-- Test bench module
module setbit_tb;

	//-- Cable for connecting the output pin to setbit
	//-- We could give it ANY name, but we call it A (like the setbit pin)
	wire A;

	//-- Place the component (it's actually called "instance") and
	//-- connect the A cable to the A pin.
	setbit setbit_module (
	 .A (A)
	);

	//-- Begin the test (Checking block)
	initial begin

		//-- Define a file to dump all the data.
		$dumpfile("setbit_tb.vcd");

		//-- Dump all the data into that file when simulation finishes
		$dumpvars(0, setbit_tb);

		//-- After 10 time units, check if the cable is high.
		//-- In case of not being high, report the problem but
		//-- don't stop the simulation.
		# 10 if (A != 1)
			   $display("---->¡ERROR! Output is not 1");
			 else
			   $display("Component ok!");

	  //-- End simulation 10 time units after checking
	  # 10 $finish;
	end
endmodule
