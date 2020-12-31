module top_module(
        input clk,
        input load,
        input [511:0] data,
        output reg [511:0] q ); 

    always @(posedge clk) begin
        if (load)
            q <= data;
        else begin
            q[0] <= 1'b0 ^ q[1];
            q[511] <= q[510] ^ 1'b0;
            for (integer i = 1; i <= 510; i = i + 1) begin
                q[i] <= q[i - 1] ^ q[i + 1];
            end
        end

    end
endmodule

