//-- inv_tb.v
module inv_tb();

//-- 1-bit register connected to the inverter's input
reg din;

//-- Wire connected to the inverter's output
wire dout;

reg [3:0] din2;
wire [3:0] dout2;

//-- Instantiate the inverter, connecting din to the input A, and dout to the output B
inv NOT1 (
 .A (din),
 .B (dout),
 .C (din2),
 .D (dout2)
);

//-- Begin test
initial begin

  //-- File to store the results
  $dumpfile("inv_tb.vcd");
  $dumpvars(0, inv_tb);

  //-- We put the input of the inverter to 0
  #5 din = 0;

  #1 din2 = 3;

  //-- After 5 time units, we check the output.
  # 5 if (dout != 1)
        $display("---->¡ERROR! Esperado: 1. Leido: %d", dout);

  //-- After another 5 time units, we change the input
  # 5 din = 1;
 
  //-- After 5 time units more, we check whether there is a 0 coming out the output
  # 5 if (dout != 0)
        $display("---> ¡ERROR! Esperado: 0. Leido: %d", dout);

  # 5 din2 = din2 + 1;
      $display("din2:%d, dout2:%d", din2, dout2);

  # 5 $display("done");
  # 10 $finish;
end
endmodule
