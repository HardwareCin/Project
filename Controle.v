module Controle(IorD, shiftCont, divOrMul, zero, writeH, writeL, WEPC, LT, ET, GT, MuxPC, AluOP, AluSrcA, AluSrcB, WriteA, WriteB, RegWrite, Reset, memToReg, IRWrite, MemWrite, muxSC, muxLC, MDST, PCWrite, clock, opCode, DivZero, DtoC, CtoD, MtoC, CtoM, MReg);

input reset;
input DtoC;
input clock;
input DivZero;
input MtoC;
input [5:0] opCode;
input LT;
input ET;
input GT;
input zero;
input Reset;
input AluOFlow;
input [5:0] Funct;

reg [1:0] branchGamb;

output reg CtoD;
output reg CtoM;
output reg PCWrite;
output reg [2:0] IorD;
output reg MemWrite;//Memoria, 0 lida 1 escrita (DAFUQ)
output reg IRwrite;
output reg MReg;
output reg [2:0] MDST;
output reg [3:0] memToReg;
output reg RegWrite;
output reg WriteA;
output reg WriteB;
output reg [1:0] AluSrcA;
output reg [1:0] AluSrcB;
output reg [2:0] MuxPC;
output reg [2:0] AluOP;
output reg WEPC;
output reg writeH;
output reg writeL;
output reg divOrMul;
output reg [1:0] muxLC;
output reg [1:0] muxSC;
output reg shiftCont;

reg [7:0] state;

//Estados

parameter #Reset 8'd0;
parameter #IF 8'd1;
parameter #Wait 8'd2;
parameter #decode 8'd3;
parameter #IrLoad 8'd4;
parameter #DecisionA 8'd5;
parameter #DecisionB 8'd6;
parameter #AluOperations 8'd7;
parameter #Aluadd 8'd8;
parameter #Alusub 8'd9;
parameter #Aluand 8'd10;
parameter #Aluslt 8'd11;
parameter #RWrite 8'd12;
parameter #loadDiv 8'd13;
parameter #waitDiv 8'14;
parameter #DivZero 8'd15;
parameter #loadMul 8'd16;
parameter #waitMul 8'17;
parameter #BshtSmt 8'd18
parameter #writeHL 8'd19;
parameter #AsftB 8'd20;
parameter #sftLoad 8'd21;
parameter #sftleft 8'd22;
parameter #logsftright 8'd23;
parameter #artsftright 8'd24;
parameter #shifttoreg 8'd25;
parameter #jrt 8'd26;
parameter #calcAD 8'd27;
parameter #opCodeInexist 8'd28;
parameter #overflow 8'd29;
parameter #Sel_rs_rt 8'd30;
parameter #Write_A_B 8'd31;
parameter #PCW 8'd32;
parameter #SelRegA_Ula 8'd33;
parameter #Addiu 8'd34;
parameter #Addi 8'd35;
parameter #WdataAluOut 8'd36;
parameter #SW 8'd37;
parameter #Sbyte 8'd38;
parameter #SHalf 8'd39;
parameter #SEnd 8'd40;
parameter #Loads 8'd41;
parameter #LW 8'd42;
parameter #LoadByte 8'd43;
parameter #LoadHalf 8'd44;
parameter #MDRWrite 8'd45;
parameter #MemToReg 8'd46;
parameter #MDRWrite 8'd47;
parameter #WaitBeforeIF 8'd48;
parameter #j 8'd49;
parameter #jal 8'd50;
parameter #rte 8'd51;
parameter #jal_2 8'd52;
parameter #Mflo 8'd53;
parameter #Mfhi 8'd54;
parameter #break 8'd55;
parameter #BranchBegin 8'd56;
parameter #BranchCalc 8'd57;
parameter #branchSource 8'd58;
parameter #branchComp 8'd59; 
parameter #sltiLoad 8'd60;
parameter #sltiWA 8'd61;
parameter #sltiSelect 8'd62;
parameter #sltiOP 8'd63;
parameter #lui 8'd64;
parameter #push_1 8'd65;
parameter #push_2 8'd66;
parameter #push_3 8'd67;
parameter #push_4 8'd68;
parameter #push_5 8'd69;
parameter #push_6 8'd70;
parameter #pop_1 8'd71;
parameter #pop_2 8'd72;
parameter #pop_3 8'd73;
parameter #pop_4 8'd74;
parameter #pop_5 8'd75;
parameter #pop_6 8'd76;
parameter #Exc_1 8'd77;
parameter #Exc_2 8'd78;
parameter #Exc_3 8'd79;
parameter #Exc_4 8'd80;

initial begin
	state<=Reset;
end

always @ (negedge clock) begin
	if(reset)begin
		state<=Reset;
	end
	else begin
		
	end
end
