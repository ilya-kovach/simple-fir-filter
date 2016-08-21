module fir_filter_verilog(
	 input wire signed [7:0]in,
	 input wire clock,
    output wire signed [19:0]out
    );
	 
parameter LEN  = 9;	 
parameter coef0  = 10;
parameter coef1  = 30;
parameter coef2  = 49;
parameter coef3  = 69;
parameter coef4  = 74;
parameter coef5  = 69;
parameter coef6  = 49;
parameter coef7  = 30;
parameter coef8  = 10;
reg signed [7:0] dff [0:LEN-1];
reg [17:0] summa11;
reg [17:0] summa12;
reg [17:0] summa13;
reg [17:0] summa14;
reg [17:0] summa15;
reg [18:0] summa21;
reg [18:0] summa22;
reg [18:0] summa23;
reg [19:0] summa31;
reg [19:0] summa32;
reg [20:0] summa41;
reg [16:0] proisvedenie [0:LEN-1];

integer i;

always @(posedge clock) 
begin
	dff[0]<=in;
	for(i=1; i<LEN; i=i+1)
		dff[i]<=dff[i-1];
end

always @(posedge clock) 
begin
	proisvedenie[0]<=coef0*dff[0];
	proisvedenie[1]<=coef1*dff[1];
	proisvedenie[2]<=coef2*dff[2];
	proisvedenie[3]<=coef3*dff[3];
	proisvedenie[4]<=coef4*dff[4];
	proisvedenie[5]<=coef5*dff[5];
	proisvedenie[6]<=coef6*dff[6];
	proisvedenie[7]<=coef7*dff[7];
	proisvedenie[8]<=coef8*dff[8];
end

always @(posedge clock) 
begin
	summa11<= proisvedenie[0]+proisvedenie[1];
	summa12<= proisvedenie[2]+proisvedenie[3];
	summa13<= proisvedenie[4]+proisvedenie[5];
	summa14<= proisvedenie[6]+proisvedenie[7];
	summa15<= proisvedenie[8];
end

always @(posedge clock) 
begin
	summa21<= summa11+summa12;
	summa22<= summa13+summa14;
	summa23<= summa15;
end

always @(posedge clock) 
begin
	summa31<= summa21+summa22;
	summa32<= summa23;
end

always @(posedge clock) 
begin
	summa41<= summa31+summa32;
end

assign out = summa41;
endmodule
