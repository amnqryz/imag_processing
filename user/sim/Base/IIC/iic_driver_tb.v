module iic_driver_tb();

parameter DEVICE_ADDR = 7'b1010000;
parameter CLK_FREQ    = 26'd100_000_000;
parameter I2C_FREQ    = 18'd400_000;

parameter TIME        = 5;

parameter MAIN_FRE   = 100; //unit MHz
reg                   sys_clk = 0;
reg                   sys_rst = 0;

always begin
    #(500/MAIN_FRE) sys_clk = ~sys_clk;
end

always begin
    #50 sys_rst = 1;
end

//Instance 
// outports wire
wire [7:0]  	iic_data_out;
wire        	iic_ack;
wire        	iic_done;
wire        	scl;
wire            sda_out;

reg             bit_ctrl;
reg             iic_exe;
reg             iic_rw_ctrl;
reg [15:0]      iic_addr;
reg [7:0]       iic_data_in;
reg             sda_in;


initial begin
    bit_ctrl    = 1'b1;
    iic_exe     = 1'b1;
end

//done_cnt
reg [2:0] done_cnt;

reg       r_iic_done = 1'b0;
wire      done_pos;

assign done_pos = (~r_iic_done) & iic_done;

always @(posedge sys_clk) begin
    r_iic_done <= iic_done;
end

always @(posedge sys_clk) begin
    if(sys_rst == 1'b0)
        done_cnt <= 3'd0;
    else if(done_cnt == TIME)
        done_cnt <= 3'd0;
    else if(done_pos)
        done_cnt <= done_cnt + 1'b1;
end

//iic_rw_ctrl
always @(posedge sys_clk) begin
    if(sys_rst == 1'b0)
        iic_rw_ctrl <= 1'b1;
    else if(done_cnt == TIME)
        iic_rw_ctrl <= 1'b0;
end

//addr and data
always @(*) begin
    if(sys_rst == 1'b0)begin
        iic_addr    <= 16'd0;
        iic_data_in <= 8'd0;
    end
    else begin
        case(done_cnt)
            3'd0:begin
                iic_addr    <= {8'h79,8'h00};
                iic_data_in <= 8'hD1;
            end
            3'd1:begin
                iic_addr    <= {8'h21,8'h00};
                iic_data_in <= 8'hC9;
            end
            3'd2:begin
                iic_addr    <= {8'h36,8'h00};
                iic_data_in <= 8'h85;
            end
            3'd3:begin
                iic_addr    <= {8'hAC,8'h00};
                iic_data_in <= 8'h9C;
            end
            3'd4:begin
                iic_addr    <= {8'hB5,8'h00};
                iic_data_in <= 8'hE2;
            end
            3'd5:begin
                iic_addr    <= {8'h16,8'h00};
                iic_data_in <= 8'h6F;
            end
            default:begin
                iic_addr    <= {8'b11010010,8'b00101101};
                iic_data_in <= 8'b01100101;
            end
        endcase
    end
end

//READ
reg  r_iic_ack = 1'b0;
wire iic_ack_pos;

assign iic_ack_pos = (~r_iic_ack) & iic_ack;

always @(posedge sys_clk) begin
    r_iic_ack <= iic_ack;
end

reg [1:0] ack_cnt;

always @(posedge sys_clk) begin
    if(sys_rst == 1'b0)begin
       ack_cnt <= 2'd0; 
    end
    else if(iic_done)begin
        ack_cnt <= 2'd0;
    end
    else if(iic_rw_ctrl == 1'b0)begin
        if(ack_cnt == 2'd3)begin
            ack_cnt <= ack_cnt;
        end
        else begin
            if(iic_ack_pos)
                ack_cnt <= ack_cnt + 1'b1;
        end
    end
end

reg  r_scl = 1'b0;
wire scl_pos;

assign scl_pos = (~r_scl) & scl;

always @(posedge sys_clk) begin
    r_scl <= scl;
end

reg [3:0] sda_cnt;

always @(posedge sys_clk) begin
    if(sys_rst == 1'b0)
        sda_cnt <= 4'd0;
    else if(ack_cnt == 2'd3)begin
        if(sda_cnt == 4'd8)
            sda_cnt <= 4'd0;
        else if(scl_pos)
            sda_cnt <= sda_cnt + 1'b1;
    end
    else begin
        sda_cnt <= 4'd0;
    end
end

always @(posedge sys_clk) begin
    if(sys_rst == 1'b0)
        sda_in <= 1'b0;
    else if(iic_rw_ctrl == 1'b1)
        sda_in <= 1'b0;
    else begin
        if(ack_cnt < 2'd3)begin
           sda_in <= 1'b0; 
        end
        else begin
            case(sda_cnt)
                4'd0: sda_in <= 1'b1;
                4'd1: sda_in <= 1'b1;
                4'd2: sda_in <= 1'b0;
                4'd3: sda_in <= 1'b1;
                4'd4: sda_in <= 1'b1;
                4'd5: sda_in <= 1'b0;
                4'd6: sda_in <= 1'b0;
                4'd7: sda_in <= 1'b1;
                4'd8: sda_in <= 1'b0;
                default: sda_in <= 1'b0;
            endcase
        end
    end
end

iic_driver #(
    .DEVICE_ADDR (DEVICE_ADDR),
    .CLK_FREQ    (CLK_FREQ),
    .I2C_FREQ    (I2C_FREQ)
)
u_iic_driver(
    .sys_clk      	( sys_clk       ),
    .sys_rst      	( sys_rst       ),
    .bit_ctrl     	( bit_ctrl      ),
    .iic_exe      	( iic_exe       ),
    .iic_rw_ctrl  	( iic_rw_ctrl   ),
    .iic_addr     	( iic_addr      ),
    .iic_data_in  	( iic_data_in   ),
    .iic_data_out 	( iic_data_out  ),
    .iic_ack      	( iic_ack       ),
    .iic_done     	( iic_done      ),
    .scl          	( scl           ),
    .sda_in       	( sda_in        ),
    .sda_out      	( sda_out       )
);



initial begin            
    $dumpfile("wave.vcd");        
    $dumpvars(0, iic_driver_tb);    
    #5000000 $finish;
end

endmodule  //TOP
