module FSM_CODE1(
    output reg [3:0] state,
    output reg y,
    input x,
    input clk,
	input rst
    );
	parameter A=4'b0000 ,//A-IDLE
			  B=4'b0001,
			  C=4'b0010,
			  D=4'b0011,
			  E=4'b0100,
			  F=4'b0101,
			  G=4'b0110,
			  H=4'b0111,
			  I=4'b1000;
			  
initial begin y=0; state=4'b0000; end


always @(posedge clk)
    begin
	if (rst==1)
		begin state=A; y=0; end
	else
	begin
    case({state,x})
     5'b00000: begin state<=A ; y<=0; end
	 5'b00001: begin state<=B;  y<=0; end
     5'b00010: begin state<=A;  y<=0; end
	 5'b00011: begin state<=C;  y<=0; end
	 5'b00100: begin state<=D;  y<=0; end
	 5'b00101: begin state<=C;  y<=0; end
	 5'b00110: begin state<=E;  y<=0; end
	 5'b00111: begin state<=B;  y<=0; end
	 5'b01000: begin state<=A ; y<=0; end
	 5'b01001: begin state<=F;  y<=0; end
     5'b01010: begin state<=G;  y<=0; end
	 5'b01011: begin state<=C;  y<=0; end
	 5'b01100: begin state<=A;  y<=0; end
	 5'b01101: begin state<=H;  y<=0; end
	 5'b01110: begin state<=A;  y<=0; end
	 5'b01111: begin state<=I;  y<=1; end
	 5'b10000: begin state<=D;  y<=0; end
	 5'b10001: begin state<=C;  y<=0; end  // CODE DETECTION ON 11001011 USING MOORE OVERLAP
	 endcase
	 end
	 end
endmodule
