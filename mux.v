module mux(input [63 : 0] input_0, input [63 : 0] input_1, input select, output [63 : 0] out);

	assign out = select ? input_1 : input_0;

endmodule
