module adder_cum_sub_tb();
reg [3:0] i,j;
reg cin;
wire [3:0] o;
wire cout;

initial 
begin
$dumpfile("adder_cum_sub.vcd");
$dumpvars(0,adder_cum_sub_tb);
end

adder_cum_sub f1(o,cout,i,j,cin);


initial 
begin
i=4'b 0000;
j=4'b 0000;
cin=0;

#10;
i=4'b 0000;
j=4'b 0001;
cin=0;


#10;
i=4'b 0000;
j=4'b 1100;
cin=0;

#10;
i=4'b 1111;
j=4'b 1111;
cin=0;

#10;
i=4'b 0000;
j=4'b 0000;
cin=1;

#10;
i=4'b 0001;
j=4'b 0000;
cin=1;


#10;
i=4'b 0000;
j=4'b 1100;
cin=1;

#10;
i=4'b 1111;
j=4'b 1111;
cin=1;
end

initial 
begin
#200 $finish;
end
endmodule