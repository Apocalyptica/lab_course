module reg(clk, en, data_in, data_out, first,second,third,fourth,out_d);
	input clk;
	input en;
	input  [3:0] data_in;
	
	output [15:0] data_out;
	
	output reg [3:0] fourth;
	output reg [3:0] third;
	output reg [3:0] second;
	output reg [3:0] first;
	
	reg [3:0] shift_reg [0:3];
	
	integer i,j,k;
	
	always @(posedge clk)
		begin
			for(i=3; i >= 0; i=i-1)
				
				shift_reg[i][0] <= data_in[3-i];	
				
			for(i=3; i >= 0; i=i-1)
				for(j=0; j<3; j=j+1)
					shift_reg[i][j+1] <= shift_reg[i][j];
		end
	
	always @(posedge clk)
		begin
			for(i=3; i >= 0; i=i-1)
				for(j=0; j<4; j=j+1)
				begin
				if(en)
					data_out[4*i+j] <= shift_reg[i][j];
				else
					data_out[4*i+j] <= 'b1;
				end
		end
	
	always @(posedge clk)
		for(i=3; i>=0; i=i-1)
			begin
				fourth[i] <= shift_reg[3-i][0];
				third[i] <= shift_reg[3-i][1];
				second[i] <= shift_reg[3-i][2];
				first[i] <= shift_reg[3-i][3];	
			end
endmodule
