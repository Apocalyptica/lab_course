module shift_reg(clk,ena,data_i,data_o,ind);
	input clk,ena;
	input  [3:0] data_i;
	output reg [15:0] data_o;
	output reg [15:0] ind;
	
	
	reg [3:0] shift [0:3];
	integer i,j;
	
	always @(posedge clk)
	begin
			shift[0][0] <= data_i[0];
			shift[0][1] <= data_i[1];
			shift[0][2] <= data_i[2];
			shift[0][3] <= data_i[3];
			
		for(i=0; i <=3; i=i+1)
			for(j=0; j < 3 ; j=j+1)	
				shift[j+1][i] <= shift[j][i];
	
		for(i=0; i <=3; i=i+1)
			for(j=0; j <= 3 ; j=j+1)	
			begin
				if(ena)
					data_o[4*i+j] <= shift[j][i];
				else
					data_o[4*i+j] <= 'b0;
			end
			ind[3:0] <= shift[0];
			ind[7:4] <= shift[1];
			ind[11:8] <= shift[2];
			ind[15:12] <= shift[3];		
	end	
endmodule	
