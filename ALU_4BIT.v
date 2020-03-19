module ALU_4BIT(a,b,finalout,cin,cout,ctrl);
input [3:0] a;
input [3:0] b;
output [3:0] finalout;
input cin;
output cout;
input [2:0] ctrl;

wire[3:0]value; 
wire[3:0]value3 ;
wire[3:0]value4;
wire[3:0]value5;
wire[3:0]value6;
wire value2;
wire [3:0]or1;
wire [3:0]and1;

adder_cum_sub a1(value,value2,a,b,cin);
assign cout=value2;
shl a6(a,value3);
shr a7(a,value4);
rotate_shifter_left a2(a,value5);
rotate_shifter_right a3(a,value6);
or_logic a4(a,b,or1);
and_logic a5(a,b,and1);



assign finalout[0]= (~(ctrl[0]))&((~(ctrl[1])))&(~(ctrl[2]))&(value[0])        |
                   ((ctrl[0]))&((~(ctrl[1])))&(~(ctrl[2]))&(value[0])          |
			         (~(ctrl[0]))&(((ctrl[1])))&(~(ctrl[2]))&(or1[0])	       |
			           ((ctrl[0]))&(((ctrl[1])))&(~(ctrl[2]))&(and1[0])        |
			             (~(ctrl[0]))&((~(ctrl[1])))&((ctrl[2]))&(value3[0])   |
			               ((ctrl[0]))&((~(ctrl[1])))&((ctrl[2]))&(value4[0])  |
						     (~(ctrl[0]))&(((ctrl[1])))&((ctrl[2]))&(value5[0])|
		                    	((ctrl[0]))&(((ctrl[1])))&((ctrl[2])&(value6[0]));
			                
							   
assign finalout[1]= (~(ctrl[0]))&((~(ctrl[1])))&(~(ctrl[2]))&(value[1])        |
                   ((ctrl[0]))&((~(ctrl[1])))&(~(ctrl[2]))&(value[1])          |
			         (~(ctrl[0]))&(((ctrl[1])))&(~(ctrl[2]))&(or1[1])	       |
			           ((ctrl[0]))&(((ctrl[1])))&(~(ctrl[2]))&(and1[1])        |
			             (~(ctrl[0]))&((~(ctrl[1])))&((ctrl[2]))&(value3[1])   |
			               ((ctrl[0]))&((~(ctrl[1])))&((ctrl[2]))&(value4[1])  |
						     (~(ctrl[0]))&(((ctrl[1])))&((ctrl[2]))&(value5[1])|
		                    	((ctrl[0]))&(((ctrl[1])))&((ctrl[2])&(value6[1]));


assign finalout[2]= (~(ctrl[0]))&((~(ctrl[1])))&(~(ctrl[2]))&(value[2])        |
                   ((ctrl[0]))&((~(ctrl[1])))&(~(ctrl[2]))&(value[2])          |
			         (~(ctrl[0]))&(((ctrl[1])))&(~(ctrl[2]))&(or1[2])	       |
			           ((ctrl[0]))&(((ctrl[1])))&(~(ctrl[2]))&(and1[2])        |
			             (~(ctrl[0]))&((~(ctrl[1])))&((ctrl[2]))&(value3[2])   |
			               ((ctrl[0]))&((~(ctrl[1])))&((ctrl[2]))&(value4[2])  |
						   (~(ctrl[0]))&(((ctrl[1])))&((ctrl[2]))&(value5[2])  |
		                    	((ctrl[0]))&(((ctrl[1])))&((ctrl[2])&(value6[2]));
						   
						   
assign finalout[3]= (~(ctrl[0]))&((~(ctrl[1])))&(~(ctrl[2]))&(value[3])        |
                   ((ctrl[0]))&((~(ctrl[1])))&(~(ctrl[2]))&(value[3])          |
			         (~(ctrl[0]))&(((ctrl[1])))&(~(ctrl[2]))&(or1[3])	       |
			           ((ctrl[0]))&(((ctrl[1])))&(~(ctrl[2]))&(and1[3])        |
			             (~(ctrl[0]))&((~(ctrl[1])))&((ctrl[2]))&(value3[3])   |
			               ((ctrl[0]))&((~(ctrl[1])))&((ctrl[2]))&(value4[3])  |
						   (~(ctrl[0]))&(((ctrl[1])))&((ctrl[2]))&(value5[3])  |
		                    	((ctrl[0]))&(((ctrl[1])))&((ctrl[2])&(value6[3]));
endmodule



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

module rotate_shifter_left(in,out);
input [3:0]in;
output [3:0]out;

assign out[0]=in[1];
assign out[1]=in[2];
assign out[2]=in[3];
assign out[3]=in[0];
endmodule


module rotate_shifter_right(in,out);
input [3:0]in;
output [3:0]out;

assign out[0]=in[3];
assign out[1]=in[0];
assign out[2]=in[1];
assign out[3]=in[2];
endmodule

module shl(in,out);
input [3:0]in;
output [3:0]out;

assign out[0]=in[1];
assign out[1]=in[2];
assign out[2]=in[3];
assign out[3]=1'b0;
endmodule


module shr(in,out);
input [3:0]in;
output [3:0]out;

assign out[0]=1'b0;
assign out[1]=in[0];
assign out[2]=in[1];
assign out[3]=in[2];
endmodule

module or_logic(a,b,out);
input [3:0]a;
input [3:0]b;
output [3:0]out;

or(out[0],a[0],b[0]);
or(out[1],a[1],b[1]);
or(out[2],a[2],b[2]);
or(out[3],a[3],b[3]);
endmodule

module and_logic(a,b,out);
input [3:0]a;
input [3:0]b;
output [3:0]out;

and(out[0],a[0],b[0]);
and(out[1],a[1],b[1]);
and(out[2],a[2],b[2]);
and(out[3],a[3],b[3]);
endmodule




	