module ALU_4BIT_tb();
reg [3:0] a;
reg [3:0] b;
wire [3:0] finalout;
reg cin;
wire cout;
reg [2:0] ctrl;

initial 
begin
$dumpfile("ALU_4BIT.vcd");
$dumpvars(0,ALU_4BIT_tb);
end

ALU_4BIT alu(a,b,finalout,cin,cout,ctrl);


initial 
begin
ctrl=3'b 000;
a= 4'b 1000;
b=4'b 0001;
cin=0;


#20;
ctrl=3'b 001;
a= 4'b 1000;
b=4'b 0001;
cin=1;


#20;
ctrl=3'b 010;
a= 4'b 1000;
b=4'b 0001;
cin=0;

#20;
ctrl=3'b 011;
a= 4'b 1000;
b=4'b 0001;
cin=0;

#20;
ctrl=3'b 100;
a= 4'b 1000;
b=4'b 0001;
cin=0;

#20;
ctrl=3'b 101;
a= 4'b 1000;
b=4'b 0001;
cin=0;

#20;
ctrl=3'b 110;
a= 4'b 1000;
b=4'b 0001;
cin=0;

#20;
ctrl=3'b 111;
a= 4'b 1000;
b=4'b 0001;
cin=0;
end

initial 
begin
#200 $finish;
end
endmodule