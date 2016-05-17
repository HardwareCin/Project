module MuxIorD (IorD, PC, AluOut, A_Imediato, saida);

input [2:0] IorD;
input [31:0] PC;
input [31:0] AluOut;
input [31:0] A_Imediato;
output reg [31:0] saida;

always @(IorD)
begin

case (IorD)
3'd0:saida <= PC; //Sa�da do PC
3'd1:saida <= A_Imediato; //Sa�da imediata do banco de registradores do rs
3'd2:saida <= 32'h253; //Sa�da da primeira exce��o (overflow = 1)
3'd3:saida <= 32'h254; //Sa�da da segunda exce��o (divZero = 1)
3'd4:saida <= 32'h255; //Sa�da da terceira exce��o (Opcode Inexistente)
3'd5:saida <= AluOut; // Sa�da da ULA
endcase

end
endmodule

