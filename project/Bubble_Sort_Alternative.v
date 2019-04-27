module Bubble_Sort_Alternative#(parameter word_size=4)(
input clk,rst,Load,Sort,Send,
input [word_size-1:0]Data_in,
output Ready,Busy,Waiting,
output [word_size-1:0]Data_out

);


Control Control_inst(
clk, rst, Send, Sort, Load, gt, i_lte_N, j_gte_i, done, //1¸´Î»
Ready,Busy,Waiting,ld,snd,
set_i,incr_i,set_j,decr_j, clr_k, incr_k, swap
);

Datapath Datapath_inst(
Data_in,
clk,rst,set_i,incr_i,set_j,decr_j, clr_k, incr_k, swap,snd, ld,
Data_out,
gt, i_lte_N, j_gte_i, done
);

endmodule