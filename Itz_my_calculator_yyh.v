module Itz_my_calculator_yyh(input CLK, input [4:0] key_stats, output reg [31:0] out_data);
	
	integer n1,n2,n3,n4;
	integer tmp1,tmp2;
	reg [5:0] i;
	reg [4:0] pre_key_stats;
	
	initial begin
		out_data = 32'h00000000;
		pre_key_stats = 5'h10;
	end
	
//	always @(posedge CLK) begin
		
			
//	end
	
	always @(posedge CLK) begin
		if(pre_key_stats != key_stats) begin
			pre_key_stats <= key_stats;
		
		//if (now_key_stats != pre_keystats) begin
		//	pre_keystats <= now_key_stats;
		
		case (pre_key_stats)
			4'h0,4'h1,4'h2,4'h3,4'h4,4'h5,4'h6,4'h7,4'h8,4'h9: begin 
				out_data[31:4] = out_data[27:0];
				//out_data[3:0] = now_key_stats;
				out_data[3:0] = pre_key_stats;
			end
			
			4'ha,4'hb,4'hc,4'hd: begin // op
				//fetch num
				n1 = 0;
				n2 = 0;
				for(i=0;i<4;i=i+1) begin
					n1 = n1 * 10;
					n2 = n2 * 10;
					n1 = n1 + {out_data[15-4*i],out_data[14-4*i],out_data[13-4*i],out_data[12-4*i]};
					n2 = n2 + {out_data[31-4*i],out_data[30-4*i],out_data[29-4*i],out_data[28-4*i]};
				end
				
				//calc
				case (pre_key_stats) 
					4'ha,4'hb,4'hc: begin // n3
						case (pre_key_stats)
							4'ha: n3 = n1 + n2;
							4'hb: if (n1 > n2) n3 = n1 - n2; else n3 = n2 - n1;
							4'hc: n3 = n1*n2;
						endcase
						n2 = n3 / 10000;
						n1 = n3 % 10000;
					end
					4'hd: begin // divide ,n3&n4
						n3 = n1; n4 = n2;
						n2 = n4/n3; n1 = n4%n3;
					end
				endcase
				
				//show
				for(i=0;i<4;i=i+1) begin
					{out_data[3+4*i],out_data[2+4*i],out_data[1+4*i],out_data[0+4*i]} = n1 % 10;
					{out_data[19+4*i],out_data[18+4*i],out_data[17+4*i],out_data[16+4*i]} = n2 % 10;
					n1 = n1 / 10;
					n2 = n2 / 10;
				end
				
			end
			
			4'he: begin // back
				out_data[27:0] = out_data[31:4];
				out_data[31:28] = 4'h0;
			end
			
			4'hf: begin // clear
				out_data = 32'h00000000;
			end
			default:;
			endcase
			
		end
	end
	
endmodule
