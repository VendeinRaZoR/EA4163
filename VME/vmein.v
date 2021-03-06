module vmein(
input sysres,
input sysclk,
input ds0,
input ds1,
input as,
input ADDR,
output [15:0] ADDR
);

assign ADDR = R_ADDR;

reg R_ADDR;

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

endmodule 