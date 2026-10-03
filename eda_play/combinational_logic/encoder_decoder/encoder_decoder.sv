`timescale 1ns/1ps

module encoder4_2 ( 
 input [3:0] I ,
 output reg [1:0] Y
); 
 always @(*) begin 
  if (I[0]) Y=2'b00; 
  else if (I[1]) Y=2'b01; 
  else if (I[2]) Y=2'b10; 
  else Y=2'b11; 
 end
endmodule  

module decoder2_4 ( 
 input [1:0] in, 
 output reg [3:0] Y  
); 
 always @(*) begin 
  case(in) 
    2'b00: Y = 4'b0001; 
    2'b01: Y = 4'b0010; 
    2'b10: Y = 4'b0100; 
    2'b11: Y = 4'b1000; 
    default: Y =  4'b0000; 
   endcase 
 end 
endmodule 

    

   
