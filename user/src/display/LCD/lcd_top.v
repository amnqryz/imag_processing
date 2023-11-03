module lcd_top (
    input        sys_clk,
    input        sys_rst,
    
    output       lcd_clk,
    output       lcd_hs,
    output       lcd_vs,
    output       lcd_de,
    output       lcd_disp,
    inout [23:0] lcd_rgb
);

wire [23:0] lcd_in;
wire [23:0] lcd_out;

assign lcd_disp = 1'b1;
assign lcd_rgb  = lcd_de ? lcd_out : {24'hz};
assign lcd_in   = lcd_rgb;

// outports wire
wire [15:0] 	lcd_id;

rd_id u_rd_id(
    .sys_clk 	( sys_clk  ),
    .sys_rst 	( sys_rst  ),
    .lcd_rgb 	( lcd_in   ),
    .lcd_id  	( lcd_id   )
);

// outports wire
wire        	pclk;

clk_div u_clk_div(
    .sys_clk 	( sys_clk  ),
    .sys_rst 	( sys_rst  ),
    .lcd_id  	( lcd_id   ),
    .pclk    	( pclk     )
);

// outports wire
wire [10:0] 	pixel_row;
wire [10:0] 	pixel_line;
wire [10:0] 	o_h_disp;
wire [10:0] 	o_v_disp;

wire [23:0] 	pixel_data;

lcd_driver u_lcd_driver(
    .pclk       	( pclk        ),
    .rst_n      	( sys_rst     ),
    
    .lcd_id     	( lcd_id      ),
    .pixel_data 	( pixel_data  ),
    .pixel_row  	( pixel_row   ),
    .pixel_line 	( pixel_line  ),
    .o_h_disp   	( o_h_disp    ),
    .o_v_disp   	( o_v_disp    ),
    
    .lcd_clk    	( lcd_clk     ),
    .lcd_rgb    	( lcd_out     ),
    .lcd_hs     	( lcd_hs      ),
    .lcd_vs     	( lcd_vs      ),
    .lcd_de     	( lcd_de      )
);

lcd_display u_lcd_display(
    .pclk       	( pclk        ),
    .rst_n      	( sys_rst     ),
    
    .lcd_vs         ( lcd_vs      ),
    .pixel_row  	( pixel_row   ),
    .pixel_line 	( pixel_line  ),
    .h_disp     	( o_h_disp    ),
    .v_disp     	( o_v_disp    ),
    .pixel_data 	( pixel_data  )
);

endmodule //lcd_top






































