module dividerbig_zyq(CLK,CLK10D,RST);
	input CLK,RST;
	output CLK10D;
	reg CLK10D;
	reg [20:0]cnt;
	always @(posedge CLK or negedge RST)
	begin
		if(!RST) 
		begin 
			cnt<=0;
			CLK10D <= 0;
		end
		else begin
			cnt <= cnt+1;
			CLK10D=~CLK10D;
		end
	end
endmodule