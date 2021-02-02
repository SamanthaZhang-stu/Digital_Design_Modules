module Dec(a,b);
	parameter n=2;
	parameter m=4;
	input [n-1:0] a;
	output[m-1:0] b;
	assign b=1<<a;

endmodule
