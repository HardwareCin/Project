module MuxIorD (IorD, PC, AluOut, A_Imediato, saida);

input [2:0] IorD;
input [31:0] PC;
input [31:0] AluOut;
input [31:0] A_Imediato;
output reg [31:0] saida;

always @(IorD)
begin

case (IorD)
3'd0:saida <= PC; //Saída do PC
3'd1:saida <= A_Imediato; //Saída imediata do banco de registradores do rs
3'd2:saida <= 32'h253; //Saída da primeira exceção (overflow = 1)
3'd3:saida <= 32'h254; //Saída da segunda exceção (divZero = 1)
3'd4:saida <= 32'h255; //Saída da terceira exceção (Opcode Inexistente)
3'd5:saida <= AluOut; // Saída da ULA
endcase

end
endmodule

