 entrou module top ( ---( 
 module 
  --- 
  
   input wire clk, ---inputwireclk, 
 clk 
   input wire rst, ---inputwirerst, 
 rst 
   output wire [3:0] count ---outputwire[3:0] 
 count 
  --- 
  
 ); --- 
 ); 
 //Instances of Modules ---Modules 
 //Instances 
 up_counter blk1837_4 ( ---( 
 up_counter 
          .clk (clk), --- 
  
          .rst_n (rst), --- 
  
          .count (count [3:0]) --- 
  
      ); --- 
  
  --- 
  
  --- 
  
 endmodule --- 
 endmodule 
  --- 
  
