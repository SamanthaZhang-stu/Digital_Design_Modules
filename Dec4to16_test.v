module Enc42a(a,b,c);
input [3:0]a;
output [1:0]b;
output c;
wire [1:0] b;
wire c;

  assign b[1]=a[3]|a[2];
  assign b[0]=a[3]|a[1];
  assign c=|a;
endmodule;

module Enc42(a,b);
input [3:0] a;
output[1:0] b;
assign b={a[3]|a[2],a[3]|a[1]};
endmodule

module Enc16to4(a,b);
input [15:0] a;
output[3:0]b;
wire [3:0]b;
wire [7:0]c;
wire [3:0]d;

Enc42a e0(a[3:0],c[1:0],d[0]);
Enc42a e1(a[7:4],c[3:2],d[1]);
Enc42a e2(a[11:8],c[5:4],d[2]);
Enc42a e3(a[15:12],c[7:6],d[3]);

Enc42 e4(d[3:0],b[3:2]);

assign b[1]= c[1]|c[3]|c[5]|c[7];
assign b[0]=c[0]|c[2]|c[4]|c[6];
endmodule

module Dec4to16_test;
reg [3:0]four1;
wire[3:0]four2;
wire [15:0] sixteen;
reg  flag;

Dec #(4,16) decoder(four1,sixteen);
  Enc16to4 encoder(sixteen,four2);


initial begin
  four1=4'b0000;

  repeat(16) begin
	#100
	if(four1==four2)
	flag=1'b1;
	else
	flag=1'b0;
	four1=four1+1;
  end
end
endmodule


