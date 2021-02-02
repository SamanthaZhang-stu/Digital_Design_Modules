module comparator_test;
  wire [2:0]a,b,c;
  wire o1,o2;
  wire [2:0]cei=3'b111; 
  ThrMagCompa#(3) comparator1(a,b,c,o1);
  ThrMagCompb#(3) comparator2(a,b,c,o2);

initial begin
  a=0;
  b=0;
  c=0;  
  for(a=0;a<=cei;a=a+1)
      for(b=0;b<=cei;b=b+1)
          for(c=0;c<=cei;c=c+1)
		#100
		$display("a=%2d b=%2d c=%2d o1=%1b o2=%1b",a,b,c,o1,o2);
	  end
      


endmodule