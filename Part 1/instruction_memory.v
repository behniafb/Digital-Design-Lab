module instruction_memory(input clk, input [63 : 0] read_address, output [31 : 0] instruction);

   reg [31 : 0] instructions [1023 : 0]; // آرایه‌ی 1024 تایی از دستورهایی که هر کدام 32 بیتی هستند.
   
   // دستورات نمونه
   assign instructions[0] = 32'b00000000000001010010101000000011;
   assign instructions[1] = 32'b00000001010000000000101010110011;
   assign instructions[2] = 32'b0100001010010101000001100110011; 
   assign instructions[3] = 32'b00000001010001010010010000100011;
   assign instructions[4] = 32'b11111111010110100000111001100111;

   always @(posedge clk)
        begin
            instruction <= instructions[read_address]
        end

endmodule;
