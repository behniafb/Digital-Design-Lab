`include "64bit_FullAdder.v"

module FullAdder64_TB;
    reg [63:0] x, y;
    reg carryIn;
    wire [63:0] sum;
    wire carryOut;

    FullAdder64 fa(.X(x), .Y(y), .CarryIn(carryIn), .Sum(sum), .CarryOut(carryOut));

    initial
        begin

            #100 assign x = 1;
            assign y = 1;
            assign carryIn = 0;
            #100 $display("%0d + %0d + %0d = %0d;  Carry out = %0d", x, y, carryIn, sum, carryOut);

            #100 assign x = 200;
            assign y = 400;
            assign carryIn = 0;
            #100 $display("%0d + %0d + %0d = %0d;  Carry out = %0d", x, y, carryIn, sum, carryOut);

            #100 assign x = 9999999;
            assign y = 1;
            assign carryIn = 1;
            #100 $display("%0d + %0d + %0d = %0d;  Carry out = %0d", x, y, carryIn, sum, carryOut);

        end
endmodule
