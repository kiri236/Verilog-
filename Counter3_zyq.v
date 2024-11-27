module Counter3_zyq(CLK,RST,DOUT);
	input CLK,RST;
	output [1:0]DOUT;
	reg [1:0]d;
	assign DOUT =d;
	always @(posedge CLK,negedge RST)
	begin
		if(!RST)d<=2'b000;
		else if(d==2'b11)d<=2'b00;
		else d<=d+1;
	end

endmodule
