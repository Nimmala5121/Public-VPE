module seq_det101_mealy  (
    input      rst,     
    input      clk,    
    input      x,       
    output reg y        
);

parameter SIZE = 2;
parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;

reg [SIZE-1:0] cur_state; 
reg [SIZE-1:0] nxt_state; 

//------------------State Register -----------------
always @ (posedge clk , negedge rst) begin
    if (~rst)
        cur_state <= S0;
    else
        cur_state <= nxt_state;
end

//-------Next State Combinational Circuit-----------
always @ (cur_state , x , rst) begin
    if (~rst) begin
        nxt_state <= S0;
    end else begin
        case(cur_state)
            S0: if(x) nxt_state <= S1; else nxt_state <= S0;
            S1: if(~x) nxt_state <= S2; else nxt_state <= S1;
            S2: if(x) nxt_state <= S1; else nxt_state <= S0;
            default: nxt_state <= S0;
        endcase
    end
end

//----------Output Combinational Circuit--------------

assign y = (cur_state==S2) & x;

endmodule
