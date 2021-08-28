module test_mux();
  reg in1,in2,select;
  wire out;
// -----------Instantiating the design under test.------------  
  majority_mux DUT1(in1,in2,select,out);
  initial begin
    $dumpfile("test_mux.vcd");
    $dumpvars;
    $monitor("Output=%b",out);
// --------------------Providing inputs---------------------    
    in1=1;in2=0;select=0;
    #3 select=1;
    #5 $finish;
  end
endmodule
