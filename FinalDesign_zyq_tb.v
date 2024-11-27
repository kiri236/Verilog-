`timescale 10ns/1ns
module FinalDesign_zyq_tb();
	reg RST,fpqRST,CLK,R0,R1,R2,R3;
	wire C3,C2,C1,C0,led0,led1,led2,led3,led4,led5,led6,led7,a,b,c,d,e,f,g;
	initial CLK = 1'b0;
	always #2 CLK = ~CLK;
	initial
	begin
		#2 RST = 1'b0;{R3,R2,R1,R0} = 4'b1111;
		#1 RST = 1'b1;
		#2  {R3,R2,R1,R0} = 4'b1110;
		#4  {R3,R2,R1,R0} = 4'b1111;
		#20 {R3,R2,R1,R0} = 4'b1101;
		#4  {R3,R2,R1,R0} = 4'b1111;
		#20 {R3,R2,R1,R0} = 4'b1011;
		#4  {R3,R2,R1,R0} = 4'b1111;
		#20 {R3,R2,R1,R0} = 4'b0111;
		#4  {R3,R2,R1,R0} = 4'b1101;
	end
	FinalDesign_zyq FD(RST,fpqRST,CLK,R3,R2,R1,R0,C3,C2,C1,C0,led0,led1,led2,led3,led4,led5,led6,led7,a,b,c,d,e,f,g);
endmodule
