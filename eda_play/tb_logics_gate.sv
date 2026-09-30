`timescale 1ns/1ps

module tb_logics_gate;

    reg  a, b;
    wire y_and, y_or, y_not, y_nand, y_nor, y_xor, y_xnor;

    and_gate  u_and  (.a(a), .b(b), .y(y_and));
    or_gate   u_or   (.a(a), .b(b), .y(y_or));
    not_gate  u_not  (.a(a),.y(y_not));
    nand_gate u_nand (.a(a), .b(b), .y(y_nand));
    nor_gate  u_nor  (.a(a), .b(b), .y(y_nor));
    xor_gate  u_xor  (.a(a), .b(b), .y(y_xor));
    xnor_gate u_xnor (.a(a), .b(b), .y(y_xnor));

    initial begin
        $dumpfile("logics_gate.vcd");
        $dumpvars(0, tb_logics_gate);
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end

    always @(a or b) begin
        #1;
        $display("%b  %b |  %b   %b    %b    %b   %b    %b    %b",
                 a, b, y_and, y_or, y_nand, y_nor, y_xor, y_xnor, y_not);
    end

endmodule
