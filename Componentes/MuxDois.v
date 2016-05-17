module MuxDois(decisao, ent1, ent2, saida);

input decisao;
input [31:0] ent1;
input [31:0] ent2;
output reg [31:0] saida;

always @(decisao)
begin

case(decisao)
1'd0: saida <= ent1;
1'd1: saida <= ent2;
endcase

end
endmodule
 