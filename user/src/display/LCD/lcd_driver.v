module lcd_driver (
    input          pclk,
    input          rst_n,
    
    input  [15:0]  lcd_id,
    input  [23:0]  pixel_data,
    output [10:0]  pixel_row,
    output [10:0]  pixel_line,
    output [10:0]  o_h_disp,
    output [10:0]  o_v_disp,

    output         lcd_clk,
    output [23:0]  lcd_rgb,
    output         lcd_hs,
    output         lcd_vs,
    output         lcd_de
);

// 4.3' 480*272
parameter  H_SYNC_4342   =  11'd41;     //行同步
parameter  H_BACK_4342   =  11'd2;      //行显示后沿
parameter  H_DISP_4342   =  11'd480;    //行有效数据
parameter  H_FRONT_4342  =  11'd2;      //行显示前沿
parameter  H_TOTAL_4342  =  11'd525;    //行扫描周期
   
parameter  V_SYNC_4342   =  11'd10;     //场同步
parameter  V_BACK_4342   =  11'd2;      //场显示后沿
parameter  V_DISP_4342   =  11'd272;    //场有效数据
parameter  V_FRONT_4342  =  11'd2;      //场显示前沿
parameter  V_TOTAL_4342  =  11'd286;    //场扫描周期
   
// 7' 800*480   
parameter  H_SYNC_7084   =  11'd128;    //行同步
parameter  H_BACK_7084   =  11'd88;     //行显示后沿
parameter  H_DISP_7084   =  11'd800;    //行有效数据
parameter  H_FRONT_7084  =  11'd40;     //行显示前沿
parameter  H_TOTAL_7084  =  11'd1056;   //行扫描周期
   
parameter  V_SYNC_7084   =  11'd2;      //场同步
parameter  V_BACK_7084   =  11'd33;     //场显示后沿
parameter  V_DISP_7084   =  11'd480;    //场有效数据
parameter  V_FRONT_7084  =  11'd10;     //场显示前沿
parameter  V_TOTAL_7084  =  11'd525;    //场扫描周期       
   
// 7' 1024*600   
parameter  H_SYNC_7016   =  11'd20;     //行同步
parameter  H_BACK_7016   =  11'd140;    //行显示后沿
parameter  H_DISP_7016   =  11'd1024;   //行有效数据
parameter  H_FRONT_7016  =  11'd160;    //行显示前沿
parameter  H_TOTAL_7016  =  11'd1344;   //行扫描周期
   
parameter  V_SYNC_7016   =  11'd3;      //场同步
parameter  V_BACK_7016   =  11'd20;     //场显示后沿
parameter  V_DISP_7016   =  11'd600;    //场有效数据
parameter  V_FRONT_7016  =  11'd12;     //场显示前沿
parameter  V_TOTAL_7016  =  11'd635;    //场扫描周期
   
// 10.1' 1280*800   
parameter  H_SYNC_1018   =  11'd10;     //行同步
parameter  H_BACK_1018   =  11'd80;     //行显示后沿
parameter  H_DISP_1018   =  11'd1280;   //行有效数据
parameter  H_FRONT_1018  =  11'd70;     //行显示前沿
parameter  H_TOTAL_1018  =  11'd1440;   //行扫描周期
   
parameter  V_SYNC_1018   =  11'd3;      //场同步
parameter  V_BACK_1018   =  11'd10;     //场显示后沿
parameter  V_DISP_1018   =  11'd800;    //场有效数据
parameter  V_FRONT_1018  =  11'd10;     //场显示前沿
parameter  V_TOTAL_1018  =  11'd823;    //场扫描周期

// 4.3' 800*480   
parameter  H_SYNC_4384   =  11'd128;    //行同步
parameter  H_BACK_4384   =  11'd88;     //行显示后沿
parameter  H_DISP_4384   =  11'd800;    //行有效数据
parameter  H_FRONT_4384  =  11'd40;     //行显示前沿
parameter  H_TOTAL_4384  =  11'd1056;   //行扫描周期
   
parameter  V_SYNC_4384   =  11'd2;      //场同步
parameter  V_BACK_4384   =  11'd33;     //场显示后沿
parameter  V_DISP_4384   =  11'd480;    //场有效数据
parameter  V_FRONT_4384  =  11'd10;     //场显示前沿
parameter  V_TOTAL_4384  =  11'd525;    //场扫描周期

reg [10:0] h_sync;
reg [10:0] h_back;
reg [10:0] h_disp;
reg [10:0] h_total;
reg [10:0] v_sync;
reg [10:0] v_back;
reg [10:0] v_disp;
reg [10:0] v_total;

assign o_h_disp = h_disp;
assign o_v_disp = v_disp;

//id
always @(posedge pclk) begin
    if(rst_n == 1'b0)begin
        h_sync  <= 11'd0;
        h_back  <= 11'd0;
        h_total <= 11'd0;
        v_sync  <= 11'd0;
        v_back  <= 11'd0;
        v_total <= 11'd0;
    end
    else begin
        case(lcd_id)
            16'h4342:begin
                h_sync  <= H_SYNC_4342;
                h_back  <= H_BACK_4342;
                h_disp  <= H_DISP_4342;
                h_total <= H_TOTAL_4342;
                v_sync  <= V_SYNC_4342;
                v_back  <= V_BACK_4342;
                v_disp  <= V_DISP_4342;
                v_total <= V_TOTAL_4342;
            end
            16'h7084:begin
                h_sync  <= H_SYNC_7084;
                h_back  <= H_BACK_7084;
                h_disp  <= H_DISP_7084;
                h_total <= H_TOTAL_7084;
                v_sync  <= V_SYNC_7084;
                v_back  <= V_BACK_7084;
                v_disp  <= V_DISP_7084;
                v_total <= V_TOTAL_7084;
            end
            16'h7016:begin
                h_sync  <= H_SYNC_7016;
                h_back  <= H_BACK_7016;
                h_disp  <= H_DISP_7016;
                h_total <= H_TOTAL_7016;
                v_sync  <= V_SYNC_7016;
                v_back  <= V_BACK_7016;
                v_disp  <= V_DISP_7016;
                v_total <= V_TOTAL_7016;
            end
            16'h4384:begin
                h_sync  <= H_SYNC_4384;
                h_back  <= H_BACK_4384;
                h_disp  <= H_DISP_4384;
                h_total <= H_TOTAL_4384;
                v_sync  <= V_SYNC_4384;
                v_back  <= V_BACK_4384;
                v_disp  <= V_DISP_4384;
                v_total <= V_TOTAL_4384;
            end
            16'h1018:begin
                h_sync  <= H_SYNC_1018;
                h_back  <= H_BACK_1018;
                h_disp  <= H_DISP_1018;
                h_total <= H_TOTAL_1018;
                v_sync  <= V_SYNC_1018;
                v_back  <= V_BACK_1018;
                v_disp  <= V_DISP_1018;
                v_total <= V_TOTAL_1018;
            end
            default:begin
                h_sync  <= H_SYNC_4342;
                h_back  <= H_BACK_4342;
                h_disp  <= H_DISP_4342;
                h_total <= H_TOTAL_4342;
                v_sync  <= V_SYNC_4342;
                v_back  <= V_BACK_4342;
                v_disp  <= V_DISP_4342;
                v_total <= V_TOTAL_4342;
            end
        endcase
    end
end

//cnt_row
reg [10:0] cnt_row;

always @(posedge pclk) begin
    if(rst_n == 1'b0)begin
        cnt_row <= 11'd0;
    end
    else if(cnt_row == h_total - 1'b1)begin
        cnt_row <= 11'd0;
    end
    else begin
        cnt_row <= cnt_row + 1'b1;
    end
end


//cnt_line
reg [10:0] cnt_line;

always @(posedge pclk) begin
    if(rst_n == 1'b0)begin
        cnt_line <= 11'd0;
    end
    else if((cnt_row == h_total - 1'b1) && (cnt_line == v_total - 1'b1))begin
        cnt_line <= 11'd0;
    end
    else if(cnt_row == h_total - 1'b1)begin
        cnt_line <= cnt_line + 1'b1;
    end
    else begin
        cnt_line <= cnt_line;
    end
end

//lcd_hs
reg r_lcd_hs;

assign lcd_hs = r_lcd_hs;

always @(posedge pclk) begin
    if(rst_n == 1'b0)begin
        r_lcd_hs <= 1'b0;
    end
    else if(cnt_row == h_total - 1'b1)begin
        r_lcd_hs <= 1'b1;
    end
    else if(cnt_row == h_sync - 1'b1)begin
        r_lcd_hs <= 1'b0;
    end
end

//lcd_vs
reg r_lcd_vs;

assign lcd_vs = r_lcd_vs;

always @(posedge pclk) begin
    if(rst_n == 1'b0)begin
        r_lcd_vs <= 1'b0;
    end
    else if((cnt_row == h_total - 1'b1) && (cnt_line == v_total - 1'b1))begin
        r_lcd_vs <= 1'b1;
    end
    else if((cnt_row == h_total - 1'b1) && (cnt_line == v_sync - 1'b1))begin
        r_lcd_vs <= 1'b0;
    end
end

//lcd_de
assign lcd_de  = (cnt_row  >= h_sync + h_back) && 
                 (cnt_row  <= h_sync + h_back + h_disp - 1'b1) && 
                 (cnt_line >= v_sync + v_back) &&
                 (cnt_line <= v_sync + v_back + v_disp - 1'b1);

//pixel_row and pixel_line
wire data_req;

assign data_req = (cnt_row  >= h_sync + h_back - 1'b1) && 
                  (cnt_row  <= h_sync + h_back + h_disp - 1'b1) &&
                  (cnt_line >= v_sync + v_back) &&
                  (cnt_line <= v_sync + v_back + v_disp - 1'b1);

assign pixel_row  = lcd_de ? (cnt_row  - h_sync - h_back) : 11'd0;

reg [10:0] r_pixel_line;

assign pixel_line = r_pixel_line;

always @(posedge pclk) begin
    if(rst_n == 1'b0)begin
        r_pixel_line <= 11'd0;
    end
    else if(data_req)begin
        if(pixel_row == h_disp - 1'b1)begin
            if(pixel_line == v_disp - 1'b1)begin
                r_pixel_line <= 11'd0;
            end
            else begin
                r_pixel_line <= r_pixel_line + 1'b1;
            end
        end
        else begin
            r_pixel_line <= cnt_line - v_sync - v_back;
        end
    end
    else begin
        r_pixel_line <= r_pixel_line;
    end
end

//lcd_clk
assign lcd_clk = pclk;

//lcd_rgb
assign lcd_rgb = lcd_de ? pixel_data : 24'd0;

endmodule 



































