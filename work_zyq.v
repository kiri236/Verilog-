module work_zyq(CLK,R3,R2,R1,R0,keypress,keystat,dataout);
	input CLK,R3,R2,R1,R0;
	input [4:0]keystat;
	output [31:0]dataout;
	input keypress;
	reg [31:0]dataout;
	reg [31:0]tmp;
	reg [3:0]preop;
	reg [4:0]prestat;
	reg err,neg;
	integer first,second,ans,cp;
	integer digits;
	integer i ;
	initial 
	begin
		dataout = 32'b00000000000000000000000000000000;
		preop = 4'b0000;
		digits = 0;
		prestat = 5'b10000;
	end
	always@(posedge CLK)
	begin
		if((keystat!=prestat))
		begin
			prestat <= keystat;
				if(keystat==5'b01110)
				begin
					dataout = 32'b00000000000000000000000000000000;
				end
				else if(keystat==5'h0||keystat==5'h1||keystat==5'h2||keystat==5'h3||keystat==5'h4||keystat==5'h5||keystat==5'h6||keystat==5'h7||keystat==5'h8||keystat==5'h9)
				begin
					dataout[31:4] = dataout[27:0];
					dataout[3:0] = keystat[3:0];
				end
				else if(keystat==5'b01010||keystat==5'b01011||keystat == 5'b01100||keystat==5'b01101)//+ - * /
				begin
					first = 0 ;
					for(i=0;i<4;i=i+1) begin
						first = first * 10;
						first = first + {dataout[15-4*i],dataout[14-4*i],dataout[13-4*i],dataout[12-4*i]};
					end
					dataout = 32'b00000000000000000000000000000000;
					preop = keystat[3:0];
				end
				else if(keystat==4'b1111)
				begin
					second = 0 ;
					for(i=0;i<4;i=i+1) begin
						second = second * 10;
						second = second + {dataout[15-4*i],dataout[14-4*i],dataout[13-4*i],dataout[12-4*i]};
					end
					dataout = 32'b00000000000000000000000000000000;
					err = 1'b0;
					neg = 1'b0;
					case(preop)
						4'b1010:// +
						begin
							ans = first + second;
						end
						4'b1011:// -
						begin
							if(first>second)
							begin
								ans = first - second;
							end
							else 
							begin
								ans = second-first;
								neg = 1'b1;
							end
						end
						4'b1100:// *
						begin
							ans = first * second;
						end
						4'b1101:// /
						begin
							if(second==0)
							begin
								err=1'b1;
							end
							else 
							begin
								ans = first/second;
							end
						end
						default:ans = first;
					endcase
					dataout = 32'b00000000000000000000000000000000;
					case(err)
					1'b0:
					begin
						for(i = 0 ; i < 8 ; i = i + 1)
						begin
							{dataout[4*i+3],dataout[4*i+2],dataout[4*i+1],dataout[4*i]} = ans%10;
							ans=ans/10;
						end
						ans = 0 ;
						
						for(i = 0 ; i < 8 ; i = i + 1)
						begin
							if({dataout[4*i+3],dataout[4*i+2],dataout[4*i+1],dataout[4*i]}!=4'b0000)	
							begin
								ans = i;
							end
						end
						if(neg==1'b1&&ans<7)
						begin
							ans = ans+1;
							{dataout[4*ans+3],dataout[4*ans+2],dataout[4*ans+1],dataout[4*ans]} = 4'b1111;
						end
					end
					1'b1:
						dataout = {4'b0000,4'b0000,4'b0000,4'b0000,4'b0000,4'b1110,4'b1101,4'b1101};
					default:dataout=dataout;
					endcase
				end
		end
	end
endmodule
