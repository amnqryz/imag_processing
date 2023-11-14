module testbench();

parameter ADDR_WIDTH = 28;
parameter DATA_WIDTH = 128;

parameter MAIN_FRE   = 100; //unit MHz
reg                   sys_clk = 0;
reg                   sys_rst = 0;

always begin
    #(500/MAIN_FRE) sys_clk = ~sys_clk;
end

always begin
    #50 sys_rst = 1;
end

wire  [13:0] ddr3_addr;
wire  [2:0]  ddr3_ba;
wire         ddr3_cas_n;
wire  [0:0]  ddr3_ck_n;
wire  [0:0]  ddr3_ck_p;
wire  [0:0]  ddr3_cke;
wire         ddr3_ras_n;
wire         ddr3_reset_n;
wire         ddr3_we_n;
wire  [15:0] ddr3_dq;
wire  [1:0]  ddr3_dqs_n;
wire  [1:0]  ddr3_dqs_p;
wire  [0:0]  ddr3_cs_n;
wire  [1:0]  ddr3_dm;
wire  [0:0]  ddr3_odt;

wire		 init_calib_complete;

wire                  	rd_burst_data_valid;
wire                  	rd_burst_finish;
wire [DATA_WIDTH-1:0] 	rd_burst_data;
wire                  	wr_burst_data_req;
wire                  	wr_burst_finish;

wire [ADDR_WIDTH-1:0] 	app_addr;
wire                  	app_en;
wire [2:0]            	app_cmd;
wire                  	app_wdf_wren;
wire                  	app_wdf_end;
wire [DATA_WIDTH-1:0] 	app_wdf_data;


mig_7series_0 u_mig_7series_0 (

    // Memory interface ports


    .ddr3_addr                      (ddr3_addr),  // output [13:0]		ddr3_addr


    .ddr3_ba                        (ddr3_ba),  // output [2:0]		ddr3_ba


    .ddr3_cas_n                     (ddr3_cas_n),  // output			ddr3_cas_n


    .ddr3_ck_n                      (ddr3_ck_n),  // output [0:0]		ddr3_ck_n


    .ddr3_ck_p                      (ddr3_ck_p),  // output [0:0]		ddr3_ck_p


    .ddr3_cke                       (ddr3_cke),  // output [0:0]		ddr3_cke


    .ddr3_ras_n                     (ddr3_ras_n),  // output			ddr3_ras_n


    .ddr3_reset_n                   (ddr3_reset_n),  // output			ddr3_reset_n


    .ddr3_we_n                      (ddr3_we_n),  // output			ddr3_we_n


    .ddr3_dq                        (ddr3_dq),  // inout [15:0]		ddr3_dq


    .ddr3_dqs_n                     (ddr3_dqs_n),  // inout [1:0]		ddr3_dqs_n


    .ddr3_dqs_p                     (ddr3_dqs_p),  // inout [1:0]		ddr3_dqs_p


    .init_calib_complete            (init_calib_complete),  // output			init_calib_complete


	.ddr3_cs_n                      (ddr3_cs_n),  // output [0:0]		ddr3_cs_n


    .ddr3_dm                        (ddr3_dm),  // output [1:0]		ddr3_dm


    .ddr3_odt                       (ddr3_odt),  // output [0:0]		ddr3_odt


    // Application interface ports


    .app_addr                       (app_addr),  // input [27:0]		app_addr


    .app_cmd                        (app_cmd),  // input [2:0]		app_cmd


    .app_en                         (app_en),  // input				app_en


    .app_wdf_data                   (app_wdf_data),  // input [127:0]		app_wdf_data


    .app_wdf_end                    (app_wdf_end),  // input				app_wdf_end


    .app_wdf_wren                   (app_wdf_wren),  // input				app_wdf_wren


    .app_rd_data                    (app_rd_data),  // output [127:0]		app_rd_data


    .app_rd_data_end                (app_rd_data_end),  // output			app_rd_data_end


    .app_rd_data_valid              (app_rd_data_valid),  // output			app_rd_data_valid


    .app_rdy                        (app_rdy),  // output			app_rdy


    .app_wdf_rdy                    (app_wdf_rdy),  // output			app_wdf_rdy


    .app_sr_req                     (),  // input			app_sr_req


    .app_ref_req                    (),  // input			app_ref_req


    .app_zq_req                     (),  // input			app_zq_req


    .app_sr_active                  (app_sr_active),  // output			app_sr_active


    .app_ref_ack                    (app_ref_ack),  // output			app_ref_ack


    .app_zq_ack                     (app_zq_ack),  // output			app_zq_ack


    .ui_clk                         (ui_clk),  // output			ui_clk


    .ui_clk_sync_rst                (ui_clk_sync_rst),  // output			ui_clk_sync_rst


    .app_wdf_mask                   (31'b0),  // input [15:0]		app_wdf_mask


    // System Clock Ports


    .sys_clk_i                       (sys_clk_i),


    // Reference Clock Ports


    .clk_ref_i                      (clk_ref_i),


    .sys_rst                        (sys_rst) // input sys_rst


    );

reg 					 rd_burst_req;
reg [9:0] 			     rd_burst_len;
reg [ADDR_WIDTH - 1 : 0] rd_burst_addr;

reg						 wr_burst_req;
reg [9:0]				 wr_burst_len;
reg [ADDR_WIDTH - 1 : 0] wr_burst_addr;



ddr_burst u_ddr_burst(
	.ui_clk              	( ui_clk               ),
	.ui_clk_sync_rst     	( ui_clk_sync_rst      ),
	.init_calib_complete 	( init_calib_complete  ),
	
	.rd_burst_req        	( rd_burst_req         ),
	.rd_burst_len        	( rd_burst_len         ),
	.rd_burst_addr       	( rd_burst_addr        ),
	.rd_burst_data_valid 	( rd_burst_data_valid  ),
	.rd_burst_finish     	( rd_burst_finish      ),
	.rd_burst_data       	( rd_burst_data        ),
	
	.wr_burst_req        	( wr_burst_req         ),
	.wr_burst_len        	( wr_burst_len         ),
	.wr_burst_addr       	( wr_burst_addr        ),
	.wr_burst_data_req   	( wr_burst_data_req    ),
	.wr_burst_finish     	( wr_burst_finish      ),
	.wr_burst_data       	( wr_burst_data        ),
	
	.app_rdy             	( app_rdy              ),
	.app_addr            	( app_addr             ),
	.app_en              	( app_en               ),
	.app_cmd             	( app_cmd              ),
	.app_wdf_rdy         	( app_wdf_rdy          ),
	.app_wdf_wren        	( app_wdf_wren         ),
	.app_wdf_end         	( app_wdf_end          ),
	.app_wdf_data        	( app_wdf_data         ),
	.app_rd_data         	( app_rd_data          ),
	.app_rd_data_valid   	( app_rd_data_valid    )
);














initial begin            
    $dumpfile("wave.vcd");        
    $dumpvars(0, testbench);    
    #50000 $finish;
end

endmodule  //TOP
