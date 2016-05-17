module MuxAluSrcA (AluSrcA, PC, A, MDR, saida);

input[1:0] AluSrcA;
input[31:0] PC;
input[31:0] A;
input[31:0] MDR;
output reg [31:0] saida;

always @(AluSrcA)
begin

case(AluSrcA)
2'd0: saida <= PC;
2'd1: saida <= A;
2'd2: saida <= MDR;
endcase

end
endmodule
