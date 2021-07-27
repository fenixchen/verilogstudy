module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output reg dfr
);
    reg [1:0] state , next_state;
    reg [2:0] outfr;

    parameter
        t1 = 2'b00,
        t2 = 2'b01,
        t3 = 2'b10,
        t4 = 2'b11;

    assign {fr3,fr2,fr1} = outfr;

    always @(posedge clk) begin
        if (reset)
            state <= t1;
        else
            state <= next_state;
    end

    always @(*) begin
        next_state = t1;
        case(s)
            3'b000:next_state = t1;
            3'b001:next_state = t2;
            3'b011:next_state = t3;
            3'b111:next_state = t4;
            default:next_state = t1;
        endcase
    end

    always@(posedge clk)begin
        if(reset)
        	outfr <= 3'b111;
        else begin
            case(next_state)
                t1:outfr <= 3'b111;
                t2:outfr <= 3'b011;
                t3:outfr <= 3'b001;
                t4:outfr <= 3'b000;
            endcase
        end
    end
    always@(posedge clk)begin
        if(reset)
        	dfr <= 1;
        else begin
            if(next_state < state)
                dfr <= 1;
            else if(next_state > state)
                dfr <= 0;
            else
                dfr <= dfr;
        end
    end
endmodule