module clk_div (
    input        sys_clk,
    input        sys_rst,

    input [15:0] lcd_id,
    
    output       pclk
);

reg clk_12_5m;
reg clk_25m;

reg [1:0] cnt_4;
reg       cnt_2;

always @(posedge sys_clk) begin
    if(sys_rst == 1'b0)begin
        cnt_4     <= 2'd0;
        clk_12_5m <= 1'b0;
    end
    else if(cnt_4 == 2'd3)begin
        cnt_4     <= 2'd0;
        clk_12_5m <= ~clk_12_5m;
    end
    else begin
        cnt_4     <= cnt_4 + 1'b1;
        clk_12_5m <= clk_12_5m;
    end
end

always @(posedge sys_clk) begin
    if(sys_rst == 1'b0)begin
        cnt_2     <= 1'b0;
        clk_25m   <= 1'b0;
    end
    else if(cnt_2 == 1'b1)begin
        cnt_2     <= 1'b0;
        clk_25m   <= ~clk_25m;
    end
    else begin
        cnt_2     <= cnt_2 + 1'b1;
        clk_25m   <= clk_25m;
    end
end

reg r_pclk;

assign pclk = r_pclk;

always @(*) begin
    if(sys_rst == 1'b0)begin
        r_pclk <= 1'b0;
    end
    else begin
        case(lcd_id)
            16'h4342:begin
                r_pclk <= clk_12_5m;
            end
            16'h7084:begin
                r_pclk <= clk_25m;
            end
            16'h7016:begin
                r_pclk <= sys_clk;
            end
            16'h4384:begin
                r_pclk <= clk_25m;
            end
            16'h1018:begin
                r_pclk <= sys_clk;
            end
            default:begin
                r_pclk <= 1'b0;
            end
        endcase
    end
end

endmodule 































