module unishift_tb();
reg   [3:0]inp ;
reg s1,s0,x,y,clk;
wire [3:0]out;

initial 
begin
$dumpfile("unishift.vcd");
$dumpvars(0,unishift_tb);
end

unishift f1(inp,out,x,y,clk,s1,s0);
initial clk=0;
always begin #50 clk=~clk;  end
initial 
begin
s1=1'b1;
s0=1'b1;
inp=4'b0110;
x=1'b0;
y=1'b0;


#100;
s1=1'b0;
s0=1'b1;
inp=4'b0110;
x=1'b1;
y=1'b0;

#100;
s1=1'b0;
s0=1'b0;
inp=4'b0110;
x=1'b1;
y=1'b0;


#100;
s1=1'b1;
s0=1'b0;
inp=4'b0110;
x=1'b1;
y=1'b0;


#100;
s1=1'b0;
s0=1'b0;
inp=4'b0110;
x=1'b1;
y=1'b0;

#100;
s1=1'b0;
s0=1'b1;
inp=4'b0110;
x=1'b1;
y=1'b0;

#100;
s1=1'b0;
s0=1'b0;
inp=4'b0110;
x=1'b1;
y=1'b0;


#100;
s1=1'b1;
s0=1'b0;
inp=4'b0110;
x=1'b1;
y=1'b0;


#100;
s1=1'b0;
s0=1'b0;
inp=4'b0110;
x=1'b1;
y=1'b0;
end

initial 
begin
#1000 $finish;
end
endmodule