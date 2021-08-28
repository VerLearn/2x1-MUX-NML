module test_mux();
  reg in1,in2,select,clk;
  wire blue1,blue2,blue3,blue4,blue5,blue6,orange1,orange2,orange3,orange4,orange5,orange6,orange7,red1,red2,red3,out;
// -----------Instantiating the design under test.------------  
  mux_model DUT1( blue1,blue2,blue3,blue4,blue5,blue6,red1,red2,red3,orange1,orange2,orange3,orange4,orange5,orange6,orange7,in1,in2,select,out,clk);
  always #5 clk=~clk;
  initial begin
    clk=0;
    $dumpfile("test_mux.vcd");
    $dumpvars;
    $monitor("Output=%b orange1=%b orange2=%b orange3=%b orange4=%b orange5=%b orange6=%b orange7=%b blue1=%b blue2=%b blue3=%b blue4=%b blue5=%b blue6=%b red1=%b red2=%b red3=%b",out,orange1,orange2,orange3,orange4,orange5,orange6,orange7,blue1,blue2,blue3,blue4,blue5,blue6,red1,red2,red3);
// --------------------Providing inputs---------------------    
    #14 in1=1;in2=0;select=0;
    #40 $finish;
  end
endmodule
