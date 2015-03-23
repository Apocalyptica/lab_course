module deserializer(clock, serin, data, outclock);

	// Input Port(s)
	input clock;//This is bit clock
	input serin;
	
	// Output Port(s)
	output reg[7:0] data;
	output reg outclock;

	reg[17:0] fulldata;
	
	wire [17:0] framemask;
	wire [17:0] prepostamble;
	
	assign framemask    = 18'b111110000000011111;
	assign prepostamble = 18'b011100000000010001;
	
	always @(posedge clock)
		begin
			fulldata<={serin,fulldata[17:1]};
			outclock<=1'b0;
			if((fulldata & framemask) == prepostamble)
				begin
					data<=fulldata[12:5];
					outclock<=1'b1;
				end
		end

endmodule
