`timescale 1ns / 1ps

module test;

	// Inputs
	reg [15:0] a;
	reg [15:0] b;
	reg cin;

	// Outputs
	wire [16:0] sum;

	// Instantiate the Unit Under Test (UUT)
	CODE uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.sum(sum)
	);

	initial begin
		a=16'b0101110011000101;
		b=16'b1111000011110000;
		cin=1;
		
		#100;
		a=16'b0100000011000101;
		b=16'b1111000011110000;
		cin=0;
		

	end
      
endmodule

