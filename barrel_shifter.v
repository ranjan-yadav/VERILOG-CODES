module barrel_shifter(in,sl,out);
input [3:0]in;
input [1:0]sl;
output [3:0]out;

mux_4x1 x1(in[0],in[1],in[2],in[3],sl[1],sl[0],out[0]);
mux_4x1 x2(in[3],in[0],in[1],in[2],sl[1],sl[0],out[1]);
mux_4x1 x3(in[2],in[3],in[0],in[1],sl[1],sl[0],out[2]);
mux_4x1 x4(in[1],in[2],in[3],in[0],sl[1],sl[0],out[3]);

endmodule

module mux_4x1(a,b,c,d,s1,s2,o);
input a,b,c,d,s1,s2;
output o;
assign o=
     ~s1&~s2&a |     //s2-lsb select line //s1-msb select line
	 s1&~s2&b |
	~s1&s2&c |
	s1&s2&d ;
endmodule