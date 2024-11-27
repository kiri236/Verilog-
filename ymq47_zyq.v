module ymq47_zyq(en,in,out);
	input [3:0]in;
	input en;
	output [6:0]out;
	reg [6:0]d;
	assign out = d;
	always @(*)
	begin
		if(en)
		begin
		case(in)
		4'b0000:d = 7'b1111110;//0
		4'b0001:d = 7'b0110000;//1
		4'b0010:d = 7'b1101101;//2
		4'b0011:d = 7'b1111001;//3
		4'b0100:d = 7'b0110011;//4
		4'b0101:d = 7'b1011011;//5
		4'b0110:d = 7'b1011111;//6
		4'b0111:d = 7'b1110000;//7
		4'b1000:d = 7'b1111111;//8
		4'b1001:d = 7'b1110011;//9
		4'b1010:d = 7'b1110111;//A
		4'b1011:d = 7'b0011111;//b
		4'b1100:d = 7'b1001110;//C
		4'b1101:d = 7'b0111101;//D
		4'b1110:d = 7'b1001111;//E
		4'b1111:d = 7'b0000001;//F
		endcase
		end
		else d = 7'b0000000;
	end
endmodule
