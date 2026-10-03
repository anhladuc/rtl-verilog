`timescale 1ns/1ps

module half_sub( 
  input A,B,
  output Diff,Borrow
); 
  assign Diff=A^B ; 
  assign Borrow= ~A & B; 
endmodule 
 
module full_sub( 
 input A,B,Bin, 
 output Diff,Borrow
); 	
 assign Diff= A ^ B ^ Bin ; 
 assign Borrow = ( ~A & B) | ~(A ^ B) & Bin; 
endmodule

