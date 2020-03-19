module barrel_shifter_tb();
reg [3:0] i;
reg [1:0] se;
wire [3:0] o;

initial 
begin
$dumpfile("barrel_shifter.vcd");
$dumpvars(0,barrel_shifter_tb);
end

barrel_shifter f1(i,se,o);


initial 
begin
i=4'b 0110;
se=2'b 00;
#20;
i=4'b 0110;
se=2'b 10;

#20;
i=4'b 0110;
se= 2'b 01;

#20;
i=4'b 0110;
se= 2'b 11;
end

initial 
begin
#200 $finish;
end
endmodule