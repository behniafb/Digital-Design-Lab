module FullAdder(input wire X, input wire Y, input wire CarryIn, output Sum, output CarryOut);

    assign Sum = X ^ Y ^ CarryIn;
    assign CarryOut = (X & Y) | ((X ^ Y) & CarryIn);
endmodule
