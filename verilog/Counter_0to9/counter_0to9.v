module counter_0to9 (
    input  clk,      
    input  rst,      
    input  en,         
    output reg [3:0] cnt   
);

    wire [3:0] nxt_cnt = (cnt == 4'h9) ? 4'h0 : 
                         en ? cnt + 4'h1 : cnt; 
    always @(posedge clk, negedge rst) begin
        if (~rst) begin
            cnt <= 4'h0;  
        end else begin
            cnt <= nxt_cnt;  
        end
    end

endmodule
