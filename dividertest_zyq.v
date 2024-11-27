module dividertest_zyq(CLK,CLK10D,RST);
	input CLK,RST;
	output CLK10D;
	reg CLK10D;
	reg [2:0]cnt;
	always @(posedge CLK or negedge RST)
	begin
		if(!RST) 
		begin 
			cnt<=3'b000;
			CLK10D <= 0;
		end
		else begin
		if(cnt==3'b111)
		begin
			cnt <= 3'b000;
			CLK10D <= ~CLK10D;
		end
		else cnt <= cnt+1;
		end
	end
endmodule