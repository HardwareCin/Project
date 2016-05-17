module div(A, B, DtoC, CtoD, High, Low, Clock, Reset);
  input [31:0] A;
  input [31:0] B;
  input CtoD;
  input Clock;
  input Reset;
  integer Counter;
  reg neg;
  reg [31:0] Bb,Aa;
  output reg DtoC;
  output reg [31:0] High;
  output reg [31:0] Low;
  output reg DivZero;
  always @(negedge Clock) begin
	if(reset==0)begin
		if(CtoD)begin
			Counter=30;
			neg<=A[31]^B[31];
			if(A[31])begin
				Aa<=(~A);//+1
			end
			else begin
				Aa<=A;
			end
			if(B[31])begin
				Bb<=(~B);//+1
			end
			else begin
				Bb<=B;
			end
		end
		if(Counter==0)begin
			
		end		
	end
  
  	
  end
endmodule
