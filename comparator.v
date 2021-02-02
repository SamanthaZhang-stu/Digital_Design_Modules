module MagCompa(a,b,gt);
  parameter k=8;
  input[k-1:0] a,b;
  output gt;
  wire [k-1:0] eqi=a~^b;
  wire [k-1:0] gti=a&~b;
  wire [k:0] gtb={((eqi[k-1:0]&gtb[k-1:0])|gti[k-1:0]),1'b0};
  assign gt=gtb[k];
endmodule

module MagCompb(a,b,gt);
  parameter k=8;
  input[k-1:0] a,b;
  output gt;
  wire [k-1:0] eqi=a~^b;
  wire [k-1:0] gti=a&~b;
  wire [k:0] gtb={((eqi[k-1:0]&gtb[k-1:0])|gti[k-1:0]),1'b1};
  assign gt=gtb[k];
endmodule


module ThrMagCompa(a,b,c,o);
  parameter k=8;
  input [k-1:0] a,b,c;
  output o;
  wire g1,g2;

  MagCompa#(k) magcomp1(a,b,g1);
  MagCompa#(k) magcomp2(b,c,g2);
  
  assign o=g1&&g2;//a>b>c
endmodule

module ThrMagCompb(a,b,c,o);
  parameter k=8;
  input [k-1:0] a,b,c;
  output o;
  wire g1,g2;

  MagCompb#(k) magcomp1(a,b,g1);
  MagCompb#(k) magcomp2(b,c,g2);
  
  assign o=g1&&g2;//a>=b>=c
endmodule
