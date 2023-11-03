module lcd_display (
    input             pclk,
    input             rst_n,
    
    input             lcd_vs,
    input [10:0]      pixel_row,
    input [10:0]      pixel_line,
    input [10:0]      h_disp,
    input [10:0]      v_disp,

    output [23:0] pixel_data
);

localparam WHITE = 24'hFFFFFF;
localparam BLACK = 24'h000000;
localparam RED   = 24'hFF0000;
localparam GREEN = 24'h00FF00;
localparam BLUE  = 24'h0000FF;
/*
reg [4:0] cnt = 4'd0;

always @(posedge lcd_vs) begin
    if(cnt == 5'd19)begin
        cnt <= 5'd0;
    end
    else begin
        cnt <= cnt + 1'b1;
    end
end
*/
/*
always @(posedge pclk) begin
    if(rst_n == 1'b0)begin
        pixel_data <= BLACK;
    end
    else begin
        if((pixel_row >= 11'd0) && (pixel_row < h_disp/5*1))
            pixel_data <= RED;
        else if((pixel_row >= h_disp/5*1) && (pixel_row < h_disp/5*2))
            pixel_data <= BLACK;
        else if((pixel_row >= h_disp/5*2) && (pixel_row < h_disp/5*3))
            pixel_data <= GREEN;
        else if((pixel_row >= h_disp/5*3) && (pixel_row < h_disp/5*4))
            pixel_data <= WHITE;
        else
            pixel_data <= BLUE;
    end
end
*/

// outports wire
wire [23:0] 	r_pixel_data;

wire [9:0]      addr;

assign addr = (pixel_row - 10'd200) + 30 * (pixel_line - 10'd100);

lcd_rom u_lcd_rom(
    .pclk       	( pclk        ),
    .rst_n      	( rst_n       ),
    .addr       	( addr        ),
    .pixel_data 	( r_pixel_data  )
);

wire valid = (pixel_row  >= 10'd200) &&
             (pixel_row  <= 10'd229) &&
             (pixel_line >= 10'd100) &&
             (pixel_line <= 10'd129);

assign pixel_data = valid ? r_pixel_data : BLACK;

endmodule //lcd_display









































