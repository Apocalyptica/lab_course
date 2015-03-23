module serializer(clock, data, serout);

	// Input Port(s)
	input clock;
	input [7:0] data;

	// Output Port(s)
	output serout;
	
	reg out;
	
	reg [4:0]counter;
	
	wire [4:0]preamble;
	wire [4:0]postamble;
	wire [17:0] bits;
	
	assign preamble  = 5'b01110;
	assign postamble = 5'b10001;
	assign bits={preamble,data,postamble};
	
	always @(posedge clock)
		begin
			counter <=counter + 1;
			if(counter == 18) counter <=0;
			out <= bits[counter];
		end
	
	assign serout = out;
	
endmodule
