module Datapath #(parameter word_size=4,N=8)(
input   [word_size-1:0]Data_in,
input   clk,rst,set_i,incr_i,set_j,decr_j, clr_k, incr_k, swap,snd,ld,
output  [word_size-1:0]Data_out,
output  gt, i_lte_N, j_gte_i, done
);
reg [word_size-1:0] A [1:N];//array of words
reg [word_size-1:0] i,j,k;
assign Data_out=A[1];

assign gt      = (A[j-1]>A[j]);//compare words
assign i_lte_N = (j<=N);
assign j_gte_i = (i<j);
assign done    = (k==N);

always@(posedge clk)
begin
	if(rst)begin i<=0;j<=0;k<=0;A[1]<=0;A[2]<=0;A[3]<=0;A[4]<=0;A[5]<=0;A[6]<=0;A[7]<=0;A[7]<=0; A[8]<=0;end
	else begin 
			if(ld    ) begin A[1]<=Data_in;A[2]<=A[1];A[3]<=A[2];A[4]<=A[3];A[5]<=A[4];A[6]<=A[5];A[7]<=A[6];A[8]<=A[7]; end 
			if(set_i ) i<=4'd2;
			if(incr_i) i<=i+1'b1;
			if(set_j ) j<=N;
			if(decr_j) j<=j-1'b1;
			if(clr_k ) k<=0;
			if(incr_k) k<=k+1;
			if(swap  ) begin  A[j]<=A[j-1];A[j-1]<=A[j]; end
			if(snd   ) begin  A[8]<=A[7];A[7]<=A[6];A[6]<=A[5];A[5]<=A[4];A[4]<=A[3];A[3]<=A[2];A[2]<=A[1];A[1]<=0; end
		 end
end

endmodule