module dividertest2_zyq(CLK,CLK10D,RST);
	input CLK,RST;
	output CLK10D;
	reg CLK10D;
	reg [4:0]cnt;
	always @(posedge CLK or negedge RST)
	begin
		if(!RST) 
		begin 
			cnt<=5'b00000;
			CLK10D <= 0;
		end
		else begin
		if(cnt==5'b11111)
		begin
			cnt <= 5'b00000;
			CLK10D <= ~CLK10D;
		end
		else cnt <= cnt+1;
		end
	end
endmodule