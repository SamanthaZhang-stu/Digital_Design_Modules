module Arb_MSB(r,g);
parameter n=8;
input [n-1:0] r;
output [n-1:0]g;
wire [n-1:0]c;
wire[n-1:0] g;

assign c={1'b1,(~r[n-1:1]&c[n-1:1])};
assign g=r&c;
endmodule
