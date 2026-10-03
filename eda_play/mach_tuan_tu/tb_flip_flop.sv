`timescale 1ns/1ps

module tb_flip_flop ; 
  reg clk,rst ,j,k,r,s,d,t ;
  wire Q_jk,Q_rs,Q_d,Q_t; 
  
  jk_ff u_jk(.clk(clk),.rst(rst),.j(j),.k(k),.Q(Q_jk)); 
  rs_ff u_rs(.r(r),.s(s),.clk(clk),.Q(Q_rs)); 
  D_ff u_D(.rst(rst),.d(d),.clk(clk),.Q(Q_d));  
  t_ff u_t(.rst(rst),.t(t),.clk(clk),.Q(Q_t)); 
  initial clk = 0 ;
  always #5 clk = ~clk ;
  initial begin  
     $monitor("t=%0t rst=%b j=%b k=%b Q_jk=%b | r=%b s=%b Q_rs=%b | d=%b Q_d=%b | T=%b Q_t=%b",
              $time,rst,j,k,Q_jk,r,s,Q_rs,d,Q_d,t,Q_t);
     $dumpfile("flip_flop.vcd");
     $dumpvars(0, tb_flip_flop);

 t=1; d=0;rst=1;{j,k}=2'b00; {r,s}=2'b10; #10 ; 
 t=0 ;d=0;rst=0; {j,k}=2'b01; {r,s}=2'b01; #10; 
 t=1; d=1; rst=0; {j,k}=2'b10 ; {r,s}=2'b00; #10 ; 
 t=1; d=0; rst=0; {j,k}=2'b11 ; {r,s}=2'b11; #10 ; 
 t=0; d=1 ; rst=0; {j,k}=2'b11 ; {r,s}=2'b10; #10 ;
 t=1; d=0; rst=0; {j,k}=2'b00 ; {r,s}=2'b01; #10 ;
 t=0;  d=1;  rst=1 ; {r,s}=2'b00; #10 ; 
   $finish; 
  end 
endmodule 
