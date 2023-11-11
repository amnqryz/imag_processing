module ddr_rw # (
    parameter TEST_LENGTH = 10,
    parameter L_TIME      = 25'd25_000_000
)
(
    input              ui_clk,
    input              ui_clk_sync_rst,
    input              init_calib_complete,

    input              app_rdy,
    output reg [27:0]  app_addr,
    output             app_en,
    output     [2:0]   app_cmd,

    input              app_wdf_rdy,
    output             app_wdf_wren,
    output             app_wdf_end,
    output reg [127:0] app_wdf_data,

    input      [127:0] app_rd_data,
    input              app_rd_data_valid,

    output reg [23:0]  rd_addr_cnt,
    output reg [23:0]  wr_addr_cnt,
    output reg [20:0]  rd_cnt,
    output reg         error_flag,
    output reg         led  
);

localparam IDLE  = 2'd0;
localparam WRITE = 2'd1;
localparam WAIT  = 2'd2;
localparam READ  = 2'd3;

//rst_n
wire rst_n;

assign rst_n = ~ui_clk_sync_rst;

//state
reg [1:0] state_now,state_next;

assign app_en       = ((state_now == WRITE) && (app_rdy && app_wdf_rdy)) || (state_now == READ && app_rdy);

assign app_wdf_wren = (state_now == WRITE) && (app_rdy && app_wdf_rdy);

assign app_wdf_end  = app_wdf_wren;

assign app_cmd      = (state_now == READ) ? 1'b1 : 1'b0;

always @(posedge ui_clk) begin
    if(rst_n == 1'b0)
        state_now <= IDLE;
    else 
        state_now <= state_next;
end

always @(*) begin
    if(rst_n == 1'b0)begin
        state_next <= IDLE;
    end
    else if(init_calib_complete)begin
        case(state_now)
            IDLE:begin
                state_next <= WRITE;
            end
            WRITE:begin
                if(wr_addr_cnt == TEST_LENGTH - 1 && (app_rdy && app_wdf_rdy))begin
                    state_next <= WAIT;
                end
                else begin
                    state_next <= WRITE;
                end
            end
            WAIT:begin
                state_next <= READ;
            end
            READ:begin
                if(rd_addr_cnt == TEST_LENGTH - 1 && app_rdy)begin
                    state_next <= IDLE;
                end
                else begin
                    state_next <= READ;
                end
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

always @(posedge ui_clk) begin
    if(rst_n == 1'b0)begin
        wr_addr_cnt  <= 24'd0;
        rd_addr_cnt  <= 24'd0;
        app_addr     <= 28'd0;
        app_wdf_data <= 128'd0;
    end
    else if(init_calib_complete)begin
        case(state_now)
            IDLE:begin
                wr_addr_cnt  <= 24'd0;
                rd_addr_cnt  <= 24'd0;
                app_addr     <= 28'd0;
                app_wdf_data <= 128'd0;
            end
            WRITE:begin
                if(app_rdy && app_wdf_rdy)begin
                    wr_addr_cnt  <= wr_addr_cnt  + 1'b1;
                    app_addr     <= app_addr     + 28'd8;
                    app_wdf_data <= app_wdf_data + 1'b1;
                end
                else begin
                    wr_addr_cnt  <= wr_addr_cnt;
                    app_addr     <= app_addr;
                    app_wdf_data <= app_wdf_data;
                end
            end
            WAIT:begin
                wr_addr_cnt  <= 24'd0;
                rd_addr_cnt  <= 24'd0;
                app_addr     <= 28'd0;
                app_wdf_data <= 128'd0;
            end
            READ:begin
                if(app_rdy)begin
                    rd_addr_cnt <= rd_addr_cnt + 1'b1;
                    app_addr    <= app_addr    + 28'd8;
                end
                else begin
                    rd_addr_cnt <= rd_addr_cnt;
                    app_addr    <= app_addr;
                end
            end
            default:begin
                wr_addr_cnt  <= 24'd0;
                rd_addr_cnt  <= 24'd0;
                app_addr     <= 28'd0;
                app_wdf_data <= 128'd0;
            end
        endcase
    end
end

//error judge
always @(posedge ui_clk) begin
    if(rst_n == 1'b0)begin
        rd_cnt <= 21'd0;
    end
    else if(app_rd_data_valid)begin
        if(rd_cnt == TEST_LENGTH - 1)
            rd_cnt <= 21'd0;
        else 
            rd_cnt <= rd_cnt + 1'b1;
    end
end

wire error;

assign error = (app_rd_data_valid && (rd_cnt != app_rd_data));

always @(posedge ui_clk) begin
    if(rst_n == 1'b0)begin
        error_flag <= 1'b0;
    end
    else if(error)begin
        error_flag <= 1'b1;
    end
end

reg [24:0] led_cnt;

always @(posedge ui_clk) begin
    if(rst_n == 1'b0 || init_calib_complete == 1'b0)begin
        led_cnt <= 25'd0;
        led     <= 1'b1;
    end
    else if(error_flag)begin
        led     <= 1'b0;
    end
    else begin
        if(led_cnt == L_TIME - 1)begin
            led_cnt <= 25'd0;
            led     <= ~led;
        end
        else begin
            led_cnt <= led_cnt + 1'b1;
            led     <= led;
        end
    end
end

endmodule //ddr_rw




































