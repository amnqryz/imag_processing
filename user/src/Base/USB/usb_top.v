module usb_top #(
    parameter DEPTH = 128
) (
    input        usb_clk_60m,
    input        sys_rst_n,

    //usb
    (* mark_debug = "True" *)input        usb_rxf_n,
    (* mark_debug = "True" *)input        usb_txe_n,
    (* mark_debug = "True" *)output       usb_oe_n,
    (* mark_debug = "True" *)output       usb_rd_n,
    (* mark_debug = "True" *)output       usb_wr_n,

    inout  [7:0] usb_data,
    output       usb_siwu_n
);

// outports wire
(* mark_debug = "True" *)wire       	wr_en;
(* mark_debug = "True" *)wire       	rd_en;
(* mark_debug = "True" *)wire [7:0] 	wr_data;

(* mark_debug = "True" *)wire [7:0] 	rd_data;
(* mark_debug = "True" *)wire           full;
(* mark_debug = "True" *)wire           empty;


usb_rw u_usb_rw(
    .usb_clk_60m 	( usb_clk_60m  ),
    .sys_rst_n   	( sys_rst_n    ),
    
    .usb_rxf_n   	( usb_rxf_n    ),
    .usb_txe_n   	( usb_txe_n    ),
    .usb_oe_n    	( usb_oe_n     ),
    .usb_rd_n    	( usb_rd_n     ),
    .usb_wr_n    	( usb_wr_n     ),
    .usb_data    	( usb_data     ),
    .usb_siwu_n  	( usb_siwu_n   ),
    
    .wr_en       	( wr_en        ),
    .rd_en       	( rd_en        ),
    .wr_data     	( wr_data      ),
    .rd_data     	( rd_data      ),
    .empty       	( empty        ),
    .full        	( full         )
);

syn_fifo #(
    .DATA_WIDTH ( 8        ),
    .DEPTH      ( DEPTH    )
)
u_syn_fifo(
    .sys_clk 	( usb_clk_60m  ),
    .sys_rst 	( sys_rst_n    ),
    .wr_en   	( wr_en        ),
    .wr_data 	( wr_data      ),
    .rd_en   	( rd_en        ),
    .rd_data 	( rd_data      ),
    .full    	( full         ),
    .empty   	( empty        )
);

endmodule
