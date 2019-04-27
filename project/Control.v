module Control(
input  clk, rst, Send, Sort, Load, gt, i_lte_N, j_gte_i, done, //1复位
output Ready,Busy,Waiting,
output reg ld,snd,set_i,incr_i,set_j,decr_j, clr_k, incr_k, swap
);
parameter 
state_N =    3,  
S_rst   =    0,
S_init  =    1,
S_idle  =    2,
S_load  =    3,
S_prep  =    4,
S_sort  =    5,
S_wait  =    6,
S_send  =    7;


reg [state_N-1:0]state,next_state;
assign Ready   = (state==S_idle);
assign Busy    = (state==S_sort);
assign Waiting = (state==S_wait);
//assign ld	   = (state==S_load);
//assign snd     = (state==S_send);

always@(posedge clk) if(rst) state<=S_rst; else state<=next_state;

always@(state,Send, Sort, Load, gt, i_lte_N, j_gte_i, done, ld)
begin
next_state=S_rst;ld=0;set_i=0;incr_i=0;set_j=0;decr_j=0;clr_k=0;incr_k=0; swap=0;snd=0;
	case(state)
		S_rst  : if(rst) next_state=S_rst;
				 else    next_state=S_init;
		S_init : begin    next_state=S_idle; clr_k=1'b1; end
		S_idle : if(Load) next_state=S_load;
				 else if(Sort) begin next_state = S_prep; set_j=1'b1; set_i=1'b1; end
				 else next_state =S_idle;
		S_load : if(!done)begin incr_k=1'b1;ld=1'b1; next_state = S_load;end //需要检查snd对不对
				 else next_state = S_init;
		S_prep : if(gt)next_state=S_sort;//检查gt
				 else begin next_state=S_sort;swap=1'b1;decr_j=1'b1; end
		S_sort : if(j_gte_i)begin if(gt) begin next_state=S_sort; swap=1'b1;decr_j=1'b1; end 
							      else begin decr_j=1'b1;next_state=S_sort ;end 
							end
				 else begin if(i_lte_N) begin next_state=S_sort;set_j=1'b1;incr_i=1'b1; end
							else if(Send)begin next_state=S_send;clr_k=1'b1; end 
							     else    begin next_state=S_wait; end
					  end
		S_wait : if(Send)begin clr_k=1'b1; next_state=S_send; end
				 else next_state=S_wait;
		S_send : if(done) next_state=S_init;
				 else begin incr_k=1'b1;snd=1'b1;next_state=S_send; end	
	endcase
end

endmodule