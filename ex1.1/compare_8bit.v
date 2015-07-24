module compare(equal, a, b);
input [7:0] a;
input [7:0] b;
output equal;
    assign equal = (a > b) ? 1 : 0;
endmodule
