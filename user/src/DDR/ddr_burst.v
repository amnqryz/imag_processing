module ddr_burst #(
    parameter ADDR_WIDTH = 28,
    parameter DATA_WIDTH = 128
) (
    input                           ui_clk,
    input                           ui_clk_sync_rst,
    input                           init_calib_complete,

    //USER
    input                           rd_burst_req,
    input  [9:0]                    rd_burst_len,
    input  [ADDR_WIDTH - 1 : 0]     rd_burst_addr,
    output                          rd_burst_data_valid,
    output                          rd_burst_finish,
    output [DATA_WIDTH - 1 : 0]     rd_burst_data,

    input                           wr_burst_req,
    input  [9:0]                    wr_burst_len,
    input  [ADDR_WIDTH - 1 : 0]     wr_burst_addr,
    output                          wr_burst_data_req,
    output                          wr_burst_finish,
    input  [DATA_WIDTH - 1 : 0]     wr_burst_data,

    //DDR MIG_IP
    input                           app_rdy,
    output reg [ADDR_WIDTH - 1 : 0] app_addr,
    output                          app_en,
    output     [2:0]                app_cmd,

    input                           app_wdf_rdy,
    output reg                      app_wdf_wren,
    output                          app_wdf_end,
    output reg [DATA_WIDTH - 1 : 0] app_wdf_data,

    input  [DATA_WIDTH - 1 : 0]     app_rd_data,
    input                           app_rd_data_valid
);

//rst_n
wire rst_n;

assign rst_n = ~ui_clk_sync_rst;

localparam IDLE      = 3'd0;
localparam READ      = 3'd1;
localparam WRITE     = 3'd2;
localparam READ_END  = 3'd3;
localparam WRITE_END = 3'd4;

reg [23:0]               wr_addr_cnt,rd_addr_cnt;
reg [23:0]               wr_data_cnt,rd_data_cnt;

//state
reg [2:0] state_now,state_next;

always @(posedge ui_clk) begin
    if(rst_n == 1'b0)
        state_now <= IDLE;
    else 
        state_now <= state_next;
end

always @(*) begin
    if(rst_n == 1'b0)
        state_next <= IDLE;
    else if(init_calib_complete)begin
        case(state_now)
            IDLE:begin
                if(rd_burst_req)
                    state_next <= READ;
                else if(wr_burst_req)
                    state_next <= WRITE;
                else 
                    state_next <= IDLE;
            end
            READ:begin
                if(rd_data_cnt == rd_burst_len - 1'b1 && app_rd_data_valid)
                    state_next <= READ_END;
                else 
                    state_next <= READ;
            end
            READ_END:begin
                state_next <= IDLE;
            end
            WRITE:begin
                if(wr_addr_cnt == wr_burst_len - 1'b1 && app_rdy && app_wdf_rdy)
                    state_next <= WRITE_END;
                else 
                    state_next <= WRITE;
            end
            WRITE_END:begin
                state_next <= IDLE;
            end
            default:begin
                state_next <= IDLE;
            end
        endcase
    end
    else begin
        state_next <= IDLE;
    end
end

assign wr_burst_data_req   = (state_now == WRITE) && app_rdy && app_wdf_rdy;
assign wr_burst_finish     = (state_now == WRITE_END);

assign rd_burst_data_valid = app_rd_data_valid;
assign rd_burst_data       = app_rd_data;
assign rd_burst_finish     = (state_now == READ_END);

assign app_en       = (state_now == WRITE && app_rdy && app_wdf_rdy) || (state_now == READ && app_rdy);
assign app_cmd      = (state_now == READ) ? 3'd1 : 3'd0;
assign app_wdf_end  = app_wdf_wren;

always @(posedge ui_clk) begin
    if(rst_n == 1'b0)
        app_wdf_wren <= 1'b0;
    else 
        app_wdf_wren <= wr_burst_data_req;
end

always @(posedge ui_clk) begin
    if(rst_n == 1'b0)begin
        app_addr      <= 1'b0;
        rd_addr_cnt   <= 24'd0;
        rd_data_cnt   <= 24'd0;
        wr_addr_cnt   <= 1'b0;
        app_wdf_data  <= 1'b0;
    end
    else if(init_calib_complete)begin
        case(state_now)
            IDLE:begin
                if(rd_burst_req)begin
                    app_addr <= rd_burst_addr;
                end
                else if(wr_burst_req)begin
                    app_addr <= wr_burst_addr;
                end
            end
            READ:begin
                if(app_rdy)begin
                    if(rd_addr_cnt == rd_burst_len - 1'b1)begin
                        rd_addr_cnt <= rd_addr_cnt;
                        app_addr    <= app_addr;
                    end
                    else begin
                        rd_addr_cnt <= rd_addr_cnt + 1'b1;
                        app_addr    <= app_addr    + 8;
                    end
                end

                if(rd_burst_data_valid)begin
                    rd_data_cnt   <= rd_data_cnt + 1'b1;
                end
            end
            READ_END:begin
                app_addr    <= 0;
                rd_addr_cnt <= 24'd0;
                rd_data_cnt <= 24'd0;
            end
            WRITE:begin
                if(app_rdy && app_wdf_rdy)begin
                    wr_addr_cnt <= wr_addr_cnt + 1'b1;
                    app_addr    <= app_addr    + 8;
                end

                if(wr_burst_data_req)begin
                    wr_data_cnt  <= wr_data_cnt + 1'b1;
                    app_wdf_data <= wr_burst_data;
                end
            end
            WRITE_END:begin
                app_addr    <= 0;
                wr_addr_cnt <= 24'd0;
                wr_data_cnt <= 24'd0;
            end
            default:begin
                app_addr      <= 1'b0;
                rd_addr_cnt   <= 24'd0;
                rd_data_cnt   <= 24'd0;
                wr_addr_cnt   <= 1'b0;
                app_wdf_data  <= 1'b0;
            end
        endcase
    end
end

endmodule
