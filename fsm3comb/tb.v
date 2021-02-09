module tb;

    reg in = 1'b0;

    reg [1:0] state = 1'b0;
	wire [1:0] next_state;

	wire out;    

    top_module top(
        in,
        state,
        next_state,        
        out);
    initial
    begin
        #5 in = 1'b1;
        #5 state = 2'b00;
		#5 state = 2'b01;
        #100 $finish;
    end

    initial
    begin
        $monitor("[%g] in = %b, state = %b, next_state = %b out = %h", $time, in, state, next_state, out);
    end

    initial
    begin
        $dumpfile("test.vcd");
        $dumpvars(0, tb);
    end
endmodule
