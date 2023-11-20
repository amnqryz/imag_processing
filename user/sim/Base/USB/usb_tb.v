module usb_tb();

parameter DEPTH      = 256;

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
wire       	usb_oe_n;
wire       	usb_rd_n;
wire       	usb_wr_n;
wire [7:0] 	usb_data_out;
wire       	usb_siwu_n;

reg         usb_rxf_n;
reg         usb_txe_n;
reg [7:0]   usb_data_in;

//usb_data_in
always @(posedge sys_clk) begin
    if(sys_rst == 1'b0)
        usb_data_in <= 8'd0;
    else if(usb_rd_n == 1'b0)
        usb_data_in <= usb_data_in + 1'b1;
    else 
        usb_data_in <= 8'd0;
end

//usb_rxf_n
initial begin
    usb_rxf_n = 1'b1;
    #100
    usb_rxf_n = 1'b0;
    #2000
    usb_rxf_n = 1'b1;
end

//usb_txe_n
initial begin
    usb_txe_n = 1'b1;
    #3000
    usb_txe_n = 1'b0;
    #2000
    usb_txe_n = 1'b1;
end

usb_top #(
    .DEPTH          ( DEPTH         )
)
u_usb_top(
    .usb_clk_60m  	( sys_clk       ),
    .sys_rst_n    	( sys_rst       ),
    
    .usb_rxf_n    	( usb_rxf_n     ),
    .usb_txe_n    	( usb_txe_n     ),
    .usb_oe_n     	( usb_oe_n      ),
    .usb_rd_n     	( usb_rd_n      ),
    .usb_wr_n     	( usb_wr_n      ),
    .usb_data_in  	( usb_data_in   ),
    .usb_data_out 	( usb_data_out  ),
    .usb_siwu_n   	( usb_siwu_n    )
);


initial begin            
    $dumpfile("usb.vcd");        
    $dumpvars(0, usb_tb);    
    #50000 $finish;
end

endmodule  //TOP
