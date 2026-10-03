`timescale 1ns/1ps

module FIFO_8bit( 
   input clk,rst,wr_en,rd_en, 
   input [7:0] din, 
   output reg [7:0] dout , 
   output full,empty 
);
   reg [7:0] mem [0:7] ; 
   reg [2:0] wr_ptr ; 
   reg [2:0] rd_ptr ; 
   reg [3:0] count ; 
   
   assign empty= (count==4'd0) ; 
   assign full= (count==4'd8)  ;  
   
   wire do_wr= wr_en && !full ; 
   wire do_rd = rd_en && !empty;
   
   always @(posedge clk) begin 
     if (rst) begin 
       wr_ptr<=0 ; 
       rd_ptr<=0 ;
       count<=0; 
       dout<=8'b0 ; 
     end 
     else begin 
       if (do_wr) begin 
          mem[wr_ptr]<=din; 
          wr_ptr<=wr_ptr+1'b1 ; 
          
      end 
      if (do_rd) begin 
         dout<=mem[rd_ptr] ; 
         rd_ptr<=rd_ptr+1'b1 ; 
  
      end  
      case ({do_wr,do_rd})
        2'b00: count<=count ; 
        2'b10: count<=count+1'b1; 
        2'b01: count<=count -1'b1; 
        2'b11: count<=count ; 
      endcase 
     end 
  end
endmodule
