`include "baudgen.vh"

module baudtx2_tb();

//-- Registro para generar la señal de reloj
reg clk = 0;

//-- Linea de tranmision
wire tx;

//-- Simulacion de la señal dtr
reg dtr = 0;

//-- Instanciar el componente para que funcione a 115200 baudios
baudtx2 #(`B115200)
  dut(
    .clk(clk),
    .load(dtr),
    .tx(tx)
  );

//-- Generador de reloj. Periodo 2 unidades
always 
  # 1 clk <= ~clk;


//-- Proceso al inicio
initial begin

  //-- Fichero donde almacenar los resultados
  $dumpfile("baudtx2_tb.vcd");
  $dumpvars(0, baudtx2_tb);

  //-- Primer envio: cargar y enviar
  #10 dtr <= 0;
  #300 dtr <= 1;
 
  //-- Segundo envio
  #10000 dtr <=0;
  #2000 dtr <=1;

  //-- Tercer envio
  #10000 dtr <=0;
  #2000 dtr <=1;

  #5000 $display("FIN de la simulacion");
  $finish;
end

endmodule
