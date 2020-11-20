module EA4163(
	I_VME_AS,
	I_VME_DS0,
	I_VME_DS1,
	I_VME_WR,
	I_VME_IACK,
	I_VME_IACK_IN,
	I_VME_LWORD,
	I_CLK_32M,
	I_VME_SYSRESET,
	I_ADAPTER_NO,
	I_M_17_24_IN,
	I_M_9_16_IN,
	I_M_1_8_IN,
	I_VME_A,
	I_VME_AM,
	O_VME_IRQ,
	O_VME_IACK_OUT,  
	O_VME_BERR,
	O_KL_VME,
	O_RD_BUF_EN,
	O_WR_BUF_EN,
	O_LED_DISABLE,
	O_OUTPUTS_EN,
	O_F_17_24_TTL,
	O_F_17_24_KP,
	O_F_17_24_27B,
	O_MUX_1_8_EN,
	O_MUX_9_16_EN,
	O_MUX_17_24_EN,
	O_MUX_A_0,
	O_MUX_A_1,
	O_MUX_A_2,
	O_F_1_8_TTL,
	O_F_1_8_KP,
	O_F_1_8_27B,
	O_F_9_16_TTL,
	O_F_9_16_KP,
	O_F_9_16_27B,
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
input	I_VME_IACK;
input	I_VME_IACK_IN;
input	I_VME_LWORD;
input	I_CLK_32M;
input	I_VME_SYSRESET;
input	I_ADAPTER_NO;
input	I_M_17_24_IN;
input	I_M_9_16_IN;
input	I_M_1_8_IN;
input	[15:1] I_VME_A;
input	[5:0] I_VME_AM;
output	O_VME_IRQ;
output	O_VME_IACK_OUT;
output	O_VME_BERR;
output	O_KL_VME;
output	O_RD_BUF_EN;
output	O_WR_BUF_EN;
output	O_LED_DISABLE;
output	O_OUTPUTS_EN;
output	O_F_17_24_TTL;
output	O_F_17_24_KP;
output	O_F_17_24_27B;
output	O_MUX_1_8_EN;
output	O_MUX_9_16_EN;
output	O_MUX_17_24_EN;
output	O_MUX_A_0;
output	O_MUX_A_1;
output	O_MUX_A_2;
output	O_F_1_8_TTL;
output	O_F_1_8_KP;
output	O_F_1_8_27B;
output	O_F_9_16_TTL;
output	O_F_9_16_KP;
output	O_F_9_16_27B;
output	O_VME_DTACK_D;
output	O_VME_DTACK_EN;
output	[23:16] O_OUT_CCH_3;
output	[7:0] O_OUT_CH_1;
output	[7:0] O_OUT_CH_2;
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
wire addr7C92; //OUTPUT REGISTER 1-16 CHANNELS
wire addr7C94; //COMMAND REGISTER 1 ADDRESS
wire addr7C96; //TYPES OF INTERRUPT REGISTER ADDRESS
wire addr7CA0; //STATUS REGISTER DS ADDRESS
wire addr7CA2; //SELFTEST REGISTER ADDRESS
wire addr7CA4; //STATUSID REGISTER ADDRESS
wire addr7CA6; //COMMAND REGISTER 2 ADDRESS

wire eareset; //EA4163 program reset
wire outchen;//output channels enable
wire inchen;//input channels enable

wire muxa0;
wire muxa1;
wire muxa2;

wire [2:0] FMTCH_1_8;
wire [2:0] FMTCH_9_16;
wire [2:0] FMTCH_17_24;
wire [2:0] FMTCH_25_32;

wire amdrv = I_VME_AM == 6'h29 | I_VME_AM == 6'h2D; //address modificator ok

wire [15:0] DIN; //local VME data input from VME_D
wire [15:0] ADDR;//local VME address 15:1 + LOWORD
wire [5:0] AMOD;//local VME AM bus

wire [15:0] STATUSID; //STATUSID register
wire [15:0] DOUT; //local VME data output to VME_D
//Assign input global signals to local

assign KL_VME = 0; //Not used signal ???
assign OUTPUTS_EN = 0; //Not used signal ???

assign LED_DISABLE = 1; //LED not used

assign O_OUT_CCH_3 = 8'h00; //Only 16 channels used

assign sysclk = I_CLK_32M; 
assign sysres = I_VME_SYSRESET | eareset;
assign wr = I_VME_WR;
assign as = I_VME_AS;
assign ds0 = I_VME_DS0;
assign ds1 = I_VME_DS1;
assign ADDR[15:0] = {I_VME_A[15:1],I_VME_LWORD};
assign AMOD = I_VME_AM;

assign DIN = VME_D;
assign VME_D = (R_REXST & amdrv & wr & !ds0 & !ds1 & !as & addr7C) ? R_DOUT : 16'hz;

assign STATUSID = 16'hA800; //STATUSID register value

assign O_OUT_CH_1[0] = R_BLCKOUT_1_16[0] & R_DATAOUT[0];
assign O_OUT_CH_1[1] = R_BLCKOUT_1_16[1] & R_DATAOUT[1];
assign O_OUT_CH_1[2] = R_BLCKOUT_1_16[2] & R_DATAOUT[2];
assign O_OUT_CH_1[3] = R_BLCKOUT_1_16[3] & R_DATAOUT[3];
assign O_OUT_CH_1[4] = R_BLCKOUT_1_16[4] & R_DATAOUT[4];
assign O_OUT_CH_1[5] = R_BLCKOUT_1_16[5] & R_DATAOUT[5];
assign O_OUT_CH_1[6] = R_BLCKOUT_1_16[6] & R_DATAOUT[6];
assign O_OUT_CH_1[7] = R_BLCKOUT_1_16[7] & R_DATAOUT[7];

assign O_OUT_CH_2[0] = R_BLCKOUT_1_16[8] & R_DATAOUT[8];
assign O_OUT_CH_2[1] = R_BLCKOUT_1_16[9] & R_DATAOUT[9];
assign O_OUT_CH_2[2] = R_BLCKOUT_1_16[10] & R_DATAOUT[10];
assign O_OUT_CH_2[3] = R_BLCKOUT_1_16[11] & R_DATAOUT[11];
assign O_OUT_CH_2[4] = R_BLCKOUT_1_16[12] & R_DATAOUT[12];
assign O_OUT_CH_2[5] = R_BLCKOUT_1_16[13] & R_DATAOUT[13];
assign O_OUT_CH_2[6] = R_BLCKOUT_1_16[14] & R_DATAOUT[14];
assign O_OUT_CH_2[7] = R_BLCKOUT_1_16[15] & R_DATAOUT[15];

assign O_F_1_8_TTL = FMTCH_1_8[0];
assign O_F_1_8_KP = FMTCH_1_8[1];
assign O_F_1_8_27B = FMTCH_1_8[2];
assign O_F_9_16_TTL = FMTCH_9_16[0];
assign O_F_9_16_KP = FMTCH_9_16[1];
assign O_F_9_16_27B = FMTCH_9_16[2];
assign O_F_17_24_TTL = FMTCH_17_24[0];
assign O_F_17_24_KP = FMTCH_17_24[1];
assign O_F_17_24_27B = FMTCH_17_24[2];

reg R_REXST; //part of BERR signal result

reg [15:0] R_ADDR; //input ADDRESS LATCH
reg [15:0] R_DOUT; //output DATA LATCH
reg [15:0] R_STATUS; //Status register
reg [15:0] R_CMD; //Command register

reg [15:0] R_FMTIN_1_8; //format register 1 - 8 channels input
reg [15:0] R_FMTIN_9_16; //format register 9 - 16 channels input
reg [15:0] R_FMTIN_17_24; //format register 17 - 24 channels input
reg [15:0] R_FMTIN_25_32; //format register 25 - 32 channels input

reg [15:0] R_FMTOUT_1_8; //format register 1 - 8 channels output
reg [15:0] R_FMTOUT_9_16; //format register 9 - 16 channels output

reg [15:0] R_INTMSK;//interrupt mask

reg [15:0] R_SLFTST; //Selftest

reg [15:0] R_BLCKOUT_1_16; //blocked 1-16 channels output
reg [15:0] R_BLCKIN_1_16;//blocked 1-16 channels input
reg [15:0] R_BLCKIN_17_32;//blocked 17-32 channels input

reg [15:0] R_DATAOUT;

//VME ADDRESS DECODER
vmeds vmeds(
	.ADDR(R_ADDR),
	.addr7C80(addr7C80),
	.addr7C82(addr7C82),
	.addr7C84(addr7C84),
	.addr7C86(addr7C86),
	.addr7C88(addr7C88),
	.addr7C8A(addr7C8A),
	.addr7C92(addr7C92),
	.addr7C94(addr7C94),
	.addr7C96(addr7C96),
	.addr7CA0(addr7CA0),
	.addr7CA2(addr7CA2),
	.addr7CA4(addr7CA4),
	.addr7CA6(addr7CA6),
	.addr7C(addr7C)
); 

//VME ADDRESS MULTIPLEXER on output
vmemux vmemux(
	.ADDR(R_ADDR),
	.DATA7C80({R_FMTIN_1_8[7:0],R_FMTIN_1_8[15:8]}),
	.DATA7C82({R_FMTIN_9_16[7:0],R_FMTIN_9_16[15:8]}),
	.DATA7C84({R_FMTIN_17_24[7:0],R_FMTIN_17_24[15:8]}),
	.DATA7C86({R_FMTIN_25_32[7:0],R_FMTIN_25_32[15:8]}),
	.DATA7C88({R_FMTOUT_1_8[7:0],R_FMTOUT_1_8[15:8]}),
	.DATA7C8A({R_FMTOUT_9_16[7:0],R_FMTOUT_9_16[15:8]}),
	.DATA7C96({R_INTMSK[7:0],R_INTMSK[15:8]}),
	.DATA7CA4(16'hA800),
	.DATA7CA0({R_STATUS[7:0],R_STATUS[15:8]}),
	.DATA7C90({R_BLCKOUT_1_16[7:0],R_BLCKOUT_1_16[15:8]}),
	.DATA7C8C({R_BLCKIN_1_16[7:0],R_BLCKIN_1_16[15:8]}),
	.DATA7C8E({R_BLCKIN_17_32[7:0],R_BLCKIN_17_32[15:8]}),
	//.DATA7CA6()
	//.DATA7C92()
	//.DATA7C94()
	.DOUT(DOUT)
);
///EA4163 CMD DECODER
eacmdds eacmdds(
	.clk(sysclk),
	.reset(sysres),
	.addr7CA6(addr7CA6),
	.addr7C94(addr7C94),
	.cmd(R_CMD),
	.eareset(eareset),
	.outchen(outchen), 
	.inchen(inchen)
);

eafmtds eafmtdsin_1_8(
	.clk(sysclk),
	.reset(sysres),
	.MUX({muxa2,muxa1,muxa0}),
	.FMT(R_FMTIN_1_8),
	.FMTCH(FMTCH_1_8)
);

eafmtds eafmtdsin_9_16(
	.clk(sysclk),
	.reset(sysres),
	.MUX({muxa2,muxa1,muxa0}),
	.FMT(R_FMTIN_9_16),
	.FMTCH(FMTCH_9_16)
);

eafmtds eafmtdsin_17_24(
	.clk(sysclk),
	.reset(sysres),
	.MUX({muxa2,muxa1,muxa0}),
	.FMT(R_FMTIN_17_24),
	.FMTCH(FMTCH_17_24),
);

eafmtds eafmtdsin_25_32(
	.clk(sysclk),
	.reset(sysres),
	.MUX({muxa2,muxa1,muxa0}),
	.FMT(R_FMTIN_25_32),
	.FMTCH(FMTCH_25_32)
);

//VME ADDRESS LATCH
always@(posedge sysres or posedge sysclk)
begin
	if(sysres)
		R_ADDR <= 0;
	else
	begin
		if(amdrv & !ds0 & !ds1 & !as)
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
		if(amdrv & !ds0 & !ds1 & !as)
			R_REXST <= addr7C80 | addr7C82 | addr7C84 | addr7C86 
			| addr7C88 | addr7C8A | addr7C8C | addr7C8E | addr7C90 
			| addr7C92 | addr7C94 | addr7C96 | addr7CA0 | addr7CA2 
			| addr7CA4 | addr7CA6;
	end
end
///DOUT LATCH
always@(posedge sysres or posedge sysclk)
begin
	if(sysres)
		R_DOUT <= 0;
	else
	begin
		if(R_REXST & wr & amdrv & !ds0 & !ds1 & !as & addr7C)
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
		if((addr7CA6 | addr7C94) & R_REXST & amdrv & !wr & !ds0 & !ds1 & !as)
			R_CMD <= DIN;
	end
end

always@(posedge sysres or posedge sysclk)
begin
	if(sysres)
	begin
		R_INTMSK <= 0;
	end
	else
	begin
		if(addr7C96 & R_REXST & amdrv & !wr & !ds0 & !ds1 & !as)
			R_INTMSK <= DIN; 
	end
end

always@(posedge sysres or posedge sysclk)
begin
	if(sysres)
	begin
		R_SLFTST <= 0;
	end
	else
	begin
		if(addr7CA2 & R_REXST & amdrv & !wr & !ds0 & !ds1 & !as)
			R_SLFTST <= DIN; 
	end
end

always@(posedge sysres or posedge sysclk)
begin
	if(sysres)
	begin
		R_BLCKOUT_1_16 <= 0;
	end
	else
	begin
		if(addr7C90 & R_REXST & amdrv & !wr & !ds0 & !ds1 & !as)
			R_BLCKOUT_1_16 <= DIN; 
	end
end

always@(posedge sysres or posedge sysclk)
begin
	if(sysres)
	begin
		R_BLCKIN_1_16 <= 0;
	end
	else
	begin
		if(addr7C8C & R_REXST & amdrv & !wr & !ds0 & !ds1 & !as)
			R_BLCKIN_1_16 <= DIN; 
	end
end

always@(posedge sysres or posedge sysclk)
begin
	if(sysres)
	begin
		R_BLCKIN_17_32 <= 0;
	end
	else
	begin
		if(addr7C8E & R_REXST & amdrv & !wr & !ds0 & !ds1 & !as)
			R_BLCKIN_17_32 <= DIN; 
	end
end

always@(posedge sysres or posedge sysclk)
begin
	if(sysres)
	begin
		R_DATAOUT <= 0;
	end
	else
	begin
		if(addr7C92 & outchen & R_REXST & amdrv & !wr & !ds0 & !ds1 & !as)
			R_DATAOUT <= DIN; 
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
