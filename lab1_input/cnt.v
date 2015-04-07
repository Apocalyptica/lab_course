module cnt(clk,ena,res,upr,q,w_fifo);
	input clk, res, ena;
	output  reg[4:0] upr;
	output  reg [5:0] q;
	output  reg w_fifo;
	
	reg [5:0] cnt;
	
	always @(posedge clk )
	begin
	if(res)
		cnt<='b0;
	else
		if(ena)
		begin
			cnt<= cnt + 'b000001;
			if ( (cnt == 'd0) || (cnt == 'd4) || (cnt == 'd8) || (cnt == 'd12) || (cnt == 'd16) || (cnt == 'd20) || (cnt == 'd24) || (cnt == 'd28))
				w_fifo <= '1;
			else
				w_fifo <= '0;
		end
	q <= cnt;
	case(cnt)
	
	6'b000000: upr = 'b10000; 
	6'b000100: upr = 'b10001;
	6'b001000: upr = 'b10010;
	6'b001100: upr = 'b10011;
	6'b010000: upr = 'b10100;
	6'b010100: upr = 'b10101;
	6'b011000: upr = 'b10110;
	6'b011100: upr = 'b10111;
	default: upr = 'b0;
	endcase
	
	
	end
endmodule
