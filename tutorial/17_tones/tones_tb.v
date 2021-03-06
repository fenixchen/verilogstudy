//-- tones_tb.v
module tones_tb();

//-- Registro para generar la señal de reloj
reg clk = 0;

//-- Salidas de los canales
wire ch0, ch1, ch2, ch3;

//-- Instanciar el componente y establecer el valor del divisor
//-- Se pone un valor bajo para simular (de lo contrario tardaria mucho)
tones #(3, 5, 7, 10)
  dut(
    .clk(clk),
    .ch0(ch0),
    .ch1(ch1),
    .ch2(ch2),
    .ch3(ch3)
  );

//-- Generador de reloj. Periodo 2 unidades
always 
  # 1 clk <= ~clk;

localparam A = $clog2(1024);

//-- Proceso al inicio
initial begin

  //-- Fichero donde almacenar los resultados
  $dumpfile("tones_tb.vcd");
  $dumpvars(0, tones_tb);

  $display("A=%d\n", A);

  # 100 $display("FIN de la simulacion");
  $finish;
end

endmodule
