module exm (
  input [7:0] xi, 
  output [15:0] y_x 
); 
  
  wire  [15:0] x; 
  assign x = {{8{xi[7]}}, xi}; 
  
  // 1 + x + x2/2! + x3/3! + x4/4! ... 
  // Let us consider only first 4 terms 
  wire [15:0] x2, x3, x4; 
  
  assign x2 = (x * x) >>> 7; 
  assign x3 = (x2 * x) >>> 7; 
  assign x4 = (x3 * x) >>> 7; 
  
  wire [7:0] coff1, coff2, coff3; 
  
  assign coff1 = x2 >>> 1 ; 
  assign coff2 = x3 >>> 3; 
  assign coff3 = x4 >>> 5; 
  
  assign y_x = 8'd128 - x + coff1 - coff2 + coff3; 
  
endmodule 
