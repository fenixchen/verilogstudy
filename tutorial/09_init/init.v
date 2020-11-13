//-- init.v (natural implementation)
//-- input: clock 
//-- output: initialization signal 
module init(input wire clk, output wire ini);


    parameter delay = 4;

    wire clk_base;

    prescaler #(.N(delay))
        scaler(
            .clk_in(clk),
            .clk_out(clk_base)
        );

    //-- register input 
    wire din;
        
    //-- register output (initialized to 0 in simulation) 
    //-- For synthesis, initializations cannot be non-zero.
    reg dout = 0;

    //-- generic rising edge clock register 
    always @(posedge(clk_base))
      dout <= din;
        
    //-- assign 1 to the input
    assign din = 1;
        
    //-- connect the register output to the module output
    assign ini = dout;
    
endmodule
