`timescale 1ns/1ps

module tb_encoder_decoder;

    reg  [3:0] I_ENC;
    wire [1:0] Y_ENC;

    reg  [1:0] I_DEC;
    wire [3:0] Y_DEC;

    encoder4_2 u_enc (.I(I_ENC), .Y(Y_ENC));
    decoder2_4 u_dec (.in(I_DEC), .Y(Y_DEC));

    integer i;

    initial begin
        $dumpfile("encoder_decoder.vcd");
        $dumpvars(0, tb_encoder_decoder);

        $display("--- ENCODER 4:2 ---");
        $display("    I     Y");
        for (i = 0; i < 4; i = i + 1) begin
            I_ENC = 4'b0001 << i;
            #10;
            $display(" %b  %b", I_ENC, Y_ENC);
        end

        $display("--- DECODER 2:4 ---");
        $display("  I   Y");
        for (i = 0; i < 4; i = i + 1) begin
            I_DEC = i[1:0];
            #10;
            $display(" %b  %b", I_DEC, Y_DEC);
        end

        $finish;
    end

endmodule
