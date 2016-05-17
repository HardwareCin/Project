module multiplicacao(A, B, MtoC, CtoM, High, Low, Clock, Reset);
  input [31:0] A;
  input [31:0] B;
  input CtoM;
  input Clock;
  input Reset;
  output reg MtoC;
  output reg [31:0] High;
  output reg [31:0] Low;
  integer Counter = 0, Result_comp2 = 0;
  reg [63:0] Result, aux, A_aux, ResultSub;
  reg [31:0] B_aux;
  reg [31:0] A_comp2, B_comp2;
  
  always @(negedge Clock) begin
	if (Reset) begin
		
	end
	
	if(Counter == 31) begin
		if(Result_comp2) begin
			Result <= ((~Result)+ 64'b1);
			Counter = 30;
			Result_comp2 = 0;
		end
		else begin
			High <= Result[63:32];
			Low <= Result[31:0];
			Counter = 0;
		end
	end
		
    if(CtoM) begin
      Counter = 0;
      Result <= 64'd0;
      if(A[31] && B[31]) begin
          A_aux <= {32'b0,~A + 32'b1};
          B_aux <= {~B + 1};
          Result_comp2 = 1'b0;
      end
      else if (A[31] && !B[31]) begin
		  A_aux <= {32'b0,~A + 32'b1};
          B_aux <= B;
		  Result_comp2 = 1'b1;
      end
      
      else if (!A[31] && B[31]) begin
          A_aux = {32'b0, A};
          B_aux <= {~B + 1};
          Result_comp2 = 1'b1;
      end
      
      else begin
        	A_aux = {32'b0, A};
      		B_aux <= B;
        	Result_comp2 = 1'b0;
      end
                
      MtoC <= 1'b0;
      
    end
    
    else if(B_aux[Counter]) begin
        aux = A_aux << Counter;
		Result <= Result + aux;
    end
    
    if(CtoM == 1'b0) begin
		Counter = Counter + 1;
		end
  
  	
  end
endmodule
