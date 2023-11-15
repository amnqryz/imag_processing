module driver_tb();

parameter MAIN_FRE   = 100; //unit MHz
reg                   sys_clk = 0;
reg                   sys_rst = 0;

always begin
    #(500/MAIN_FRE) sys_clk = ~sys_clk;
end

always begin
    #50 sys_rst = 1;
end

//Instance 
// outports wire
wire [10:0] 	pixel_row;
wire [10:0] 	pixel_line;
wire        	lcd_clk;
wire [23:0] 	lcd_rgb;
wire        	lcd_hs;
wire        	lcd_vs;
wire        	lcd_de;

lcd_driver u_lcd_driver(
	.pclk       	( sys_clk     ),
	.rst_n      	( sys_rst     ),
	
    .lcd_id     	( 16'h4342    ),
	.pixel_data 	( {13'd0,pixel_row}   ),
	.pixel_row  	( pixel_row   ),
	.pixel_line 	( pixel_line  ),
	
    .lcd_clk    	( lcd_clk     ),
	.lcd_rgb    	( lcd_rgb     ),
	.lcd_hs     	( lcd_hs      ),
	.lcd_vs     	( lcd_vs      ),
	.lcd_de     	( lcd_de      )
);

initial begin
	$dumpfile("wave.vcd");
	$dumpvars(0,driver_tb);
	#50000 $finish;
end


endmodule  //TOP
