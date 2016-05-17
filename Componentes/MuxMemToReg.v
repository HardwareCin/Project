module MuxMemToReg(MemToReg, AluOut, MDR, High, Low, PC, LT, RegDes, ImeOf, saida);

input [2:0] MemToReg;
input [31:0] AluOut;
input [31:0] MDR;
input [31:0] High;
input [31:0] Low;
input [31:0] PC;
input [31:0] LT;
input [31:0] RegDes;
input [31:0] ImeOf;
output reg [31:0] saida;

always @(MemToReg)
begin

case(MemToReg)
3'd0: saida <= AluOut;
3'd1: saida <= MDR;
3'd2: saida <= High;
3'd3: saida <= Low;
3'd4: saida <= PC;
3'd5: saida <= LT;
3'd6: saida <= RegDes;
3'd7: saida <= ImeOf;
endcase

end
endmodule

