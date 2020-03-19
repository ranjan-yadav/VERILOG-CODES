module adder_cum_sub(s,cout,a,b,cin);
input [3:0] a,b;
input cin;
output [3:0] s;
output cout;
wire [2:0]w;
wire [3:0]b1;
wire x;

xor x1(b1[0],b[0],cin);
xor x2(b1[1],b[1],cin);
xor x3(b1[2],b[2],cin);
xor x4(b1[3],b[3],cin);

fa f1(a[0],b1[0],cin,s[0],w[0]);
fa f2(a[1],b1[1],w[0],s[1],w[1]);
fa f3(a[2],b1[2],w[1],s[2],w[2]);
fa f4(a[3],b1[3],w[2],s[3],x);

xor c1(cout,cin,x);
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