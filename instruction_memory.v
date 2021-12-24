module instruction_memory(input clk, input [63 : 0] read_address, output [31 : 0] instruction);

   reg [31 : 0] instructions [1023 : 0]; // آرایه‌ی 1024 تایی از دستورهایی که هر کدام 32 بیتی هستند.
   
   // همانطور که در کلاس اشاره شد، برای نمونه چند دستور به طور دلخواه اضافه می کنیم.
   assign instructions[0] = 32'b00000000000100001000000010110011;
   assign instructions[1] = 32'b00000010010111110011000000100011;
   assign instructions[2] = 8'h40538333; 
   assign instructions[3] = 6'h4DB183;

   always @(posedge clk)
        begin
            instruction <= instructions[read_address]
        end

endmodule;
