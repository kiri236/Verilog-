module get_status_zyq(in,cnt,out);
	input [2:0] cnt;
	input [3:0] in;
	output [3:0] out;
	reg [3:0] out;
	always @(cnt)
	begin
	out <= in;
	end
endmodule
