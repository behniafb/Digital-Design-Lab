module ALU_Control(input ALUOp0, input ALUOp1, input [9:0] instruction_part, output reg [3:0] output_function);

    assign concat_instruction = {ALUOp0, ALUOp1, instruction_part}; 	

    always @(ALUOp0, ALUOp1, instruction_part) begin
        casex(concat_instruction)
                12'b1x0000000111: output_function <= 4'b0000; // AND
                12'b1x0000000110: output_function <= 4'b0001; // OR
                12'b00xxxxxxxxxx: output_function <= 4'b0010; // ADD
                12'b1x0000000000: output_function <= 4'b0010; // ADD
                12'bx1xxxxxxxxxx: output_function <= 4'b0110; // SUB
                12'b1x0100000000: output_function <= 4'b0110; // SUB 
            default: output_function = 4'bz;
        endcase

    end

endmodule
