module multiplier_4b_tb();
reg [3:0] a;
reg [3:0] b;
wire [7:0] finalout;


initial 
begin
$dumpfile("multiplier_4b.vcd");
$dumpvars(0,multiplier_4b_tb);
end

multiplier_4b mul(a,b,finalout);


initial 
begin
a= 4'b 1001;
b=4'b 0001;

#20;
a= 4'b 1010;
b=4'b 0101;

#20;
a= 4'b 1100;
b=4'b 0101;

#20;
a= 4'b 1100;
b=4'b 1001;

#20;
a= 4'b 1111;
b=4'b 1111;
end

initial 
begin
#140 $finish;
end
endmodule