module MuxRegDst(RegDst, RT, RD, saida);

input [2:0] RegDst;
input [4:0] RT;
input [4:0] RD;
output reg [4:0] saida;

always @(RegDst)
begin 

case(RegDst)
3'd0: saida <= RT;
3'd1: saida <= RD;
3'd2: saida <= 5'd29;
3'd3: saida <= 5'd30;
3'd4: saida <= 5'd31;
endcase

end
endmodule

