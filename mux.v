module mux(input_0, input_1, select, out);

	input select;
  input [63 : 0] input_0, input_1;
  output [63 : 0] out;

	assign out = select ? input_1 : input_0;

endmodule
