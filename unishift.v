module unishift(inp,out,x,y,clk,s1,s0);
input  [3:0]inp;
input s1,s0,x,y,clk;
output  [3:0]out;
wire w1,w2,w3,w4;
wire [3:0]out1;

mux_4x1 m1(out[0],out[1],x,inp[0],s0,s1,out1[0]);
mux_4x1 m2(out[1],out[2],out[0],inp[1],s0,s1,out1[1]);
mux_4x1 m3(out[2],out[3],out[1],inp[2],s0,s1,out1[2]);
mux_4x1 m4(out[3],y,out[2],inp[3],s0,s1,out1[3]);

d_ff d1(out1[0],out[0],w1,clk);
d_ff d2(out1[1],out[1],w2,clk);
d_ff d3(out1[2],out[2],w3,clk);
d_ff d4(out1[3],out[3],w4,clk);

endmodule

module mux_4x1(a,b,c,d,s0,s1,o);
input a,b,c,d,s1,s0;
output o;
assign o=
     ~s1&~s0&a |     //s0-lsb select line //s1-msb select line
	 ~s1&s0&b |
	 s1&~s0&c |
	 s1&s0&d ;
endmodule

module d_ff(d,q,qt,clk);
input d,clk;
output reg q,qt;
	 initial 
	 begin
	 q=0;
	 qt=1;
	 end
	 
	 always @( posedge clk)
	 begin
	 case({d})
	 1'b0: begin q=0; qt=1; end
     1'b1: begin q=1; qt=0; end
    endcase
    end	 
endmodule
