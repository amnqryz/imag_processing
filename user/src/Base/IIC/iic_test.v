module iic_test #(
    parameter DEVICE_ADDR = 7'b1010000,
    parameter CLK_FREQ    = 26'd50_000_000,
    parameter I2C_FREQ    = 19'd250_000
) (
    input   sys_clk,
    input   sys_rst,
    
    input   iic_rw_ctrl,

    (* mark_debug = "True" *)output  scl,
    inout   sda,

    output  led
);

(* mark_debug = "True" *)wire [7:0]  	iic_data_out;
(* mark_debug = "True" *)wire        	iic_ack;
(* mark_debug = "True" *)wire        	iic_done;

reg             bit_ctrl;
reg             iic_exe;
reg [15:0]      iic_addr;
reg [7:0]       iic_data_in;

iic_driver u_iic_driver(
    .sys_clk      	( sys_clk       ),
    .sys_rst      	( sys_rst       ),
    
    .bit_ctrl     	( 1'b1          ),
    .iic_exe      	( 1'b1          ),
    .iic_rw_ctrl  	( ~iic_rw_ctrl   ),
    .iic_addr     	( 16'd1         ),
    .iic_data_in  	( 8'd23         ),
    .iic_data_out 	( iic_data_out  ),
    .iic_ack      	( iic_ack       ),
    .iic_done     	( iic_done      ),
    .scl          	( scl           ),
    .sda          	( sda           )
);

assign led = (iic_data_out == 8'd23) ? 1'b0 : 1'b1;

endmodule





























