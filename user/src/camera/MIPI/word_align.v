module word_align (
    input             sys_clk,
    input             sys_rst,

    input             packet_done,

    input [7:0]       byte_data_0,
    input [7:0]       byte_data_1,
    input             byte_valid_0,
    input             byte_valid_1,

    output reg [15:0] word_data,
    output reg        word_valid,
    output reg        invalid
    
);

localparam LANE0_FIRST = 2'b01;
localparam LANE1_FIRST = 2'b10;
localparam NONE_FIRST  = 2'b11;

wire      byte_valid_or;
wire      byte_valid_or_pos;

reg       r_byte_valid_or;
reg       r_byte_valid_or_pos;

reg [7:0] r_byte_data_0;
reg [7:0] r_byte_data_1;

reg       r_byte_valid_0;
reg       r_byte_valid_1;

(* mark_debug = "TRUE" *)reg [1:0] tap;

wire      byte_valid_and;

//Buffer
always @(posedge sys_clk) begin
    if(sys_rst == 1'b0)begin
        r_byte_data_0       <= 8'd0;
        r_byte_data_1       <= 8'd0;
        r_byte_valid_0      <= 1'b0;
        r_byte_valid_1      <= 1'b0;
        r_byte_valid_or     <= 1'b0;
        r_byte_valid_or_pos <= 1'b0;
    end
    else begin
        r_byte_data_0       <= byte_data_0;
        r_byte_data_1       <= byte_data_1;
        r_byte_valid_0      <= byte_valid_0;
        r_byte_valid_1      <= byte_valid_1;
        r_byte_valid_or     <= byte_valid_or;
        r_byte_valid_or_pos <= byte_valid_or_pos;
    end
end

assign byte_valid_or     = byte_valid_0 | byte_valid_1;
assign byte_valid_and    = byte_valid_0 & byte_valid_1;
assign byte_valid_or_pos = (~r_byte_valid_or) & byte_valid_or;

//tap
always @(posedge sys_clk) begin
    if(sys_rst == 1'b0)
        tap <= NONE_FIRST;
    else if(byte_valid_or_pos == 1'b1)
        tap <= {byte_valid_1,byte_valid_0};
end

//invalid
always @(posedge sys_clk) begin
    if(sys_rst == 1'b0)
        invalid <= 1'b0;
    else if(r_byte_valid_or_pos == 1'b1 && byte_valid_and == 1'b0)
        invalid <= 1'b1;
    else 
        invalid <= 1'b0;
end

//word_valid
always @(posedge sys_clk) begin
    if(sys_rst == 1'b0)
        word_valid <= 1'b0;
    else if(packet_done == 1'b1)
        word_valid <= 1'b0;
    else if(r_byte_valid_or_pos == 1'b1 && byte_valid_and == 1'b1)
        word_valid <= 1'b1;
end

//word_data
always @(posedge sys_clk) begin
    if(sys_rst == 1'b0)begin
        word_data <= 16'd0;
    end
    else begin
        case(tap)
            LANE0_FIRST:begin
                word_data <= {byte_data_1,r_byte_data_0};
            end
            LANE1_FIRST:begin
                word_data <= {r_byte_data_1,byte_data_0};
            end
            NONE_FIRST:begin
                word_data <= {r_byte_data_1,r_byte_data_0};
            end
            default:begin
                word_data <= {r_byte_data_1,r_byte_data_0};
            end
        endcase
    end
end

endmodule //word_align
