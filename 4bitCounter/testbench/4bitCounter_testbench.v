module testbench(); 
  reg clk = 0;
  reg rst = 0;
  wire [3:0] count;

  always 
    #1 clk = ~clk;

  top ai45(.clk(clk), .rst(rst), .count(count)); 

  initial begin 
    // Phase 1: Test the initial reset
    #10
  
    // Phase 2: Test the full counting sequence
    rst = 1;
    #40
    
    // Phase 3: Test the reset priority
    rst = 0;
    
    #10 $finish; 
  end 

  initial begin 
	$dumpfile("testbench.vcd");
    $dumpvars(0, testbench);
  end 
endmodule
