`timescale 1ns/1ps

module jk_ff( 
  input clk , rst , j, k , 
  output reg Q 
); 
 always @(posedge clk) begin 
   if (rst) Q <= 0 ; 
   else 
     if ({j,k}==2'b01) Q<=0; 
     else if ({j,k}==2'b11) Q<=~Q ; 
     else if ({j,k}==2'b10) Q<=1 ; 
     else  Q<=Q ; 
 end 
endmodule  

module rs_ff ( 
  input clk,r,s, 
  output reg Q 
); 
  always @(posedge clk) begin 
   case ({r,s}) 
      2'b10: Q<=1'b0 ; 
      2'b01: Q<=1'b1;
      2'b11: Q<=1'bx ; 
      2'b00: Q<=Q ; 
   endcase
  end
endmodule  

module D_ff ( 
  input clk,d,rst, 
  output reg Q 
); 
  always @(posedge clk or posedge rst ) begin 
     if (rst) begin 
        Q<=0 ; 
        end 
     else begin 
      Q<=d; 
     end 
  end 
endmodule  


module t_ff ( 
  input clk,t,rst, 
  output reg Q 
); 
  always @(posedge clk or posedge rst) begin 
    if (rst) begin 
       Q<=0 ; 
    end 
    else begin 
     case (t) 
       1'b0: Q<=Q ; 
       1'b1: Q<=~Q ; 
     endcase 
   end 
 end 
endmodule 


    
   
    


