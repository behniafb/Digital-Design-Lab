module register_bank(input clk, input regWrite, input [4 : 0] read_register1, input [4 : 0] read_register2, input [4 : 0] write_register, input  [63 : 0] write_data, output [63 : 0] read_data1, output [63 : 0] read_data2);

  reg [63 : 0] registers[31 : 0];

  assign read_data1 = registers[read_register1];
  assign read_data2 = registers[read_register2];

  
  initial begin
  for(i=0; i < 64; i=i+1)
    registers[i] <=2'b01;
  end
  

  always@(posedge clk)
    begin
      if (read_register2)
        registers[write_register] <= write_data;
    end



endmodule;
