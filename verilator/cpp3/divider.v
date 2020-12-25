module divider(input clk,
    output clk_o);

    parameter DIV = 4;

    reg [7:0] counter = 0;

    assign clk_o = counter == DIV - 1;

    always @(posedge clk) begin
        if (counter == DIV - 1)
            counter <= 0;
        else
            counter <= counter + 1;
    end

endmodule
