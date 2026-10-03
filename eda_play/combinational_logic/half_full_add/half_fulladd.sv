`timescale 1ns/1ps

module half_add(
  input A_h,B_h,
  output sum_h,carry_h 
 ); 
   assign sum_h = A_h ^ B_h ; 
   assign carry_h = A_h & B_h ; 
endmodule 

module full_add( 
  input A_f,B_f,Cin,
  output sum_f,cout 
); 
  assign sum_f = A_f ^ B_f ^ Cin ; 
  assign cout = A_f & B_f | Cin & (A_f ^ B_f) ; 
endmodule 

