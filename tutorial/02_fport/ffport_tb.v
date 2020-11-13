//-- Fport_tb.v
module Fport_tb;

//-- 4-wire bus, to connect it to the Fport component output.
wire [3:0] DATA;

//--Instantiating the component. Connect output to DATA.
Fport FP1 (
  .data (DATA)
);

//-- Begin the test
initial begin

  //-- File in which store the results.
  $dumpfile("fport_tb.vcd");
  $dumpvars(0, Fport_tb);

  //-- After 10 time units we check
  //-- whether the cable has the previously given pattern or not.
  # 10 if (DATA != 4'b1010)
		 $display("---->¡ERROR! Salida Erronea");
	   else
		 $display("Componente ok!");

  //-- Finish the simulation 10 time units after that.
  # 10 $finish;
end

endmodule
