module burst_test #(
    parameter ADDR_WIDTH = 28,
    parameter DATA_WIDTH = 128
) (
    input                            ui_clk,
    input                            ui_clk_sync_rst,
    input                            init_calib_complete,

    input                            rd_burst_data_valid,
    input                            rd_burst_finish,
    input   [DATA_WIDTH - 1 : 0]     rd_burst_data,
    output  reg                      rd_burst_req,
    output  reg [9:0]                rd_burst_len,
    output  reg [ADDR_WIDTH - 1 : 0] rd_burst_addr,

    input                            wr_burst_data_req,
    input                            wr_burst_finish,
    output  reg [DATA_WIDTH - 1 : 0] wr_burst_data,
    output  reg                      wr_burst_req,
    output  reg [9:0]                wr_burst_len,
    output  reg [ADDR_WIDTH - 1 : 0] wr_burst_addr,

    output  reg                      error
);

//rst_n
wire rst_n;

assign rst_n = ~ui_clk_sync_rst;

localparam IDLE  = 3'd0;
localparam WRITE = 3'd1;
localparam READ  = 3'd2;
localparam FINAL = 3'd3;

reg [2:0] state_now,state_next;

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
                if(wr_burst_finish)
                    state_next <= READ;
                else 
                    state_next <= WRITE;
            end
            READ:begin
                if(rd_burst_finish)
                    state_next <= FINAL;
                else 
                    state_next <= READ;
            end
            FINAL:begin
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

always @(posedge ui_clk) begin
    if(rst_n == 1'b0)begin
        rd_burst_req  <= 1'b0;
        wr_burst_req  <= 1'b0;
        wr_burst_len  <= 10'd128;
        rd_burst_len  <= 10'd128;
        rd_burst_addr <= 0;
        wr_burst_addr <= 0;
    end
    else if(init_calib_complete)begin
        case(state_now)
            IDLE:begin
                wr_burst_req  <= 1'b1;
                wr_burst_len  <= 10'd128;
                wr_burst_addr <= 0;
            end
            WRITE:begin
                if(wr_burst_finish)begin
                    wr_burst_req  <= 1'b0;
                    rd_burst_req  <= 1'b1;
                    rd_burst_len  <= 10'd128;
                    rd_burst_addr <= 0;
                end
            end
            READ:begin
                if(rd_burst_finish)begin
                    rd_burst_req  <= 1'b0;
                end
            end
            FINAL:begin
                rd_burst_req <= 1'b0;
                wr_burst_req <= 1'b0;
                rd_burst_addr <= 0;
                wr_burst_addr <= 0;
            end
            default:;
        endcase
    end
end

reg [23:0] wr_cnt;

always @(posedge ui_clk) begin
    if(rst_n == 1'b0)begin
        wr_cnt        <= 24'd0;
    end
    else if(state_now == WRITE)begin
        if(wr_burst_data_req)begin
            wr_cnt <= wr_cnt + 1'b1;
        end
        else if(wr_burst_finish)begin
            wr_cnt <= 24'd0;
        end
    end
end

always @(*) begin
    if(rst_n == 1'b0)
        wr_burst_data <= 1'b0;
    else 
        wr_burst_data <= wr_cnt;
end

reg [23:0] rd_cnt;

always @(posedge ui_clk) begin
    if(rst_n == 1'b0)begin
        rd_cnt <= 24'd0;
    end
    else if(state_now == READ)begin
        if(rd_burst_data_valid)begin
            rd_cnt <= rd_cnt + 1'b1;
        end
        else if(rd_burst_finish)begin
            rd_cnt <= 24'd0;
        end
    end
    else begin
        rd_cnt <= 24'd0;
    end
end

always @(posedge ui_clk) begin
    if(rst_n == 1'b0)
        error <= 1'b0;
    else 
        error <= (state_now == READ) && rd_burst_data_valid && (rd_burst_data != rd_cnt);
end

endmodule











































