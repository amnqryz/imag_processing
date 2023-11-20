module syn_fifo #(
    parameter DATA_WIDTH = 16,
    parameter DEPTH      = 128
) (
    input                            sys_clk,
    input                            sys_rst,

    input                            wr_en,
    input   [DATA_WIDTH - 1 : 0]     wr_data,

    input                            rd_en,
    output  reg [DATA_WIDTH - 1 : 0] rd_data,

    output                           full,
    output                           empty
    
);

localparam ADDR_WIDTH = $clog2(DEPTH);

reg [DATA_WIDTH - 1 : 0] mem[DEPTH - 1 : 0];

reg [ADDR_WIDTH - 1 : 0] wr_addr,rd_addr;

//wr_addr
always @(posedge sys_clk) begin
    if(sys_rst == 1'b0)
        wr_addr <= {(ADDR_WIDTH){1'b0}};
    else begin
        if(wr_addr == DEPTH - 1'b1)
            wr_addr <= {(ADDR_WIDTH){1'b0}};
        else if(wr_en && (!full))
            wr_addr <= wr_addr + 1'b1;
    end
end

//rd_addr
always @(posedge sys_clk) begin
    if(sys_rst == 1'b0)
        rd_addr <= {(ADDR_WIDTH){1'b0}};
    else begin
        if(rd_addr == DEPTH - 1'b1)
            rd_addr <= {(ADDR_WIDTH){1'b0}};
        else if(rd_en && (!empty))
            rd_addr <= rd_addr + 1'b1;
    end
end

//full and empty
reg [ADDR_WIDTH - 1 : 0] data_cnt;

assign full  = (data_cnt == DEPTH - 1'b1)         ? 1'b1 : 1'b0;
assign empty = (data_cnt == {(ADDR_WIDTH){1'b0}}) ? 1'b1 : 1'b0;

always @(posedge sys_clk) begin
    if(sys_rst == 1'b0)
        data_cnt <= {(ADDR_WIDTH){1'b0}};
    else if(wr_en && rd_en && (!full) && (!empty))begin
        data_cnt <= data_cnt;
    end
    else if(wr_en && (!full))begin
        data_cnt <= data_cnt + 1'b1;
    end
    else if(rd_en && (!empty))begin
        data_cnt <= data_cnt - 1'b1;
    end
end

//write
integer index;

always @(posedge sys_clk) begin
    if(sys_rst == 1'b0)begin
        for(index = 0; index < DEPTH; index = index + 1)begin
            mem[index] <= {(ADDR_WIDTH){1'b0}};
        end
    end
    else if(wr_en && !full)
        mem[wr_addr] <= wr_data;
end

//read
always @(*) begin
    //if(rd_en && !empty)
    rd_data <= mem[rd_addr];
    //else 
        //rd_data <= {(ADDR_WIDTH){1'bz}};
end

endmodule

