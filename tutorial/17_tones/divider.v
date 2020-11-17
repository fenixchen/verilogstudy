//-- divider.v
//-- Incluir constantes definidas para este componente
`include "divider.vh"
    
//-- Entrada: clk_in. Señal original
//-- Salida: clk_out. Señal de frecuencia 1/M de la original
module divider(input wire clk_in, output wire clk_out);
    
//-- Valor por defecto del divisor
//-- Lo ponemos a 1 Hz (Constantes definidas en divider.vh)
parameter M = `F_1Hz;
    
//-- Numero de bits para almacenar el divisor
//-- Se calculan con la funcion de verilog $clog2, que nos devuelve el 
//-- numero de bits necesarios para representar el numero M
//-- Es un parametro local, que no se puede modificar al instanciar
localparam N = $clog2(M);
    
//-- Registro para implementar el contador modulo M
reg [N-1:0] divcounter = 0;
    
//-- Contador módulo M
always @(posedge clk_in)
  divcounter <= (divcounter == M - 1) ? 0 : divcounter + 1;
    
//-- Sacar el bit mas significativo por clk_out
assign clk_out = divcounter[N-1];
    
endmodule
