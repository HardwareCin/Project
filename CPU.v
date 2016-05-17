module CPU (Clock, Reset

input Clock;
input Reset;


//Registradores

Registrador RPC (Clock, ResetPC, PCWrite, PCIn, PCOut);						//Registrador para o PC
Registrador RA (Clock, ResetA, WriteA, AIn, PCOut);							//Registrador A
Registrador RB (Clock, ResetB, WriteB, BIn, PCOut);							//Registrador B
Registrador RALUOut (Clock, ResetAluOut, WriteAluOut, AluOutIn, AluOutOut);	//Registrador ALUOut
Registrador REPC (Clock, ResetEPC, EPCWrite, EPCIn, EPCOut);				//Registrador EPC
Registrador RHigh (Clock, ResetHigh, HighWrite, HighIn, HighOut);			//Registrador High
Registrador RLow (Clock, ResetLow, LowWrite, LowIn, LowCOut);				//Registrador Low
Registrador RMDR (Clock, ResetMDR, MDRWrite, MDRIn, MDROut);				//Registrador MDR

//Multiplexadores

MuxAluSrcA MAluSrcA(AluSrcA, PC, A, MDR, saida);									//Multiplexador ALUSrcA
MuxAluSrcB MAluSrcB(AluSrcB, B, ImeOf, ImeOf2, saida);								//Multiplexador ALUSrcB
MuxDois MDiv(decisao, ent1, ent2, saida);											//Multiplexador de Divis�o
MuxDois MMul(decisao, ent1, ent2, saida);											//Multiplexador de Multiplica��o
MuxDois MuxSC(decisao, ent1, ent2, saida);											//Multiplexador StoreControl
MuxMreg MReg(MReg, RS, saida);														//Multiplexador MReg
MuxIorD MIorD(IorD, PC, AluOut, A_Imediato, saida);									//Multiplexador IorD
MuxMuxPC MPC(MuxPC, AluOut, EPC, offset, PC, Alu_Imediato, saida);					//Multiplexador ap�s o PC
MuxMuxLC MLC(MuxLC, full, half, single, saida);										//Multiplexador LoadControl
MuxMemToReg MMtoReg(MemToReg, AluOut, MDR, High, Low, PC, LT, RegDes, ImeOf, saida);//Multiplexador MtoReg (� bom mudar depois porque n�o faz sentido rs)
MuxRegDst MRegDst(RegDst, RT, RD, saida);											//Multiplexador RegDst

endmodule
