`timescale 1ns/1ps

module tb_halffull;
    reg A, B, Cin;
    wire sum_h, carry_h;
    wire sum_f, cout;
    integer i;

    half_add u_half (.A_h(A), .B_h(B), .sum_h(sum_h), .carry_h(carry_h));
    full_add u_full (.A_f(A), .B_f(B), .Cin(Cin), .sum_f(sum_f), .cout(cout));

    initial begin
      $dumpfile("half_full.vcd");
      $dumpvars(0, tb_halffull);

      for ( i=0 ; i<8 ; i=i+1) begin
       {A,B,Cin}=i ;
       #10 ;
       $display("t=%0t A=%b B=%b Cin=%b sum_h=%b carry_h=%b sum_f=%b cout=%b",
                $time,A,B,Cin,sum_h,carry_h,sum_f,cout);
      end
    $finish;
    end
endmodule
