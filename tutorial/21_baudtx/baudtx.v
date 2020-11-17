//-- Fichero: baudtx.v
`default_nettype none

`include "baudgen.vh"

//--- Modulo que envia un caracter cunado load esta a 1
module baudtx(input wire clk,       //-- Reloj del sistema (12MHz en ICEstick)
              input wire load,      //-- Señal de cargar / desplazamiento
              output wire tx        //-- Salida de datos serie (hacia el PC)
             );

//-- Parametro: velocidad de transmision
parameter BAUD =  `B115200;

//-- Registro de 10 bits para almacenar la trama a enviar:
//-- 1 bit start + 8 bits datos + 1 bit stop
reg [9:0] shifter;

//-- Reloj para la transmision
wire clk_baud;

//-- Registro de desplazamiento, con carga paralela
//-- Cuando DTR es 0, se carga la trama
//-- Cuando DTR es 1 se desplaza hacia la derecha, y se 
//-- introducen '1's por la izquierda
always @(posedge clk_baud)
  if (load == 0) 
  begin
    shifter <= {"K",2'b01}; //K = 01001011
    // shifter = 01001011_01
    $display("tx bit:%d", shifter[0]);
  end
  else
  begin
    //shifter = 01001011_0
    shifter <= {1'b1, shifter[9:1]};
    $display("tx bit:%d", shifter[0]);
  end

//-- Sacar por tx el bit menos significativo del registros de desplazamiento
//-- Cuando estamos en modo carga (dtr == 0), se saca siempre un 1 para 
//-- que la linea este siempre a un estado de reposo. De esta forma en el 
//-- inicio tx esta en reposo, aunque el valor del registro de desplazamiento
//-- sea desconocido
assign tx = (load) ? shifter[0] : 1;

//-- Divisor para obtener el reloj de transmision
divider #(BAUD)
  BAUD0 (
    .clk_in(clk),
    .clk_out(clk_baud)
  );

endmodule
