module get_key_zyq(CLK,R,C,out);
	input CLK;
	input [3:0]R;
	output [3:0]C;
	output [4:0]out;
	reg [1:0] cnt;
	reg [2:0] cnt2;
	reg [4:0] result,result2;
	reg [3:0] scan;
	assign out = result2;
	assign C = scan;
	
	initial begin
		cnt = 2'b00;
		cnt2 = 3'b00;
		result = 5'b10000;
		scan = 4'b1111;
	end
	
	always @(posedge CLK) begin
		cnt <= cnt + 1;
		case (cnt)
			2'b00: begin
				//result2 = 5'h10;
				cnt2 = 0;
				scan = 4'b1110;
				case(R)
					4'b1110: result = 4'he;//0
					4'b1101: result = 4'h7;//1
					4'b1011: result = 4'h4;//2
					4'b0111: result = 4'h1;//3
					default: cnt2 = cnt2 + 1;
				endcase
			end
			2'b01: begin
				scan = 4'b1101;
				case(R)
					4'b1110: result = 4'hd;//4
					4'b1101: result = 4'hc;//5
					4'b1011: result = 4'hb;//6
					4'b0111: result = 4'ha;//7
					default: cnt2 = cnt2 + 1;
				endcase
			end
			2'b10: begin
				scan = 4'b1011;
				case(R)
					4'b1110: result = 4'hf;//8
					4'b1101: result = 4'h9;//9
					4'b1011: result = 4'h6;//a
					4'b0111: result = 4'h3;//b
					default: cnt2 = cnt2 + 1;
				endcase
			end
			2'b11: begin
				scan = 4'b0111;
				case(R)
					4'b1110: result = 4'h0;//c
					4'b1101: result = 4'h8;//d
					4'b1011: result = 4'h5;//e
					4'b0111: result = 4'h2;//f
					default: cnt2 = cnt2 + 1;
				endcase
				if (cnt2 != 3'b100)
					result2 = result;
				else
					result2 = 5'b10000;
			end
		endcase
	end
endmodule
