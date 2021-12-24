module instruction_memory(input clk;, input [63 : 0] read_address;, output [31 : 0] instruction);


   reg [31 : 0] instructions [1023 : 0]; // آرایه‌ی 1024 تایی از دستورهایی که هر کدام 32 بیتی هستند.

   always @(posedge clk)
        begin
            instruction = instructions[read_address]
        end

endmodule;
