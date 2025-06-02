module and_or_reg (
input clk,
input rst,
input a , 
input b,
input c,
input d,
output reg f

);

wire e = (a & b) | (c & d);

  always @(posedge clk, negedge rst) begin
    if (~rst) begin	
      f <= 1'b0;  
		end	
    else begin
      f <= e;     
		end	
  end

endmodule
