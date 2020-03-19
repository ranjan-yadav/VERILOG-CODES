module four_ripple_adder_tb();
reg [3:0] i,j;
reg cin;
wire [4:0] o;

initial 
begin
$dumpfile("four_ripple_adder.vcd");
$dumpvars(0,four_ripple_adder_tb);
end

four_ripple_adder f1(o,i,j,cin);


initial 
begin
i=4'b 0000;
j=4'b 0000;
cin=0;

#20;
i=4'b 0000;
j=4'b 0001;
cin=0;


#20;
i=4'b 0000;
j=4'b 1100;
cin=0;

#20;
i=4'b 1111;
j=4'b 1111;
cin=0;

end

initial 
begin
#200 $finish;
end
endmodule