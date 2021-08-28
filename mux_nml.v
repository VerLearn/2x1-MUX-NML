module mux_model(blue1,blue2,blue3,blue4,blue5,blue6,red1,red2,red3,orange1,orange2,orange3,orange4,orange5,orange6,orange7,in1,in2,select,out,clk);
  input in1,in2,select,clk;
// --------------Colours represent nano-magnetic units--------------------
// ------------------------Orange - input---------------------------------
// -------------------------Blue - wires----------------------------------
// -------------------------Red - output----------------------------------
  output reg
blue1,blue2,blue3,blue4,blue5,blue6,orange1,orange2,orange3,orange4,orange5,orange6,orange7,red1,red2,red3,out;
// ------------Declaring local parameters of the state machine.-----------  
  localparam s0=0,s1=1,s2=2,s3=3;
  reg [1:0]machine;
  always@(posedge clk) begin
    case(machine)
      s0: begin
//Finding MUX output using Boolean equation in terms of majority functions.        
    out=1&((0&(select^in2)|(select&in2))^(0&(~select^in1)|(~select&in1)))|((0&(select^in2)|(select&in2))&(0&(~select^in1)|(~select&in1)));
// ----------------Values of nano magnetic material units.---------------- 
        orange1=select;
        orange2=in2;
        orange3=0;
        orange4=~select;
        orange5=~in1;
        orange6=0;
        orange7=1;
        blue1=0&(select^in2)|(select&in2);
        blue2=0&(~select^in1)|(~select&in1);
        blue3=0;
        blue4=0;
        blue5=0;
        blue6=0;
        red1=0;
        red2=0;
        red3=0;
        machine=s1;
// Showing the states of nano magnetic material units.        
        $display("oranges are in switch state.");
        $display("Blues and reds are in reset.");
      end
      s1: begin
        orange1=select;
        orange2=in2;
        orange3=0;
        orange4=~select;
        orange5=~in1;
        orange6=0;
        orange7=1;
        blue1=0&(select^in2)|(select&in2);
        blue2=0&(~select^in1)|(~select&in1);
        blue3=0&(select^in2)|(select&in2);
        blue4=0&(~select^in1)|(~select&in1);
        blue5=0;
        blue6=0;
        red1=0&(select^in2)|(select&in2);
        red2=0&(~select^in1)|(~select&in1);
        red3=0;
        machine=s2;
        $display("Oranges are in hold state.");
        $display("Blue1 and blue2 are in switch state.");
        $display("Blue3, blue4, blue5, blue6 and reds are in reset.");
      end
      s2: begin
        orange1=select;
        orange2=in2;
        orange3=0;
        orange4=~select;
        orange5=~in1;
        orange6=0;
        orange7=1;
        blue1=0&(select^in2)|(select&in2);
        blue2=0&(~select^in1)|(~select&in1);
        blue3=0&(select^in2)|(select&in2);
        blue4=0&(~select^in1)|(~select&in1);
        blue5=out;
        blue6=0;
        red1=0&(select^in2)|(select&in2);
        red2=0&(~select^in1)|(~select&in1);
        red3=0;
        machine=s3;
        $display("Oranges are in hold state.");
        $display("Blue1 and blue3 are in hold state.");
        $display("Blue2, blue4, blue5, red1, red2 are in switch state.");
        $display("blue6, red3 are in reset state.");
      end
      s3: begin
        orange1=select;
        orange2=in2;
        orange3=0;
        orange4=~select;
        orange5=~in1;
        orange6=0;
        orange7=1;
        blue1=0&(select^in2)|(select&in2);
        blue2=0&(~select^in1)|(~select&in1);
        blue3=0&(select^in2)|(select&in2);
        blue4=0&(~select^in1)|(~select&in1);
        blue5=out;
        blue6=out;
        red1=0&(select^in2)|(select&in2);
        red2=0&(~select^in1)|(~select&in1);
        red3=out;
        machine=s0;
        $display("Oranges are in hold state.");
        $display("Blue1 and blue3 are in hold state.");
        $display("Blue2, blue4, blue5, red1, red2 are in hold state.");
        $display("blue6, red3 are in switch state.");
      end
      default: begin
        orange1=0;
        orange2=0;
        orange3=0;
        orange4=0;
        orange5=0;
        orange6=0;
        orange7=0;
        blue1=0;
        blue2=0;
        blue3=0;
        blue4=0;
        blue5=0;
        blue6=0;
        red1=0;
        red2=0;
        red3=0;
        machine=s0;
        $display("Global reset.");
      end
    endcase
  end
endmodule
