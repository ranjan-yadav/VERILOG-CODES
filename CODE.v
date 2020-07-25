`timescale 1ns / 1ps
module CODE(a,b,cin,sum);
	input [15:0] a;
	input [15:0] b;
	input cin;
	output [16:0] sum;
	
	wire w1;
	
four_ripple_adder f1(sum[3:0],a[3:0],b[3:0],cin,w1);
 
 wire w2,w3;
 wire [15:4] sum1;
 wire [15:4] sum2;
 wire w4;//connector

four_ripple_adder f2(sum1[7:4],a[7:4],b[7:4],1'b0,w2);
four_ripple_adder f3(sum2[7:4],a[7:4],b[7:4],1'b1,w3);
mux m1(sum1[4],sum2[4],w1,sum[4]);
mux m2(sum1[5],sum2[5],w1,sum[5]);
mux m3(sum1[6],sum2[6],w1,sum[6]);
mux m4(sum1[7],sum2[7],w1,sum[7]);
mux m5(w2,w3,w1,w4);

////////////////

wire w5,w6;
wire w7;//connector

four_ripple_adder f4(sum1[11:8],a[11:8],b[11:8],1'b0,w5);
four_ripple_adder f5(sum2[11:8],a[11:8],b[11:8],1'b1,w6);
mux m6(sum1[8],sum2[8],w4,sum[8]);
mux m7(sum1[9],sum2[9],w4,sum[9]);
mux m8(sum1[10],sum2[10],w4,sum[10]);
mux m9(sum1[11],sum2[11],w4,sum[11]);
mux m10(w5,w6,w4,w7);

//////////////////
wire w8,w9;
four_ripple_adder f6(sum1[15:12],a[15:12],b[15:12],1'b0,w8);
four_ripple_adder f7(sum2[15:12],a[15:12],b[15:12],1'b1,w9);
mux m11(sum1[12],sum2[12],w7,sum[12]);
mux m12(sum1[13],sum2[13],w7,sum[13]);
mux m13(sum1[14],sum2[14],w7,sum[14]);
mux m14(sum1[15],sum2[15],w7,sum[15]);
mux m15(w8,w9,w7,sum[16]);
endmodule

module four_ripple_adder(s,a,b,cin,cout);
input [3:0] a,b;
input cin;
output [3:0] s;
output cout;
wire [2:0]w;

fa f1(a[0],b[0],cin,s[0],w[0]);
fa f2(a[1],b[1],w[0],s[1],w[1]);
fa f3(a[2],b[2],w[1],s[2],w[2]);
fa f4(a[3],b[3],w[2],s[3],cout);
endmodule

module fa(x,y,z,sum,out);
input  x,y,z;
output out,sum;
wire w1,w2,w3;
xor x1(sum,x,y,z);
and a1(w1,x,y);
and a2(w2,x,z);
and a3(w3,y,z);
or o1(out,w1,w2,w3);
endmodule

module mux(in0,in1,sel,out);
input  in0,in1, sel;
output out;
assign out=(sel)?in1:in0;
endmodule
