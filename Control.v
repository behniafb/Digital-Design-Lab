module control(opcode, ALUSrc, memToReg, regWrite, memRead, memWrite, branch, ALUOp1, ALUOp0);

    input [6 : 0] opcode;
    output ALUSrc, memToReg, regWrite, memRead, memWrite, branch, ALUOp1, ALUOp0; //حتی میتونیم ALUOp هارو با هم یکی کنیم. ولی اینطوری راحت تره.
    reg [7:0] temp;


    always @(opcode) begin
        casex(opcode)
            7'b0110011: temp <= 8'b00100010; // temp: R-type
            7'b0000011: temp <= 8'b11110000; // temp: lw
            7'b0100011: temp <= 8'b1x001000; // temp: sw
            7'b1100011: temp <= 8'b0x000101; // temp: beq
            7'b0: temp = 8'b0;
        endcase
      
    assign {ALUSrc, memToReg, regWrite, memRead, memWrite, branch, ALUOp1, ALUOp0} = temp;  

    end
