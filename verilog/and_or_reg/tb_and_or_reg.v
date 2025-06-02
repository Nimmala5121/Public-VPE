//Test bench module
module tb_and_or_reg();

 reg a, b, c, d;  

 reg clk, rst;    

 wire f;                 
  
  and_or_reg u_and_or_reg (	.clk(clk),
					.rst(rst),
					.a(a),
					.b(b),
					.c(c),
					.d(d),
					.f(f)
  );

  always #5 clk = ~clk;
  
  initial begin
    clk = 1'b0; rst = 1'b0;
    a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0;
    #10 rst = 1'b1;
    #10; a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b0; 
    #10; a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b1; 
    #10; a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b1; 
    #10; a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b1; 
  end

endmodule
