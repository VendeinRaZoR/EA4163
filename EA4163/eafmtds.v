module eafmtds(
input clk,
input reset,
input [2:0] MUX, 
input [15:0] FMT,
output reg [2:0] FMTCH
);

reg [2:0] R_FMTCH0;
reg [2:0] R_FMTCH1;
reg [2:0] R_FMTCH2;
reg [2:0] R_FMTCH3;
reg [2:0] R_FMTCH4;
reg [2:0] R_FMTCH5;
reg [2:0] R_FMTCH6;
reg [2:0] R_FMTCH7;

always@*
begin
	case(MUX)
	
		3'b000: FMTCH = R_FMTCH0;
		3'b001: FMTCH = R_FMTCH1;
		3'b010: FMTCH = R_FMTCH2;
		3'b011: FMTCH = R_FMTCH3;
	
		3'b100: FMTCH = R_FMTCH4;
		3'b101: FMTCH = R_FMTCH5;
		3'b110: FMTCH = R_FMTCH6;
		3'b111: FMTCH = R_FMTCH7;
		
	endcase
end

always@(posedge reset or posedge clk)
begin
	if(reset)
		R_FMTCH0 <= 3'b010;
	else
	begin
		case(FMT[1:0])
	
			2'b00: R_FMTCH0 <= 3'b000;
			2'b01: R_FMTCH0 <= 3'b010;
			2'b10: R_FMTCH0 <= 3'b100;
			2'b11: R_FMTCH0 <= 3'b001;
		
		endcase
	end
end

always@(posedge reset or posedge clk)
begin
	if(reset)
		R_FMTCH1 <= 3'b010;
	else
	begin
		case(FMT[3:2])
	
			2'b00: R_FMTCH1 <= 3'b000;
			2'b01: R_FMTCH1 <= 3'b010;
			2'b10: R_FMTCH1 <= 3'b100;
			2'b11: R_FMTCH1 <= 3'b001;
		
		endcase
	end
end

always@(posedge reset or posedge clk)
begin
	if(reset)
		R_FMTCH2 <= 3'b010;
	else
	begin
		case(FMT[5:4])
	
			2'b00: R_FMTCH2 <= 3'b000;
			2'b01: R_FMTCH2 <= 3'b010;
			2'b10: R_FMTCH2 <= 3'b100;
			2'b11: R_FMTCH2 <= 3'b001;
		
		endcase
	end
end

always@(posedge reset or posedge clk)
begin
	if(reset)
		R_FMTCH3 <= 3'b010;
	else
	begin
		case(FMT[7:6])
	
			2'b00: R_FMTCH3 <= 3'b000;
			2'b01: R_FMTCH3 <= 3'b010;
			2'b10: R_FMTCH3 <= 3'b100;
			2'b11: R_FMTCH3 <= 3'b001;
		
		endcase
	end
end

always@(posedge reset or posedge clk)
begin
	if(reset)
		R_FMTCH4 <= 3'b010;
	else
	begin
		case(FMT[9:8])
	
			2'b00: R_FMTCH4 <= 3'b000;
			2'b01: R_FMTCH4 <= 3'b010;
			2'b10: R_FMTCH4 <= 3'b100;
			2'b11: R_FMTCH4 <= 3'b001;
		
		endcase
	end
end

always@(posedge reset or posedge clk)
begin
	if(reset)
		R_FMTCH5 <= 3'b010;
	else
	begin
		case(FMT[11:10])
	
			2'b00: R_FMTCH5 <= 3'b000;
			2'b01: R_FMTCH5 <= 3'b010;
			2'b10: R_FMTCH5 <= 3'b100;
			2'b11: R_FMTCH5 <= 3'b001;
		
		endcase
	end
end

always@(posedge reset or posedge clk)
begin
	if(reset)
		R_FMTCH6 <= 3'b010;
	else
	begin
		case(FMT[13:12])
	
			2'b00: R_FMTCH6 <= 3'b000;
			2'b01: R_FMTCH6 <= 3'b010;
			2'b10: R_FMTCH6 <= 3'b100;
			2'b11: R_FMTCH6 <= 3'b001;
		
		endcase
	end
end

always@(posedge reset or posedge clk)
begin
	if(reset)
		R_FMTCH7 <= 3'b010;
	else
	begin
		case(FMT[15:14])
	
			2'b00: R_FMTCH7 <= 3'b000;
			2'b01: R_FMTCH7 <= 3'b010;
			2'b10: R_FMTCH7 <= 3'b100;
			2'b11: R_FMTCH7 <= 3'b001;
		
		endcase
	end
end

endmodule 