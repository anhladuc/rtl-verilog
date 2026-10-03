`timescale 1ns/1ps

module mux4_1 ( 
 input [1:0] s,
 input d0,d1,d2,d3, 
 output reg y
); 
 always @(*) begin 
  case(s) 
   2'b00: y = d0 ; 
   2'b01: y = d1 ;  
   2'b10: y = d2 ; 
   2'b11: y = d3 ;  
  endcase 
 end 
endmodule

module demux ( 
 input [1:0] s, 
 input d, 
 output reg [3:0] y 
); 
 always @(*) begin  
    y = 4'b0000;
    case(s) 
        2'b00: y[0] = d ;
        2'b01: y[1] = d ;
        2'b10: y[2] = d ;
        2'b11: y[3] = d ;
    endcase 
 end 
endmodule
