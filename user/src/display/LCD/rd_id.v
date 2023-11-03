module rd_id (
    input             sys_clk,
    input             sys_rst,

    input      [23:0] lcd_rgb,
    output reg [15:0] lcd_id
);

reg rd_flag;

always @(posedge sys_clk) begin
    if(sys_rst == 1'b0) begin
        rd_flag <= 1'b0;
        lcd_id  <= 16'd0;
    end
    else begin
        if(rd_flag == 1'b0) begin
            rd_flag <= 1'b1;
            case({lcd_rgb[7],lcd_rgb[15],lcd_rgb[23]})
                3'b000 : lcd_id <= 16'h4342; //4.3' RGB-LCD RES:480x272
                3'b001 : lcd_id <= 16'h7084; //7' RGB-LCD RES:800x480
                3'b010 : lcd_id <= 16'h7016; //7' RGB-LCD RES:1024x600
                3'b100 : lcd_id <= 16'h4384; //4.3' RGB-LCD RES:800x480
                3'b101 : lcd_id <= 16'h1018; //10' RGB-LCD RES:1280x800
                default: lcd_id <= 16'd0;
            endcase
        end
    end
 end












endmodule //lcd_id






































