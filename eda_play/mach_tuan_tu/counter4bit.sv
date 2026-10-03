`timescale 1ns/1ps

module counter_4bit ( 
  input clk, rst, en , 
  output reg [3:0] count 
); 
   always @(posedge clk) begin 
     if  (rst)  begin 
     count<=4'b0000 ; 
     end 
     else  begin 
       if (en) count<= count +1 ; 
     end 
  end 
endmodule 

       
