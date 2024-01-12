module mipi_top (
    input         sys_rst,
    
    input         mipi_clk_p,
    input         mipi_clk_n,

    input  [1:0]  mipi_lane_p,
    input  [1:0]  mipi_lane_n,

    output        mipi_clk,
    (* mark_debug = "TRUE" *)output [15:0] data_out,
    (* mark_debug = "TRUE" *)output        data_valid,
    (* mark_debug = "TRUE" *)output        data_vsync
    
);

(* mark_debug = "TRUE" *)wire invalid;
(* mark_debug = "TRUE" *)wire packet_done;

// outports wire
wire       	clk_bit;
wire       	clk_byte;
(* mark_debug = "TRUE" *)wire [7:0] 	lane0_data;
(* mark_debug = "TRUE" *)wire [7:0] 	lane1_data;

assign mipi_clk = clk_byte;

mipi_phy u_mipi_phy(
	.rst_n       	( sys_rst      ),
	
    .mipi_clk_p  	( mipi_clk_p   ),
	.mipi_clk_n  	( mipi_clk_n   ),
	.mipi_lane_p 	( mipi_lane_p  ),
	.mipi_lane_n 	( mipi_lane_n  ),
	
    .clk_bit     	( clk_bit      ),
	.clk_byte    	( clk_byte     ),
	.lane0_data  	( lane0_data   ),
	.lane1_data  	( lane1_data   )
);

// outports wire

(* mark_debug = "TRUE" *)wire [7:0] 	byte_data_0;
(* mark_debug = "TRUE" *)wire       	byte_valid_0;

byte_align u0_byte_align(
	.sys_clk    	( clk_byte      ),
	.sys_rst    	( sys_rst       ),
	
    .lane_data  	( lane0_data    ),
	.invalid    	( invalid | packet_done),
	
    .byte_data  	( byte_data_0   ),
	.byte_valid 	( byte_valid_0  )
);

// outports wire
(* mark_debug = "TRUE" *)wire [7:0] 	byte_data_1;
(* mark_debug = "TRUE" *)wire       	byte_valid_1;

byte_align u1_byte_align(
	.sys_clk    	( clk_byte      ),
	.sys_rst    	( sys_rst       ),
	
    .lane_data  	( lane1_data    ),
	.invalid    	( invalid | packet_done),
	
    .byte_data  	( byte_data_1   ),
	.byte_valid 	( byte_valid_1  )
);

// outports wire
(* mark_debug = "TRUE" *)wire [15:0] 	word_data;
(* mark_debug = "TRUE" *)wire        	word_valid;

word_align u_word_align(
	.sys_clk      	( clk_byte      ),
	.sys_rst      	( sys_rst       ),
	
    .packet_done  	( packet_done   ),
	
    .byte_data_0  	( byte_data_0   ),
	.byte_data_1  	( byte_data_1   ),
	.byte_valid_0 	( byte_valid_0  ),
	.byte_valid_1 	( byte_valid_1  ),
	
    .word_data    	( word_data     ),
	.word_valid   	( word_valid    ),
	
    .invalid      	( invalid       )
);

packet_handler u_packet_handler(
	.sys_clk     	( clk_byte     ),
	.sys_rst     	( sys_rst      ),
	
    .word_data   	( word_data    ),
	.word_valid  	( word_valid   ),
	
    .data_out    	( data_out     ),
	.data_valid  	( data_valid   ),
	.data_vsync  	( data_vsync   ),
	.packet_done 	( packet_done  )
);

endmodule //mipi_top
