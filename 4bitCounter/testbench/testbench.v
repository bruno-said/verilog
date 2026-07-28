module testbench(); 

reg clk = 0;
reg rst = 0;
wire [3:0] count;


always 
 #1 clk = ~clk;

 top ai45( .clk(clk), .rst(rst), .count(count)); 


initial begin 

	#1000 $finish; 

end 



initial begin 

	$dumpfile("testbench.vcd");

	$dumpvars(0,testbench);

end 



endmodule 

