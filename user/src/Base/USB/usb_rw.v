module usb_rw (
    input        usb_clk_60m,
    input        sys_rst_n,

    input        usb_rxf_n,
    input        usb_txe_n,
    output       usb_oe_n,
    output       usb_rd_n,
    output       usb_wr_n,

    inout  [7:0] usb_data,
    output       usb_siwu_n,
    
    //fifo
    output       wr_en,
    output       rd_en,
    output [7:0] wr_data,
    input  [7:0] rd_data,
    input        empty,
    input        full
);

//usb_siwu_n
assign usb_siwu_n = 1'b1;

//usb_oe_n
reg r_usb_rxf_n;
reg r_usb_oe_n;

always @(posedge usb_clk_60m) begin
    if(sys_rst_n == 1'b0)
        r_usb_rxf_n <= 1'b0;
    else 
        r_usb_rxf_n <= usb_rxf_n;
end

always @(posedge usb_clk_60m) begin
    if(sys_rst_n == 1'b0)
        r_usb_oe_n <= 1'b0;
    else 
        r_usb_oe_n <= usb_oe_n;
end

assign usb_oe_n = (usb_rxf_n == 1'b0) && (r_usb_rxf_n == 1'b0) ? 1'b0 : 1'b1;
assign usb_rd_n = (usb_oe_n  == 1'b0) && (r_usb_oe_n  == 1'b0) ? 1'b0 : 1'b1;

assign usb_wr_n = (state_now == WRITE) && (usb_txe_n == 1'b0) && (empty == 1'b0) ? 1'b0 : 1'b1;

//state
localparam IDLE  = 2'd0;
localparam READ  = 2'd1;
localparam WRITE = 2'd2;

reg [1:0] state_now,state_next;

always @(posedge usb_clk_60m) begin
    if(sys_rst_n == 1'b0)
        state_now <= IDLE;
    else 
        state_now <= state_next;
end

always @(*) begin
    if(sys_rst_n == 1'b0)
        state_next <= IDLE;
    else begin
        case(state_now)
            IDLE:begin
                if(usb_rxf_n == 1'b0)
                    state_next <= READ;
                else if(usb_txe_n == 1'b0)
                    state_next <= WRITE;
                else 
                    state_next <= IDLE;
            end
            READ:begin
                if(usb_rxf_n)
                    state_next <= IDLE;
                else 
                    state_next <= READ;
            end
            WRITE:begin
                if(usb_txe_n || empty)
                    state_next <= IDLE;
                else 
                    state_next <= WRITE;
            end
            default:begin
                state_next <= IDLE;
            end
        endcase
    end
end

//fifo write --- usb read
assign wr_en    = (usb_rd_n == 1'b0)    ? 1'b1         : 1'b0;
assign wr_data  = (state_now == READ)   ? usb_data     : 8'hzz;

//fifo_read --- usb_write
assign rd_en    = (usb_wr_n  == 1'b0)  ? 1'b1     : 1'b0;
assign usb_data = (state_now == WRITE) ? rd_data  : 8'hzz;

endmodule //usb_rw

































