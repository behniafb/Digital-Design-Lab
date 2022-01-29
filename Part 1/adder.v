module adder(input clk, input [63 : 0] adder_input_1, input [63 : 0] adder_input_2, adder_out);

    always @(adder_input_1)
    begin
        adder_out = adder_input_1 + adder_input_2;
    end
endmodule