module dec2_4 (input En, input [1:0] encoded, output reg [0:3] decoded);

  always @(En, encoded)
    case ({En, encoded})

            3'b100: decoded = 4'b1000;
            3'b101: decoded = 4'b0100;
            3'b110: decoded = 4'b0010;
            3'b111: decoded = 4'b0001;
            default: decoded = 4'b0000;

        endcase

endmodule
