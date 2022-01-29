module adder(input clk, input [63 : 0] input_1, input [63 : 0] input_2, out);
    
	input [63 : 0] input_1, input_2;
	output reg [63 : 0] out;

    always @(input_1)
    begin
        out = input_1 + input_2;
    end
endmodule