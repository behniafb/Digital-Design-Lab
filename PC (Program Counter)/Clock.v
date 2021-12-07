module Clock(clk);
output reg clk;
always
begin
     #10 clk = ~clk;
end
 initial 
     clk = 0;
endmodule
