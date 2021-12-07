`include "../Adder/64bit_FullAdder.v"
`include "Clock.v"

module PC();
    reg [63:0] I;
    wire [63:0] FS;
    wire [63:0] q;
    wire clock;

    Clock ck(clock);
    64bit_FullAdder FA(.X(q), .Y({0, 4}), .CarryIn(0), .Sum(FS), .CarryOut());

    initial begin
        #10
            I = 0;
        #10
            assign I = FS;
    end

    always @(posedge clock) begin
        $display(q);
    end
endmodule
