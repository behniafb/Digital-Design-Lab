module pc(input clk, input reset, input write, input [63 : 0] data_input, output reg [63 : 0] out);

    always @(posedge clk)
        begin
            if(reset)
                out = 0;
            else
            if (write)
                out = data_input;
        end
endmodule;
