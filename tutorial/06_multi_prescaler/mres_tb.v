//-- mpres_tb.v
module mpres_tb();
    
//-- Number of bits of the prescalers
parameter N0 = 1;
parameter N1 = 1;
parameter N2 = 2;
parameter N3 = 3;
parameter N4 = 4;
    
//-- Register to generate the clock signal
reg clk = 0;
    
//-- Output wires
wire D1, D2, D3, D4;
    
//-- Instantiate the component
mpres 
  //-- Establish parameters
  #(
     .N0(N0), 
     .N1(N1), 
     .N2(N2), 
     .N3(N3), 
     .N4(N4) 
  )
  //-- Connect the ports 
  dut(
    .clk_in(clk),
    .D1(D1),
    .D2(D2),
    .D3(D3),
    .D4(D4)
  );
    
//-- Clock generator. 2-unit period
always #1 clk = ~clk;
    
//-- Initialization block
initial begin
    
  //-- Result location
  $dumpfile("mres_tb.vcd");
  $dumpvars(0, mpres_tb);
      
  # 99 $display("FIN de la simulacion");
  # 100 $finish;
end
    
endmodule
