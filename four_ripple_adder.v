module four_ripple_adder(s,a,b,cin);
input [3:0] a,b;
input cin;
output [4:0] s;
wire [2:0]w;

fa f1(a[0],b[0],cin,s[0],w[0]);
fa f2(a[1],b[1],w[0],s[1],w[1]);
fa f3(a[2],b[2],w[1],s[2],w[2]);
fa f4(a[3],b[3],w[2],s[3],s[4]);
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