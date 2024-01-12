module packet_handler (
    input         sys_clk,
    input         sys_rst,

    input  [15:0] word_data,
    input         word_valid,

    output [15:0] data_out,
    output        data_valid,
    output        data_vsync,
    output        packet_done
    
);

localparam FS   = 8'h00;
localparam DI   = 8'h22;

localparam IDLE  = 3'd0;
localparam LONG  = 3'd1;
localparam SHORT = 3'd2;
localparam DONE  = 3'd3;
localparam STOP  = 3'd4;

//head
reg        head_valid;
reg [1:0]  head_cnt;
reg [31:0] packet_data;

always @(posedge sys_clk) begin
    if(sys_rst == 1'b0)begin
        head_valid             <= 1'b0;
        head_cnt               <= 2'd0;
        packet_data            <= 32'd0;
    end
    else if(word_valid == 1'b0)begin
        head_valid             <= 1'b0;
        head_cnt               <= 2'd0;
        packet_data[15:0]      <= word_data;
    end
    else begin
        if(head_cnt == 2'd0)begin
            head_cnt           <= 2'd1;
            head_valid         <= 1'b0;
            packet_data[15:0]  <= word_data;
        end
        else if(head_cnt == 2'd1)begin
            head_cnt           <= 2'd0;
            head_valid         <= 1'b1;
            packet_data[31:16] <= word_data;
        end
    end
end

//data_type
wire [7:0] data_type;

assign data_type = {2'b00,packet_data[5:0]};

//packet_len
wire [15:0] packet_len;

assign packet_len = packet_data[23:8];

//ECC
wire [7:0]  	ECC;

header_ecc u_header_ecc(
	.DIN 	( packet_data[23:0]  ),
	.ECC 	( ECC                )
);

//packet_valid
function  is_allowed_type;
      input [7:0]   packet_type;
      input         _packet_type;
      reg           result;
      reg [7:0]     packet_type_temp;
      integer       _packet_type;
   begin
      packet_type_temp = packet_type;
      case (packet_type_temp)
         8'h00, 8'h01, 8'h02, 8'h03 :  //sync
            result = 1'b1;
         8'h10, 8'h11, 8'h12 :         //non image
            result = 1'b1;
         8'h28, 8'h29, 8'h2A, 8'h2B, 8'h2C, 8'h2D : //RAW
            result = 1'b1;
         default :
            result = 1'b0;
      endcase
      is_allowed_type = result;
   end
   endfunction

wire packet_valid;

assign packet_valid = (packet_data[31:24] == ECC && is_allowed_type(data_type,8) == 1'b1 && packet_data[7:6] == 2'b00 && head_valid == 1'b1) ? 1'b1 : 1'b0;

//long_flag
wire long_flag;

assign long_flag = ((data_type > 8'h0F) & (packet_valid == 1'b1)) ? 1'b1 : 1'b0;

//state
reg [2:0]  state_now,state_next;

reg [15:0] word_cnt;
reg [15:0] r_packet_len;

always @(posedge sys_clk) begin
    if(sys_rst == 1'b0)
        state_now <= IDLE;
    else 
        state_now <= state_next;
end

always @(*) begin
    if(sys_rst == 1'b0)begin
        state_next <= IDLE;
    end
    else begin
        case(state_now)
            IDLE:begin
                if(head_valid)begin
                    if(long_flag)
                        state_next <= LONG;
                    else    
                        state_next <= SHORT;
                end
                else begin
                    state_next <= IDLE;
                end
            end
            LONG:begin
                if(word_cnt < r_packet_len - 2 && word_cnt < 16'd8191)
                    state_next <= LONG;
                else 
                    state_next <= DONE;
            end
            SHORT:begin
                    state_next <= DONE;
            end 
            DONE:begin
                state_next <= STOP;
            end
            STOP:begin
                state_next <= IDLE;
            end
            default:begin
                state_next <= IDLE;
            end
        endcase
    end
end

always @(posedge sys_clk) begin
    if(sys_rst == 1'b0)begin
        word_cnt     <= 16'd0;
        r_packet_len <= 16'd0;
    end
    else begin
        case(state_now)
            IDLE:begin
                word_cnt <= 16'd0;
                if(head_valid)
                    r_packet_len <= packet_len;
            end
            LONG:begin
                if(word_cnt < r_packet_len - 2 && word_cnt < 16'd8191)
                    word_cnt <= word_cnt + 16'd2;
            end
            default:begin
                word_cnt     <= word_cnt;
                r_packet_len <= r_packet_len;
            end
        endcase
    end
end

//data_vsync
assign data_vsync = (head_valid == 1'b1 && state_now == IDLE && data_type == FS) ? 1'b1 : 1'b0;

//data_valid
assign data_valid = (head_valid == 1'b1 && state_now == LONG) ? 1'b1 : 1'b0;

//data_out
assign data_out = (head_valid == 1'b1 && state_now == LONG) ? packet_data : 32'd0;

//packet_done
assign packet_done = (state_now == DONE) ? 1'b1 : 1'b0;

endmodule //packet_handler
