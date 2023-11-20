module syn_fifo_tb();

parameter DATA_WIDTH = 16;
parameter DEPTH      = 128;
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
wire [DATA_WIDTH-1:0] 	rd_data;
wire                  	full;
wire                  	empty;

reg                     wr_en;
reg  [DATA_WIDTH-1:0]   wr_data;
reg                     rd_en;

always @(posedge sys_clk) begin
    if(sys_rst == 1'b0)
        wr_en <= 1'b1;
    else if(full)
        wr_en <= 1'b0;
end

always @(posedge sys_clk) begin
    if(sys_rst == 1'b0)
        wr_data <= 16'd2;
    else if(wr_en)
        wr_data <= wr_data + 1'b1;
end

always @(posedge sys_clk) begin
    if(sys_rst == 1'b0)
        rd_en <= 1'b0;
    else if(full)
        rd_en <= 1'b1;
end

syn_fifo #(
    .DATA_WIDTH (16),
    .DEPTH      (125)
)
u_syn_fifo(
    .sys_clk 	( sys_clk  ),
    .sys_rst 	( sys_rst  ),
    .wr_en   	( wr_en    ),
    .wr_data 	( wr_data  ),
    .rd_en   	( rd_en    ),
    .rd_data 	( rd_data  ),
    .full    	( full     ),
    .empty   	( empty    )
);

initial begin            
    $dumpfile("wave.vcd");        
    $dumpvars(0, syn_fifo_tb);    
    #50000 $finish;
end

endmodule  //TOP
