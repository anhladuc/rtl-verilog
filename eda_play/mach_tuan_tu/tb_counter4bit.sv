`timescale 1ns/1ps 
module tb_counter4bit ; 
  reg en,clk, rst; 
  wire [3:0] count ; 
  
  counter_4bit u_counter(.en(en),.clk(clk),.rst(rst),.count(count)) ; 
  
  initial clk = 0 ;
  always #5 clk = ~clk ;

  initial begin 
    $monitor("t=%0t en=%b rst=%b clk=%b count=%b ",$time,en,rst,clk,count) ; 
    $dumpfile("counter4bit.vcd");
    $dumpvars(0, tb_counter4bit);

    rst=1; en=0; #10 ; 
    rst=0; en=1; #40 ; 
    rst=1; en=0; #10 ;
    rst=1; en=1; #10 ;
    rst=1; en=1; #10 ; 
    rst=0; en=0; #10 ; 
 
 $finish; 
  end 
endmodule 
