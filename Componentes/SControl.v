module SControl(BoH, memoria, B, saida);

input BoH;
input [31:0]memoria;
input [31:0]B;
output reg [31:0] saida;

always @ (BoH)
begin 

saida = memoria;

case(BoH)
1'd0:
	saida[15:0] = B[15:0];
1'd1:
	saida[7:0] = B[7:0];
endcase 

end
endmodule
