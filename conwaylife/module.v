module top_module(
        input clk,
        input load,
        input [255:0] data,
        output reg [255:0] q ); 

    reg [3:0] p_row, p_col, n_row, n_col;
    reg [3:0] count;
    reg [255:0] q_out;
    reg [255:0] q_2d;

    always @(*) begin
        q_2d = q;
        for (integer row = 0; row < 16; row = row + 1) begin
            for (integer col = 0; col < 16; col = col + 1) begin
                p_row = row == 0 ? 4'd15 : row - 1;
                n_row = row == 15 ? 4'd0 : row + 1;
                p_col = col == 0 ? 4'd15 : col - 1;
                n_col = col == 15 ? 4'd0 : col + 1;

                count = q_2d[p_row * 16 + p_col] + q_2d[p_row * 16 + col] + q_2d[p_row * 16 + n_col]
                      + q_2d[row * 16 + p_col]   +                 q[row * 16 + n_col]
                      + q_2d[n_row * 16 + p_col] + q_2d[n_row * 16 + col] + q_2d[n_row * 16 + n_col];

                case (count) 
                    4'd2: q_out[(row << 4) + col] = q_2d[row * 16 + col];
                    4'd3: q_out[(row << 4) + col] = 1;
                    default: q_out[row * 16+ col] = 0;
                endcase
            end
        end
    end


    always @(posedge clk) begin
        if (load) begin
            q <= data;
        end
        else begin
            q <= q_out;
        end
    end
endmodule
