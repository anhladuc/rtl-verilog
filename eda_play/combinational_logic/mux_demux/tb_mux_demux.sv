`timescale 1ns/1ps

module tb_mux_demux ; 
  reg d0,d1,d2,d3 ; 
  reg [1:0] s; 
  wire y ;   
  reg d_de; 
  reg [1:0] s_de; 
  wire [3:0] y_de;
  
  
  mux4_1 u_mux41(.d0(d0),.d1(d1),.d2(d2),.d3(d3),.s(s),.y(y)); 
  demux u_demux(.s(s_de),.d(d_de),.y(y_de)) ;
  integer i ;  
  
  initial begin  
  d0=1'b1;
  d1=1'b0;
  d2=1'b1;
  d3=1'b0; 
  d_de=1'b1; 
   for(i=0; i<4; i=i+1) begin 
     s_de=i ;  
     #10 ;  
     $display("t=%0t s_de=%b y_de=%b",$time,s_de,y_de) ; 
   end   
   
   for(i=0; i<4; i=i+1) begin 
     s=i ; 
     #10 ;  
     $display("t=%0t s=%b y=%b",$time,s,y) ; 
   end  
   $finish ;
  end   
 endmodule 
   
  
