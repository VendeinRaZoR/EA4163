module vmeds(
input [15:0] ADDR,
output reg addr7C80,
output reg addr7C82,
output reg addr7C84,
output reg addr7C86,
output reg addr7C88,
output reg addr7C8A,
output reg addr7C8C,
output reg addr7C8E,
output reg addr7C90,
output reg addr7C96,
output reg addr7CA0,
output reg addr7CA2,
output reg addr7CA4
);

always@*
begin
	case(ADDR)
	
		16'h7C80:
		begin
			addr7C80 = 1;
			addr7C82 = 0;
			addr7C84 = 0;
			addr7C86 = 0;
			addr7C88 = 0;
			addr7C8A = 0;
			addr7C8C = 0;
			addr7C8E = 0;
			addr7C90 = 0;
			addr7C96 = 0;
			addr7CA0 = 0;
			addr7CA2 = 0;
			addr7CA4 = 0;
		end
		
		16'h7C82:
		begin
			addr7C80 = 0;
			addr7C82 = 1;
			addr7C84 = 0;
			addr7C86 = 0;
			addr7C88 = 0;
			addr7C8A = 0;
			addr7C8C = 0;
			addr7C8E = 0;
			addr7C90 = 0;
			addr7C96 = 0;
			addr7CA0 = 0;
			addr7CA2 = 0;
			addr7CA4 = 0;	
		end
				
		16'h7C84:
		begin
			addr7C80 = 0;
			addr7C82 = 0;
			addr7C84 = 1;
			addr7C86 = 0;
			addr7C88 = 0;
			addr7C8A = 0;
			addr7C8C = 0;
			addr7C8E = 0;
			addr7C90 = 0;
			addr7C96 = 0;
			addr7CA0 = 0;
			addr7CA2 = 0;
			addr7CA4 = 0;
		end
				
		16'h7C86:
		begin
			addr7C80 = 0;
			addr7C82 = 0;
			addr7C84 = 0;
			addr7C86 = 1;
			addr7C88 = 0;
			addr7C8A = 0;
			addr7C8C = 0;
			addr7C8E = 0;
			addr7C90 = 0;
			addr7C96 = 0;
			addr7CA0 = 0;
			addr7CA2 = 0;
			addr7CA4 = 0;
		end
				
		16'h7C88:
		begin
			addr7C80 = 0;
			addr7C82 = 0;
			addr7C84 = 0;
			addr7C86 = 0;
			addr7C88 = 1;
			addr7C8A = 0;
			addr7C8C = 0;
			addr7C8E = 0;
			addr7C90 = 0;
			addr7C96 = 0;
			addr7CA0 = 0;
			addr7CA2 = 0;
			addr7CA4 = 0;
		end
				
		16'h7C8A:
		begin
			addr7C80 = 0;
			addr7C82 = 0;
			addr7C84 = 0;
			addr7C86 = 0;
			addr7C88 = 0;
			addr7C8A = 1;
			addr7C8C = 0;
			addr7C8E = 0;
			addr7C90 = 0;
			addr7C96 = 0;
			addr7CA0 = 0;
			addr7CA2 = 0;
			addr7CA4 = 0;
		end
				
		16'h7C8C:
		begin
			addr7C80 = 0;
			addr7C82 = 0;
			addr7C84 = 0;
			addr7C86 = 0;
			addr7C88 = 0;
			addr7C8A = 0;
			addr7C8C = 1;
			addr7C8E = 0;
			addr7C90 = 0;
			addr7C96 = 0;
			addr7CA0 = 0;
			addr7CA2 = 0;
			addr7CA4 = 0;
		end
				
		16'h7C8E:
		begin
			addr7C80 = 0;
			addr7C82 = 0;
			addr7C84 = 0;
			addr7C86 = 0;
			addr7C88 = 0;
			addr7C8A = 0;
			addr7C8C = 0;
			addr7C8E = 1;
			addr7C90 = 0;
			addr7C96 = 0;
			addr7CA0 = 0;
			addr7CA2 = 0;
			addr7CA4 = 0;
		end
				
		16'h7C90:		
		begin
			addr7C80 = 0;
			addr7C82 = 0;
			addr7C84 = 0;
			addr7C86 = 0;
			addr7C88 = 0;
			addr7C8A = 0;
			addr7C8C = 0;
			addr7C8E = 0;
			addr7C90 = 1;
			addr7C96 = 0;
			addr7CA0 = 0;
			addr7CA2 = 0;
			addr7CA4 = 0;
		end
				
		16'h7C96:
		begin
			addr7C80 = 0;
			addr7C82 = 0;
			addr7C84 = 0;
			addr7C86 = 0;
			addr7C88 = 0;
			addr7C8A = 0;
			addr7C8C = 0;
			addr7C8E = 0;
			addr7C90 = 0;
			addr7C96 = 1;
			addr7CA0 = 0;
			addr7CA2 = 0;
			addr7CA4 = 0;
		end
		
		16'h7CA0:
		begin
			addr7C80 = 0;
			addr7C82 = 0;
			addr7C84 = 0;
			addr7C86 = 0;
			addr7C88 = 0;
			addr7C8A = 0;
			addr7C8C = 0;
			addr7C8E = 0;
			addr7C90 = 0;
			addr7C96 = 0;
			addr7CA0 = 1;
			addr7CA2 = 0;
			addr7CA4 = 0;
		end
				
		16'h7CA2:
		begin
			addr7C80 = 0;
			addr7C82 = 0;
			addr7C84 = 0;
			addr7C86 = 0;
			addr7C88 = 0;
			addr7C8A = 0;
			addr7C8C = 0;
			addr7C8E = 0;
			addr7C90 = 0;
			addr7C96 = 0;
			addr7CA0 = 0;
			addr7CA2 = 1;
			addr7CA4 = 0;
		end
				
		16'h7CA4:
		begin
			addr7C80 = 0;
			addr7C82 = 0;
			addr7C84 = 0;
			addr7C86 = 0;
			addr7C88 = 0;
			addr7C8A = 0;
			addr7C8C = 0;
			addr7C8E = 0;
			addr7C90 = 0;
			addr7C96 = 0;
			addr7CA0 = 0;
			addr7CA2 = 0;
			addr7CA4 = 1;
		end
		
		default:
		begin
			addr7C80 = 0;
			addr7C82 = 0;
			addr7C84 = 0;
			addr7C86 = 0;
			addr7C88 = 0;
			addr7C8A = 0;
			addr7C8C = 0;
			addr7C8E = 0;
			addr7C90 = 0;
			addr7C96 = 0;
			addr7CA0 = 0;
			addr7CA2 = 0;
			addr7CA4 = 0;
		end
				
	endcase
end

endmodule 