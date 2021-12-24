`include "dec_2to4.v"

module dec_4to16 (input En, input [3:0] encoded , output [0:15] decoded);

  wire [0:3] temp;

    dec_2to4 Dec1 (encoded[3:2], T[0:3], En);
    dec_2to4 Dec2 (encoded[1:0], decoded[0:3], temp[0]);
    dec_2to4 Dec3 (encoded[1:0], decoded[4:7], temp[1]);
    dec_2to4 Dec4 (encoded[1:0], decoded[8:11], temp[2]);
    dec_2to4 Dec5 (encoded[1:0], decoded[12:15], temp[3]);

endmodule
