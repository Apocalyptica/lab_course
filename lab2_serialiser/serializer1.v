module serializer1(clock, data, load, reset, ready, serout);

	// Input Port(s)
	//clock signal
	input clock;
	//data to serialise
	input [7:0] data;
	//signal to load data into register
	input load;
	//signal to reset serialiser
	input reset;

	// Output Port(s)
	output serout;
	// is set to 1 after sending everything
	output ready;
	
	reg out;
	reg running;
	reg [7:0] idata;
	
	reg [4:0]counter;
	
	wire [4:0]preamble;
	wire [4:0]postamble;
	wire [17:0] bits;
	
	assign preamble  = 5'b01110;
	assign postamble = 5'b10001;
	assign bits={preamble,idata,postamble};
	
	always @(posedge clock)
		begin
			if (reset)
				begin
					counter <=0;
					running <=0;
					out <= 0;
					idata <=0;
				end
			if (load)
				begin
					idata<=data;
					running<=1;
					counter<=0;
					out <=0;
				end
			if (running)
				begin
					counter <=counter + 1;
					if(counter == 18)
						begin
							running <=0;
						end
					out <= bits[counter];
				end
		end
	
	assign serout = out;
	assign ready = !running;
	
endmodule
