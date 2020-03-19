module FSM_CODE1_tb();
wire [3:0] state;
wire y;
reg x,clk,rst;

initial 
begin
$dumpfile("FSM_CODE1.vcd");
$dumpvars(0,FSM_CODE1_tb);
end

FSM_CODE1 e(state,y,x,clk,rst);

initial clk=0;
always #10 clk=~clk;
initial  
begin
x=0;
rst=0;

#10
x=1;
rst=1; //change it to 1 to observe changes in output.

#20
x=1;
rst=0;

#20
x=0;

#20
x=0;

#20
x=1;

#20
x=0;

#20
x=1;

#20
x=1;

#20
x=0;

#20
x=0;

#20
x=1;

#20
x=0;

#20
x=1;

#20
x=1;

#20
x=1;

#20
x=1;

#20
x=1;

#20
x=1;

#20
x=1;

#20
x=0;

#20
x=0;

#20
x=0;

#20
x=1;
end

initial 
begin
#500 $finish;
end
endmodule
