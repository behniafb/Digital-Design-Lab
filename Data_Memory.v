module data_memory(clk, address, write_data, memRead, memWrite, read_data);

	input  clk;
	input [63 : 0] address;
	input [63 : 0] write_data;
	input memRead;
	input memWrite;

	reg [63 : 0] data[100-1: 0];

	output [63 : 0] read_data;

	assign read_data = data[address];
	
	always @(posedge clk)
		if (memWrite)
			data[address] <= write_data;
			
endmodule;
