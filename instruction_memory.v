module instrution_memory(clk, read_address, data_out);
   parameter n = 64;

   input clk;
   input [n - 1 : 0] read_address;
  output [n - 1 : 0] data_out; // طبق گفته ی استاد، تنها این مقدار باید 32 بیتی باشد. اما برای سادگی همان 64 بیتی( یعنی مانند بقیه) در نظرش می گیریم.

  reg [n - 1 : 0] memory [1024 - 1 : 0]; // آرایه‌ی 1024 تایی از آدرس‌هایی که هر کدام 64 بیتی هستند.

   always @(posedge clk)
        begin
            data_out = memory[read_address]
        end

endmodule;
