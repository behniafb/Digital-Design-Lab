module ALU(input_data_1, input_data_2, alu_control, alu_result);

  input [63 : 0] input_data_1;
  input [63 : 0] input_data_2;
	input [3:0] alu_control;
  output reg [63 : 0] alu_result;

	always @(alu_control)
		case (alu_control)
			4'b0000: alu_result <= input_data_1 & input_data_2;
			4'b0001: alu_result <= input_data_1 | input_data_2;
			4'b0010: alu_result <= input_data_1 + input_data_2;
			4'b0110: alu_result <= input_data_1 - input_data_2;
			default: alu_result <= 0;
		endcase

endmodule
