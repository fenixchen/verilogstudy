//-- echowire2.v
module echowire2(input wire dtr,
                 input wire rts,
                 input wire rx,
                 input wire tx2,
                 output wire tx,
                 output wire rx2,
                 output wire D1,
                 output wire D2);

//-- Sacar senal dtr y rts por los leds
assign D1 = dtr;
assign D2 = rts;

//-- Sacar señales tx y rx al exterior
assign rx2 = rx;
assign tx = tx2;

endmodule
