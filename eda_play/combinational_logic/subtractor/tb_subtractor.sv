`timescale 1ns/1ps 

module tb_subtractor ; 
  reg A,B,Bin ;
  wire Diff_h,Borrow_h,Diff_f,Borrow_f ; 
  integer i;  
  
  half_sub u_half(.A(A),.B(B),.Diff(Diff_h),.Borrow(Borrow_h)); 
  full_sub u_full(.A(A),.B(B),.Diff(Diff_f),.Bin(Bin),.Borrow(Borrow_f));
  
  initial begin 
    $dumpfile("subtractor.vcd");
    $dumpvars(0, tb_subtractor);

    for (i=0 ; i<8 ; i=i+1) begin 
      {A,B,Bin}=i ; 
      #10; 
      $display("t=%0t A=%b B=%b Bin=%b Diff_h=%b Borrow_h=%b Diff_f=%b Borrow_f=%b",
                $time,A,B,Bin,Diff_h,Borrow_h,Diff_f,Borrow_f);  
    end
    $finish;
  end
endmodule 
