module tb_counter_0to9();

    reg clk;
    reg rst;
    reg en;
    wire [3:0] cnt;

    counter_0to9 u_counter_0to9 (
        .clk(clk),
        .rst(rst),
        .en(en),
        .cnt(cnt)
    );
	
    always #5 clk = ~clk;  
    

    initial begin

		rst=1'b0; clk=1'b0; 
		en=1'b0;
        #10 rst=1'b1;
		@(posedge clk) en=1'b1;
		#100 rst=1'b0;
		#30 rst=1'b1;
		repeat(15) @(posedge clk) en=1'b0;
		repeat(10) @(posedge clk) en=1'b1;
    end


endmodule
