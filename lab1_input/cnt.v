module cnt(clk,ena,res,upr,q);
	input clk, res, ena;
	output  reg[4:0] upr;
	output  reg [5:0] q;
	
	reg [5:0] cnt;
	
	always @(posedge clk )
	begin
	if(res)
		cnt<='b0;
	else
		if(ena)
			cnt<= cnt + 'b000001;
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
