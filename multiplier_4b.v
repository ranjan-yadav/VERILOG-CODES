module multiplier_4b(a,b,out);
input [3:0]a;
input [3:0]b;
output [7:0]out;

wire [3:0]w1,w2,w3,w4;
           
assign w1[0]=a[0]&b[0];
assign w1[1]=a[1]&b[0];
assign w1[2]=a[2]&b[0];
assign w1[3]=a[3]&b[0];

assign w2[0]=a[0]&b[1];
assign w2[1]=a[1]&b[1];
assign w2[2]=a[2]&b[1];
assign w2[3]=a[3]&b[1];

assign w3[0]=a[0]&b[2];
assign w3[1]=a[1]&b[2];
assign w3[2]=a[2]&b[2];
assign w3[3]=a[3]&b[2];

assign w4[0]=a[0]&b[3];
assign w4[1]=a[1]&b[3];
assign w4[2]=a[2]&b[3];
assign w4[3]=a[3]&b[3];

wire x1,x2,x3,x4,x5,x6,v1,v2;

assign out[0]=a[0]&b[0];
four_ripple_adder f1(out[1],x1,x2,x3,v1,w2[0],w2[1],w2[2],w2[3],w1[1],w1[2],w1[3],1'b0,1'b0);
four_ripple_adder f2(out[2],x4,x5,x6,v2,w3[0],w3[1],w3[2],w3[3],x1,x2,x3,v1,1'b0);
four_ripple_adder f3(out[3],out[4],out[5],out[6],out[7],w4[0],w4[1],w4[2],w4[3],x4,x5,x6,v2,1'b0);
endmodule

module four_ripple_adder(s0,s1,s2,s3,cout,a0,a1,a2,a3,b0,b1,b2,b3,cin);
input a0,a1,a2,a3,b0,b1,b2,b3;
input cin;
output s0,s1,s2,s3,cout;
wire w0,w1,w2,w3;

fa f1(a0,b0,cin,s0,w0);
fa f2(a1,b1,w0,s1,w1);
fa f3(a2,b2,w1,s2,w2);
fa f4(a3,b3,w2,s3,cout);
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