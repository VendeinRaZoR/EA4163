module EA4163(
	I_VME_AS,
	I_VME_DS0,
	I_VME_DS1,
	I_VME_WR,
//	I_VME_IACK,
//	I_VME_IACK_IN,
	I_VME_LWORD,
	I_CLK_32M,
	I_VME_SYSRESET,
	//ADAPTER_NO,
//	I_M_17_24_IN,
//	I_M_9_16_IN,
//	I_M_1_8_IN,
	I_VME_A,
	I_VME_AM,
//	O_VME_IRQ,
//	O_VME_IACK_OUT,  
//	O_VME_BERR,
	/*KL_VME,
	O_RD_BUF_EN,
	O_WR_BUF_EN,
	LED_DISABLE,
	OUTPUTS_EN,
	F_17_24_TTL,
	F_17_24_KP,
	F_17_24_27B,
	MUX_1_8_EN,
	MUX_9_16_EN,
	MUX_17_24_EN,
	MUX_A_0,
	MUX_A_1,
	MUX_A_2,
	F_1_8_TTL,
	F_1_8_KP,
	F_1_8_27B,
	F_9_16_TTL,
	F_9_16_KP,
	F_9_16_27B,*/
	O_VME_DTACK_D,
	O_VME_DTACK_EN,
	O_OUT_CCH_3,
	O_OUT_CH_1,
	O_OUT_CH_2,
	VME_D
);

input	I_VME_AS; //global VME AS
input	I_VME_DS0;
input	I_VME_DS1;
input	I_VME_WR;
//input	I_VME_IACK;
//input	I_VME_IACK_IN;
input	I_VME_LWORD;
input	I_CLK_32M;
input	I_VME_SYSRESET;
//input	I_ADAPTER_NO;
//input	I_M_17_24_IN;
//input	I_M_9_16_IN;
//input	I_M_1_8_IN;
input	[15:1] I_VME_A;
input	[5:0] I_VME_AM;
//output	O_VME_IRQ;
//output	O_VME_IACK_OUT;
//output	O_VME_BERR;
/*output	KL_VME;
output	RD_BUF_EN;
output	WR_BUF_EN;
output	LED_DISABLE;
output	OUTPUTS_EN;
output	F_17_24_TTL;
output	F_17_24_KP;
output	F_17_24_27B;
output	MUX_1_8_EN;
output	MUX_9_16_EN;
output	MUX_17_24_EN;
output	MUX_A_0;
output	MUX_A_1;
output	MUX_A_2;
output	F_1_8_TTL;
output	F_1_8_KP;
output	F_1_8_27B;
output	F_9_16_TTL;
output	F_9_16_KP;
output	F_9_16_27B;*/
output	O_VME_DTACK_D;
output	O_VME_DTACK_EN;
output	[23:16] O_OUT_CCH_3;
output	[7:0] O_OUT_CH_1;
output	[15:8] O_OUT_CH_2;
inout	[15:0] VME_D;

wire sysclk;//local VME clock
wire sysres;//local VME reset
wire ds0;//local VME DS0
wire ds1;//local VME DS1
wire as;
wire wr;//local VME WRITE

wire addr7C;
wire addr7C80; //FORMAT 1-8 CHANNELS INPUT REGISTER ADDRESS
wire addr7C82; //FORMAT 9-16 CHANNELS INPUT REGISTER ADDRESS
wire addr7C84; //FORMAT 17-24 CHANNELS INPUT REGISTER ADDRESS 
wire addr7C86; //FORMAT 25-32 CHANNELS INPUT REGISTER ADDRESS
wire addr7C88; //FORMAT 1-8 CHANNELS OUTPUT REGISTER ADDRESS
wire addr7C8A; //FORMAT 9-16 CHANNELS OUTPUT REGISTER ADDRESS
wire addr7C8C; //1-16 CHANNELS BLOCKED OUTPUT REGISTER ADDRESS
wire addr7C8E; //17-32 CHANNELS BLOCKED OUTPUT REGISTER ADDRESS
wire addr7C90; //1-16 CHANNELS BLOCKED OUTPUT REGISTER ADDRESS
wire addr7C94; //COMMAND REGISTER 1 ADDRESS
wire addr7C96; //TYPES OF INTERRUPT REGISTER ADDRESS
wire addr7CA0; //STATUS REGISTER DS ADDRESS
wire addr7CA2; //SELFTEST REGISTER ADDRESS
wire addr7CA4; //STATUSID REGISTER ADDRESS
wire addr7CA6; //COMMAND REGISTER 2 ADDRESS

wire eareset; //EA4163 program reset
wire outchen;//output channels enable
wire inchen;//input channels enable

wire [15:0] DIN; //local VME data input from VME_D
wire [15:0] ADDR;//local VME address 15:1 + LOWORD
wire [5:0] AMOD;//local VME AM bus

wire [15:0] STATUSID; //STATUSID register
wire [15:0] DOUT; //local VME data output to VME_D
//Assign input global signals to local
assign sysclk = I_CLK_32M; 
assign sysres = I_VME_SYSRESET | eareset;
assign wr = I_VME_WR;
assign as = I_VME_AS;
assign ds0 = I_VME_DS0;
assign ds1 = I_VME_DS1;
assign ADDR[15:0] = {I_VME_A[15:1],I_VME_LWORD};
assign AMOD = I_VME_AM;

assign DIN = VME_D;
assign VME_D = (wr & R_REXST & !ds0 & !ds1 & !as & addr7C) ? R_DOUT : 16'hz;

assign STATUSID = 16'hA800; //STATUSID register value

reg R_REXST; //part of BERR signal result

reg [15:0] R_ADDR; //input ADDRESS LATCH
reg [15:0] R_DOUT; //output DATA LATCH
reg [15:0] R_STATUS; //Status register
reg [15:0] R_CMD;
//VME ADDRESS DECODER
vmeds vmeds(
	.ADDR(R_ADDR),
	.addr7C94(addr7C94),
	.addr7CA0(addr7CA0),
	.addr7CA4(addr7CA4),
	.addr7CA6(addr7CA6),
	.addr7C(addr7C)
); 
//VME ADDRESS MULTIPLEXER on output
vmemux vmemux(
	.ADDR(R_ADDR),
	.DATA7CA4(16'hA800),
	.DATA7CA0({R_STATUS[7:0],R_STATUS[15:8]}),
	//.DATA7CA6()
	//.DATA7C94()
	.DOUT(DOUT)
);
///EA4163 CMD DECODER
eacmdds eacmdds(
	.addr7CA6(addr7CA6),
	.addr7C94(addr7C94),
	.cmd(R_CMD),
	.eareset(eareset),
	.outchen(outchen), 
	.inchen(inchen)
);

//VME ADDRESS LATCH
always@(posedge sysres or posedge sysclk)
begin
	if(sysres)
		R_ADDR <= 0;
	else
	begin
		if(!ds0 & !ds1 & !as)
			R_ADDR <= ADDR;
	end
end
///ADDRESS existance LATCH
always@(posedge sysres or posedge sysclk)
begin
	if(sysres)
		R_REXST <= 0;
	else
	begin
		if(!ds0 & !ds1 & !as)
			R_REXST <= addr7C80 | addr7C82 | addr7C84 | addr7C86 
			| addr7C88 | addr7C8A | addr7C8C | addr7C8E | addr7C90 | addr7C94
			| addr7C96 | addr7CA0 | addr7CA2 | addr7CA4 | addr7CA6;
	end
end
///DOUT LATCH
always@(posedge sysres or posedge sysclk)
begin
	if(sysres)
		R_DOUT <= 0;
	else
	begin
		if(R_REXST & wr & !ds0 & !ds1 & !as & addr7C)
			R_DOUT <= DOUT;
	end
end
///CMD LATCH
always@(posedge sysres or posedge sysclk)
begin
	if(sysres)
	begin
		R_CMD <= 0;
	end
	else
	begin
		if((addr7CA6 | addr7C94) & R_REXST & !wr & !ds0 & !ds1 & !as)
			R_CMD <= DIN;
	end
end

always@(posedge sysres or posedge sysclk)
begin
	if(sysres)
	begin
		R_STATUS <= 0;
	end
	else
	begin
		R_STATUS <= 0;//WILL BE NOT NULL SOON.....
	end
end

endmodule 
