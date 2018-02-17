 module func();
reg [7:0] data;
reg  parity;
integer i;

function abc;
input [31:0] data;
integer i;
begin
  abc = 0;
  for (i= 0; i < 32; i = i + 1) begin
         abc = abc^data[i];   //EXOR
  end
end
endfunction

initial begin    
  parity = 0;
  data = 0;
  for (i=145; i<160; i = i + 1) begin
   #5 data = i; // FOR different data values
   parity = abc(data);
   $display ("DATA = %b, Parity-bit = %b", data, parity);
  end
  #25 $finish;
end

endmodule
