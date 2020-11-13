//-- Fichero Fport.v
module Fport(output [3:0] data);

    //-- Module output is a 4 wire bus.
    wire [3:0] data;

    //-- Output the value through that 4-bit bus.
    assign data = 4'b1010; //-- 4'hA

endmodule
