module Bubble_Sort_Alternative_tb();
parameter word_size=4;
wire [word_size-1:0] Data_out;
wire Ready,Busy,Waiting;
reg clk,rst,Load,Sort,Send;
reg [word_size-1:0]Data_in;

Bubble_Sort_Alternative Bubble_Sort_Alternative_inst(
clk,rst,Load,Sort,Send,
Data_in,
Ready,Busy,Waiting,
Data_out

);

//initial begin #10000 $finish ;end 

initial
begin
//first test
#0   Data_in=0;
#0   Sort=0;
#0   Send=0;
#0   Load=0;

#0   clk=0;
#0   rst=0; #10 rst=1; #10 rst=0;
#5
#10  Load=1;
#40  Data_in=6;
#10  Data_in=1;
#10  Data_in=3;
#10  Data_in=5;
#10  Data_in=7;
#10  Data_in=8;
#10  Data_in=2;
#10  Data_in=10;
#10  Load=0;

#100 Sort=1;#300 Sort=0;
#100 Send=1;#300 Send=0;

//second test
#1000
#0   rst=0; #10 rst=1; #10 rst=0;
#10  Load=1;
#40  Data_in=11;
#10  Data_in=13;
#10  Data_in=1;
#10  Data_in=5;
#10  Data_in=9;
#10  Data_in=4;
#10  Data_in=3;
#10  Data_in=8;
#10  Load=0;

#100 Sort=1;#100 Sort=0;
#100 Send=1;#100 Send=0;


end

always #5 clk=~clk;
endmodule