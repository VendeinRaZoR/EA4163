module eacmdds(
input clk,
input reset,
input addr7CA6, 
input addr7C94,
input [15:0] cmd,
output eareset,
output outchen,
output inchen
);

assign eareset = (addr7CA6 & cmd == 16'h0001);
assign outchen = R_OUTCHEN;
assign inchen = R_INCHEN;

reg R_OUTCHEN;
reg R_INCHEN;

always@(posedge reset or posedge clk)
begin
	if(reset)
		R_OUTCHEN <= 0;
	else
	begin
		if(addr7C94 & cmd == 16'h0001 | addr7C94 & cmd == 16'h0010)
		begin
			if(cmd[0])
				R_OUTCHEN <= 1;
			else
				R_OUTCHEN <= 0;
		end
	end
end

always@(posedge reset or posedge clk)
begin
	if(reset)
		R_INCHEN <= 0;
	else
	begin
		if(addr7C94 & cmd == 16'h0002 | addr7C94 & cmd == 16'h0020)
		begin
			if(cmd[1])
				R_INCHEN <= 1;
			else
				R_INCHEN <= 0;
		end
	end
end

endmodule 