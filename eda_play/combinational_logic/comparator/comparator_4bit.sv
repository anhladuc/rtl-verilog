`timescale 1ns/1ps

module comparator_4bit ( 
  input [3:0] A,B, 
  output GT,EQ,LT
); 
  assign GT = (A>B); 
  assign EQ = (A==B); 
  assign LT = (A<B); 
endmodule 

