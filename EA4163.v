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

input	I_VME_AS;
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

wire sysclk;
wire sysres;
wire ds0;
wire ds1;
wire wr;

wire addr7C80;
wire addr7C82;
wire addr7C84;
wire addr7C86;
wire addr7C88;
wire addr7C8A;
wire addr7C8C;
wire addr7C8E;
wire addr7C90;
wire addr7C96;
wire addr7CA0;
wire addr7CA2;
wire addr7CA4;

wire [15:0] DIN;
wire [15:0] ADDR;
wire [5:0] AMOD;

assign sysclk = I_CLK_32M;
assign sysres = I_VME_SYSRESET;
assign wr = I_VME_WR;
assign as = I_VME_AS;
assign ds0 = I_VME_DS0;
assign ds1 = I_VME_DS1;
assign ADDR[15:0] = {I_VME_A[15:1],I_VME_LWORD};
assign AMOD = I_VME_AM;

assign DIN = VME_D;
assign VME_D = wr ? DOUT : 16'hz;

reg [15:0] R_ADDR;
reg [15:0] DOUT;
reg [15:0] R_STATUS; //Status register

vmeds vmeds(.ADDR(R_ADDR),.addr7CA0(addr7CA0),.addr7CA4(addr7CA4)); 

always@(posedge sysres or posedge sysclk)
begin
	if(sysclk)
		R_ADDR <= 0;
	else
	begin
		if(!ds0 & !ds1 & !as)
			R_ADDR <= ADDR;
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
		R_STATUS <= 0;///Aaeaa aoaao caiieiyouny cia?aiyie
	end
end

//Aaoeo?aoi? aa?ana n ioeuoeieaeni?ii ?aaeno?ia eiio?ieea?a ia oeio VME
always@(posedge sysres or posedge sysclk)
begin
	if(sysres)
		DOUT <= 0;
	else
	begin
		case({addr7CA0,addr7CA4}) ///MUX needed !!!
			
			2'b10:
			begin
				DOUT <= {R_STATUS[7:0],R_STATUS[15:8]};
			end
					
			2'b01:
			begin
				DOUT <= 16'hA800;
			end
					
		endcase
	end
end 

endmodule 
