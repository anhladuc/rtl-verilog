`timescale 1ns/1ps

module tb_comparator_4bit ;
  reg [3:0] A,B;
  wire GT,EQ,LT;

  comparator_4bit u_comparator(.A(A),.B(B),.GT(GT),.EQ(EQ),.LT(LT));
  integer i,j ;

  initial begin
    $dumpfile("comparator_4bit.vcd");
    $dumpvars(0, tb_comparator_4bit);

    for ( i=0;i<16;i=i+1) begin
      for ( j=0;j<16;j=j+1) begin
         A=i ;
         B=j ;
         #10 ;
         $display("t=%0t A=%b B=%b GT=%b EQ=%b LT=%b",$time,A,B,GT,EQ,LT) ;
      end
    end
    $finish ;
  end
endmodule
