module smgshow_zyq(CLK,RST,datain,ledcs,a,b,c,d,e,f,g);
	input CLK;
	input RST;
	input [31:0]datain;
	output [7:0]ledcs;
	output a,b,c,d,e,f,g;
	wire [2:0]cnt7out;
	wire [7:0]ymq38out;
	wire [3:0]selout;
	wire [6:0]ymq47out;
	Counter7_zyq cnt7(CLK,RST,cnt7out);
	ymq38_zyq ymq38(1'b1,cnt7out,ymq38out);
	Select_81_zyq sel81(datain[3:0],datain[7:4],datain[11:8],datain[15:12],datain[19:16],datain[23:20],datain[27:24],datain[31:28],cnt7out,selout);
	ymq47_zyq y47(1'b1,selout,ymq47out);
	assign ledcs = ~ymq38out;
	assign {a,b,c,d,e,f,g} = ~ymq47out;
endmodule
