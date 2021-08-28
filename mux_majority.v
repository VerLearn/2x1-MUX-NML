module majority_mux(in1,in2,select,out);
  input in1,in2,select;
  output reg out;
  always@(in1,in2,select) begin
//-------------------- Calling majority3 function.--------------------------
// ---Writing boolean function of 2x1 MUX in terms of majority function.----
    out=majority3(majority3(select,in2,0),majority3(~select,in1,0),1);
  end
// ------Majority function definition of 3-input majority function.--------- 
  function majority3(input inp1,inp2,inp3);   
    begin
    majority3=inp3&(inp1^inp2)|(inp1&inp2); 
    end
  endfunction
endmodule
