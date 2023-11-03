module top_tb();

parameter MAIN_FRE   = 100; //unit MHz
reg                   sys_clk = 0;
reg                   sys_rst = 0;

always begin
    #(500/MAIN_FRE) sys_clk = ~sys_clk;
end

always begin
    #50 sys_rst = 1;
end

// outports wire
wire [10:0] 	pixel_row;
wire [10:0] 	pixel_line;
wire [10:0] 	o_h_disp;
wire [10:0] 	o_v_disp;
wire        	lcd_clk;
wire [23:0] 	lcd_rgb;
wire        	lcd_hs;
wire        	lcd_vs;
wire        	lcd_de;

wire [23:0]     pixel_data;

lcd_driver u_lcd_driver(
	.pclk       	( sys_clk     ),
	.rst_n      	( sys_rst     ),
	
	.lcd_id     	( 16'h4342    ),
	.pixel_data 	( pixel_data  ),
	.pixel_row  	( pixel_row   ),
	.pixel_line 	( pixel_line  ),
	.o_h_disp   	( o_h_disp    ),
	.o_v_disp   	( o_v_disp    ),
	
	.lcd_clk    	( lcd_clk     ),
	.lcd_rgb    	( lcd_rgb     ),
	.lcd_hs     	( lcd_hs      ),
	.lcd_vs     	( lcd_vs      ),
	.lcd_de     	( lcd_de      )
);

lcd_display u_lcd_display(
	.pclk       	( sys_clk     ),
	.rst_n      	( sys_rst     ),
	
	.pixel_row  	( pixel_row   ),
	.pixel_line 	( pixel_line  ),
	.h_disp     	( o_h_disp    ),
	.v_disp     	( o_v_disp    ),
	
	.pixel_data 	( pixel_data  )
);

endmodule  //TOP
