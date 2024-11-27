module FinalDesign_zyq(RST,fpqRST,CLK,R3,R2,R1,R0,C3,C2,C1,C0,led0,led1,led2,led3,led4,led5,led6,led7,a,b,c,d,e,f,g);
	input RST,fpqRST,CLK,R0,R1,R2,R3;
	output C3,C2,C1,C0,led0,led1,led2,led3,led4,led5,led6,led7,a,b,c,d,e,f,g;
	wire CLK10D;
	wire CLK20D;
	wire [31:0]datain;
	wire [4:0]keystat;
	wire keypr;
	///assign CLK10D = CLK;
	//assign CLK20D = CLK;
	//dividertest_zyq dt(CLK,CLK10D,1'b1);
	//dividertest2_zyq dt2(CLK,CLK20D,1'b1);
	dividersmall_zyq div1(CLK,CLK10D,fpqRST);
	dividerbig_zyq div2(CLK,CLK20D,fpqRST);
	get_key_zyq gk(CLK10D,{R0,R1,R2,R3},{C0,C1,C2,C3},keystat);
	assign keypr = 1'b1;
	work_zyq work(CLK20D,R3,R2,R1,R0,keypr,keystat,datain);
	smgshow_zyq smg(CLK10D,RST,datain,{led0,led1,led2,led3,led4,led5,led6,led7},a,b,c,d,e,f,g);
endmodule

