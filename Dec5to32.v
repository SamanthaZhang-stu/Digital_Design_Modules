module Dec5to32(a,b);
input [4:0] a;
output [31:0] b;
wire [7:0] x;//????????
wire[3:0] y;//????????

//????????
Dec#(3,8) low(a[2:0],x);
Dec#(2,4) high(a[4:3],y);

assign b[7:0] = x&{8{y[0]}};
assign b[15:8] =x&{8{y[1]}};
assign b[23:16]=x&{8{y[2]}};
assign b[31:24]=x&{8{y[3]}};

endmodule
