module shift(input [63 : 0] input_data, output[63 : 0] output_data);

    assign output_data = input_data << 1;
    
endmodule