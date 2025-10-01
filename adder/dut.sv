module adder(input clk,  
input reset, input [7:0] in1,in2, output reg [8:0] out);
always @(posedge clk or posedge reset) begin 
if(reset) 
out <= 0; 
else 
// Reset condition: set output to 0 
out <= in1 + in2; 
end 
endmodule
