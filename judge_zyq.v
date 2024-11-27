module judge_zyq(CLK,row,col,out1,keypr);
	input [3:0] row;
	input [3:0] col;
	input CLK;
	output [4:0] out1;
	output keypr;
	reg keypr;
	reg [4:0]out;
	reg [4:0]out1;
	reg [2:0] cnt;
	initial begin
		cnt = 3'b000;
	end
	always @(posedge CLK)
	begin
		case({row,col})
			8'b11101110:begin out = 5'b00001; cnt = 3'b000; end//r1c1 1
			8'b11101101:begin out = 5'b00010;end//r1c2 2
			8'b11101011:begin out = 5'b00011;end//r1c3 3
			8'b11100111:begin out = 5'b01010;end//r1c4 a
			8'b11011110:begin out = 5'b00100; cnt = 3'b000;end//r2c1 4
			8'b11011101:out = 5'b00101;//r2c2 5
			8'b11011011:out = 5'b00110;//r2c3 6
			8'b11010111:out = 5'b01011;//r2c4 b
			8'b10111110:begin out = 5'b00111;cnt = 3'b000; end//r3c1 7
			8'b10111101:out = 5'b01000;//r3c2 8
			8'b10111011:out = 5'b01001;//r3c3 9
			8'b10110111:out = 5'b01100;//r3c4 c
			8'b01111110:begin out = 5'b01110; cnt = 3'b000; end//r4c1 e
			8'b01111101:out = 5'b00000;//r4c2 0
			8'b01111011:out = 5'b01111;//r4c3 f
			8'b01110111:out = 5'b01101;//r4c4 d
			default:cnt = cnt+1;
		endcase
		if(cnt==3'b100)
		begin
			keypr = 1'b0;
			out1 = 5'b10000;
		end
		else 
		begin
			keypr=1'b1;
			out1 = out;
		end
	end
endmodule
