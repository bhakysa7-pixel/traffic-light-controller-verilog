
module traffic;
// 00 is red state
// 01 is yellow state
// 10 is green state
reg clk;
reg [1:0] state;
reg [1:0] count;

initial begin 
    clk = 0;
    state = 2'b00;
    count=0;
end

always #5 clk = ~clk;

always @(posedge clk)
begin
    case(state)
     2'b00:
     begin
      if(count==3)
      begin 
        state<= 2'b01;
        count<=0;
      end
      else 
      begin
        count<=count+1;
      end
     end
     2'b01:
     begin
      if(count==3)
      begin 
        state<= 2'b10;
        count<=0;
      end
      else 
      begin
        count<=count+1;
      end
     end
     2'b10:
     begin
      if(count==1)
      begin 
        state<= 2'b00;
        count<=0;

      end
      else 
      begin
        count<=count+1;
      end
     end
    endcase
end
always @(posedge clk)
begin
    case(state)
        2'b00: $display("STATE = RED, count=%d",count);
        2'b01: $display("STATE = YELLOW, count=%d",count);
        2'b10: $display("STATE = GREEN, count=%d",count);
    endcase
end
initial begin
    #100;
    $finish;
end
endmodule 