module data_memory(input clk, input [63 : 0] address, input [63 : 0] write_data, input memRead, input memWrite, output [63 : 0] read_data);

	reg [63 : 0] data[100-1: 0];
	
	initial begin
		data[0]=64'b110101;
	end
	assign read_data = data[address];
	
	always @(posedge clk)
		if (memWrite)
			data[address] <= write_data;
			
endmodule;
