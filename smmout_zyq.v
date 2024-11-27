module smmout_zyq(in,out);
	input [1:0]in;
	output [3:0]out;
	reg [3:0] out;
	always @(*)
	begin
		case(in)
			2'b00:out = 4'b1110;
			2'b01:out = 4'b1101;
			2'b10:out = 4'b1011;
			2'b11:out = 4'b0111;
			default: out = 4'b0000;
		endcase
	end
endmodule
