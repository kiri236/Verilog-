module Select_81_zyq(data0,data1,data2,data3,data4,data5,data6,data7,num,out);
	input [2:0]num;
	input [3:0]data0,data1,data2,data3,data4,data5,data6,data7;
	output [3:0] out;
	reg [3:0]out;
	always @(num)
	begin
		case(num)
		3'b000:out = data0;
		3'b001:out = data1;
		3'b010:out = data2;
		3'b011:out = data3;
		3'b100:out = data4;
		3'b101:out = data5;
		3'b110:out = data6;
		3'b111:out = data7;
		endcase
	end
	
endmodule
