`timescale 1ns/1ps

module tb_FIFO;
    reg clk, rst, wr_en, rd_en;
    reg [7:0] din;
    wire [7:0] dout;
    wire full, empty;
    integer i;

    FIFO_8bit u_fifo (.clk(clk), .rst(rst), .wr_en(wr_en), .rd_en(rd_en),
                      .din(din), .dout(dout), .full(full), .empty(empty));

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $monitor("t=%0t wr=%b rd=%b din=%d dout=%d full=%b empty=%b count=%d",
                 $time, wr_en, rd_en, din, dout, full, empty, u_fifo.count);
        $dumpfile("fifo.vcd");
        $dumpvars(0, tb_FIFO);

        // Pha 1: khởi tạo
        rst = 1; wr_en = 0; rd_en = 0; din = 8'd0;
        // Pha 2, 3: reset rồi thả
        repeat (2) @(posedge clk);
        #1;
        rst = 0;

        // Bước B: ghi 8 giá trị
        for (i = 0; i < 8; i = i + 1) begin
            din = i + 10;
            wr_en = 1;
            @(posedge clk); #1;
        end
        wr_en = 0;

        // Bước C: ghi thừa (FIFO đã đầy, các lần ghi bị chặn)
        for (i = 0; i < 3; i = i + 1) begin
            din = 8'd99;
            wr_en = 1;
            @(posedge clk); #1;
        end
        wr_en = 0;

        // Bước D: đọc 8 lần
        rd_en = 1;
        for (i = 0; i < 8; i = i + 1) begin
            @(posedge clk); #1;
        end
        rd_en = 0;

        // Bước E: đọc thừa (FIFO đã rỗng, các lần đọc bị chặn)
        rd_en = 1;
        for (i = 0; i < 3; i = i + 1) begin
            @(posedge clk); #1;
        end
        rd_en = 0;

        // Bước F: ghi + đọc cùng lúc
        din = 8'd77;
        wr_en = 1; rd_en = 1;
        repeat (4) @(posedge clk); #1;
        wr_en = 0; rd_en = 0;

        #20;
        $finish;
    end
endmodule
