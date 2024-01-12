module byte_align (
    input            sys_clk,
    input            sys_rst,

    input  [7:0]     lane_data,
    input            invalid,

    output reg [7:0] byte_data,
    output reg       byte_valid
    
);

localparam SYNC = 8'hB8;

//Buffer
reg [15:0] r_lane_data,d_lane_data;

always @(posedge sys_clk) begin
    if(sys_rst == 1'b0)begin
        r_lane_data <= 16'd0;
        d_lane_data <= 16'd0;
    end
    else 
        r_lane_data <= {lane_data,r_lane_data[15:8]};
        d_lane_data <= r_lane_data;
end

//Align
(* mark_debug = "TRUE" *)reg [7:0] offset;
reg       valid;

always @(posedge sys_clk) begin
    if(sys_rst == 1'b0)begin
        offset <= 8'h00;
        valid  <= 1'b0;
    end
    else if(invalid)begin
        offset <= 8'h00;
        valid  <= 1'b0;
    end
    else begin
        if(r_lane_data[7:0] == SYNC)begin
            offset <= 8'h01;
            valid  <= 1'b1;
        end
        else if(r_lane_data[8:1] == SYNC)begin
            offset <= 8'h02;
            valid  <= 1'b1;
        end
        else if(r_lane_data[9:2] == SYNC)begin
            offset <= 8'h04;
            valid  <= 1'b1;
        end
        else if(r_lane_data[10:3] == SYNC)begin
            offset <= 8'h08;
            valid  <= 1'b1;
        end
        else if(r_lane_data[11:4] == SYNC)begin
            offset <= 8'h10;
            valid  <= 1'b1;
        end
        else if(r_lane_data[12:5] == SYNC)begin
            offset <= 8'h20;
            valid  <= 1'b1;
        end
        else if(r_lane_data[13:6] == SYNC)begin
            offset <= 8'h40;
            valid  <= 1'b1;
        end
        else if(r_lane_data[14:7] == SYNC)begin
            offset <= 8'h80;
            valid  <= 1'b1;
        end
        else begin
            offset <= offset;
            valid  <= 1'b0;
        end
    end
end

always @(posedge sys_clk) begin
    if(sys_rst == 1'b0)begin
        byte_data  <= 8'd0;
        byte_valid <= 1'b0;
    end
    else begin
        byte_valid <= valid;
        case(offset)
            8'h01:   byte_data <= d_lane_data[7:0];
            8'h02:   byte_data <= d_lane_data[8:1];
            8'h04:   byte_data <= d_lane_data[9:2];
            8'h08:   byte_data <= d_lane_data[10:3];
            8'h10:   byte_data <= d_lane_data[11:4];
            8'h20:   byte_data <= d_lane_data[12:5];
            8'h40:   byte_data <= d_lane_data[13:6];
            8'h80:   byte_data <= d_lane_data[14:7];
            default: byte_data <= d_lane_data[7:0];
        endcase
    end
end

endmodule //byte_align
