module vmemux(
input [15:0] ADDR,
input [15:0] DATA7C80,
input [15:0] DATA7C82,
input [15:0] DATA7C84,
input [15:0] DATA7C86,
input [15:0] DATA7C88,
input [15:0] DATA7C8A,
input [15:0] DATA7C8C,
input [15:0] DATA7C8E,
input [15:0] DATA7C90,
input [15:0] DATA7C96,
input [15:0] DATA7CA0,
input [15:0] DATA7CA2,
input [15:0] DATA7CA4,
output reg [15:0] DOUT
); 

always@*
begin
	case(ADDR[7:0]) ///MUX needed !!!
		
		8'h00: DOUT <= 0;
		8'h01: DOUT <= 0;
		8'h02: DOUT <= 0;
		8'h03: DOUT <= 0;
		8'h04: DOUT <= 0;
		8'h05: DOUT <= 0;
		8'h06: DOUT <= 0;
		8'h07: DOUT <= 0;

		8'h08: DOUT <= 0;
		8'h09: DOUT <= 0;
		8'h0A: DOUT <= 0;
		8'h0B: DOUT <= 0;
		8'h0C: DOUT <= 0;
		8'h0D: DOUT <= 0;
		8'h0E: DOUT <= 0;
		8'h0F: DOUT <= 0;
		
		8'h10: DOUT <= 0;
		8'h11: DOUT <= 0;
		8'h12: DOUT <= 0;
		8'h13: DOUT <= 0;
		8'h14: DOUT <= 0;
		8'h15: DOUT <= 0;
		8'h16: DOUT <= 0; 
		8'h17: DOUT <= 0;

		8'h18: DOUT <= 0;
		8'h19: DOUT <= 0;
		8'h1A: DOUT <= 0;
		8'h1B: DOUT <= 0;
		8'h1C: DOUT <= 0;
		8'h1D: DOUT <= 0;
		8'h1E: DOUT <= 0;
		8'h1F: DOUT <= 0;	 

		8'h20: DOUT <= 0;
		8'h21: DOUT <= 0;
		8'h22: DOUT <= 0;
		8'h23: DOUT <= 0;
		8'h24: DOUT <= 0;
		8'h25: DOUT <= 0;
		8'h26: DOUT <= 0;
		8'h27: DOUT <= 0;
		
		8'h28: DOUT <= 0;
		8'h29: DOUT <= 0;
		8'h2A: DOUT <= 0;
		8'h2B: DOUT <= 0;
		8'h2C: DOUT <= 0;
		8'h2D: DOUT <= 0;
		8'h2E: DOUT <= 0;
		8'h2F: DOUT <= 0;
		 
		8'h30: DOUT <= 0;
		8'h31: DOUT <= 0;
		8'h32: DOUT <= 0;
		8'h33: DOUT <= 0;
		8'h34: DOUT <= 0;
		8'h35: DOUT <= 0;
		8'h36: DOUT <= 0;
		8'h37: DOUT <= 0;

		8'h38: DOUT <= 0;
		8'h39: DOUT <= 0;
		8'h3A: DOUT <= 0;
		8'h3B: DOUT <= 0;
		8'h3C: DOUT <= 0;
		8'h3D: DOUT <= 0;
		8'h3E: DOUT <= 0;
		8'h3F: DOUT <= 0;
		
		8'h40: DOUT <= 0;
		8'h41: DOUT <= 0;
		8'h42: DOUT <= 0;
		8'h43: DOUT <= 0;
		8'h44: DOUT <= 0;
		8'h45: DOUT <= 0;
		8'h46: DOUT <= 0;
		8'h47: DOUT <= 0;

		8'h48: DOUT <= 0;
		8'h49: DOUT <= 0;
		8'h4A: DOUT <= 0;
		8'h4B: DOUT <= 0;
		8'h4C: DOUT <= 0;
		8'h4D: DOUT <= 0;
		8'h4E: DOUT <= 0;
		8'h4F: DOUT <= 0;
		
		8'h50: DOUT <= 0;
		8'h51: DOUT <= 0;
		8'h52: DOUT <= 0;
		8'h53: DOUT <= 0;
		8'h54: DOUT <= 0;
		8'h55: DOUT <= 0;
		8'h56: DOUT <= 0;
		8'h57: DOUT <= 0;

		8'h58: DOUT <= 0;
		8'h59: DOUT <= 0;
		8'h5A: DOUT <= 0;
		8'h5B: DOUT <= 0;
		8'h5C: DOUT <= 0;
		8'h5D: DOUT <= 0;
		8'h5E: DOUT <= 0;
		8'h5F: DOUT <= 0;	 

		8'h60: DOUT <= 0;
		8'h61: DOUT <= 0;
		8'h62: DOUT <= 0;
		8'h63: DOUT <= 0;
		8'h64: DOUT <= 0;
		8'h65: DOUT <= 0;
		8'h66: DOUT <= 0;
		8'h67: DOUT <= 0;

		8'h68: DOUT <= 0;
		8'h69: DOUT <= 0;
		8'h6A: DOUT <= 0;
		8'h6B: DOUT <= 0;
		8'h6C: DOUT <= 0;
		8'h6D: DOUT <= 0;
		8'h6E: DOUT <= 0;
		8'h6F: DOUT <= 0;
		
		8'h70: DOUT <= 0;
		8'h71: DOUT <= 0;
		8'h72: DOUT <= 0;
		8'h73: DOUT <= 0;
		8'h74: DOUT <= 0;
		8'h75: DOUT <= 0;
		8'h76: DOUT <= 0;
		8'h77: DOUT <= 0;

		8'h78: DOUT <= 0;
		8'h79: DOUT <= 0;
		8'h7A: DOUT <= 0;
		8'h7B: DOUT <= 0;
		8'h7C: DOUT <= 0;
		8'h7D: DOUT <= 0;
		8'h7E: DOUT <= 0;
		8'h7F: DOUT <= 0;	 

		8'h80: DOUT <= DATA7C80;
		8'h81: DOUT <= 0;
		8'h82: DOUT <= DATA7C82;
		8'h83: DOUT <= 0;
		8'h84: DOUT <= DATA7C84;
		8'h85: DOUT <= 0;
		8'h86: DOUT <= DATA7C86;
		8'h87: DOUT <= 0;

		8'h88: DOUT <= DATA7C88;
		8'h89: DOUT <= 0;
		8'h8A: DOUT <= DATA7C8A;
		8'h8B: DOUT <= 0;
		8'h8C: DOUT <= DATA7C8C;
		8'h8D: DOUT <= 0;
		8'h8E: DOUT <= DATA7C8E;
		8'h8F: DOUT <= 0;
	
		8'h90: DOUT <= DATA7C90;
		8'h91: DOUT <= 0;
		8'h92: DOUT <= 0;
		8'h93: DOUT <= 0;
		8'h94: DOUT <= 0;
		8'h95: DOUT <= 0;
		8'h96: DOUT <= DATA7C96;
		8'h97: DOUT <= 0;

		8'h98: DOUT <= 0;
		8'h99: DOUT <= 0;
		8'h9A: DOUT <= 0;
		8'h9B: DOUT <= 0;
		8'h9C: DOUT <= 0;
		8'h9D: DOUT <= 0;
		8'h9E: DOUT <= 0;
		8'h9F: DOUT <= 0;	 

		8'hA0: DOUT <= DATA7CA0;
		8'hA1: DOUT <= 0;
		8'hA2: DOUT <= DATA7CA2;
		8'hA3: DOUT <= 0;
		8'hA4: DOUT <= DATA7CA4;
		8'hA5: DOUT <= 0;
		8'hA6: DOUT <= 0;
		8'hA7: DOUT <= 0;

		8'hA8: DOUT <= 0;
		8'hA9: DOUT <= 0;
		8'hAA: DOUT <= 0;
		8'hAB: DOUT <= 0;
		8'hAC: DOUT <= 0;
		8'hAD: DOUT <= 0;
		8'hAE: DOUT <= 0;
		8'hAF: DOUT <= 0;
		
		8'hB0: DOUT <= 0;
		8'hB1: DOUT <= 0;
		8'hB2: DOUT <= 0;
		8'hB3: DOUT <= 0;
		8'hB4: DOUT <= 0;
		8'hB5: DOUT <= 0;
		8'hB6: DOUT <= 0;
		8'hB7: DOUT <= 0;

		8'hB8: DOUT <= 0;
		8'hB9: DOUT <= 0;
		8'hBA: DOUT <= 0;
		8'hBB: DOUT <= 0;
		8'hBC: DOUT <= 0;
		8'hBD: DOUT <= 0;
		8'hBE: DOUT <= 0;
		8'hBF: DOUT <= 0;
 
		8'hC0: DOUT <= 0;
		8'hC1: DOUT <= 0;
		8'hC2: DOUT <= 0;
		8'hC3: DOUT <= 0;
		8'hC4: DOUT <= 0;
		8'hC5: DOUT <= 0;
		8'hC6: DOUT <= 0;
		8'hC7: DOUT <= 0;

		8'hC8: DOUT <= 0;
		8'hC9: DOUT <= 0;
		8'hCA: DOUT <= 0;
		8'hCB: DOUT <= 0;
		8'hCC: DOUT <= 0;
		8'hCD: DOUT <= 0;
		8'hCE: DOUT <= 0;
		8'hCF: DOUT <= 0;
		
		8'hD0: DOUT <= 0;
		8'hD1: DOUT <= 0;
		8'hD2: DOUT <= 0;
		8'hD3: DOUT <= 0;
		8'hD4: DOUT <= 0;
		8'hD5: DOUT <= 0;
		8'hD6: DOUT <= 0;
		8'hD7: DOUT <= 0;

		8'hD8: DOUT <= 0;
		8'hD9: DOUT <= 0;
		8'hDA: DOUT <= 0;
		8'hDB: DOUT <= 0;
		8'hDC: DOUT <= 0;
		8'hDD: DOUT <= 0;
		8'hDE: DOUT <= 0;
		8'hDF: DOUT <= 0;	 

		8'hE0: DOUT <= 0;
		8'hE1: DOUT <= 0;
		8'hE2: DOUT <= 0;
		8'hE3: DOUT <= 0;
		8'hE4: DOUT <= 0;
		8'hE5: DOUT <= 0;
		8'hE6: DOUT <= 0;
		8'hE7: DOUT <= 0;

		8'hE8: DOUT <= 0;
		8'hE9: DOUT <= 0;
		8'hEA: DOUT <= 0;
		8'hEB: DOUT <= 0;
		8'hEC: DOUT <= 0;
		8'hED: DOUT <= 0;
		8'hEE: DOUT <= 0;
		8'hEF: DOUT <= 0;
		
		8'hF0: DOUT <= 0;
		8'hF1: DOUT <= 0;
		8'hF2: DOUT <= 0;
		8'hF3: DOUT <= 0;
		8'hF4: DOUT <= 0;
		8'hF5: DOUT <= 0;
		8'hF6: DOUT <= 0;
		8'hF7: DOUT <= 0;

		8'hF8: DOUT <= 0;
		8'hF9: DOUT <= 0;
		8'hFA: DOUT <= 0;
		8'hFB: DOUT <= 0;
		8'hFC: DOUT <= 0;
		8'hFD: DOUT <= 0;
		8'hFE: DOUT <= 0;
		8'hFF: DOUT <= 0;
				
	endcase
end 


endmodule 