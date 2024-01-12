module ov5640_dri #(
    parameter DEVICE_ADDR = 7'h3c,
    parameter CLK_FREQ    = 27'd50_000_000,
    parameter I2C_FREQ    = 18'd250_000,
    parameter BIT_CTRL    = 1'b1
)
(
    input           sys_clk,
    input           sys_rst,

    //camera
    input           cam_pclk,
    input           cam_vsync,
    input           cam_href,
    input [7:0]     cam_data,

    output          cam_rst_n,
    output          cam_pwdn,
    output          cam_scl,
    inout           cam_sda,

    //resolution ratio
    input    [12:0] cmos_h_pixel,   //ˮƽ����ֱ���
    input    [12:0] cmos_v_pixel,   //��ֱ����ֱ���
    input    [12:0] total_h_pixel,  //ˮƽ�����ش�С
    input    [12:0] total_v_pixel,  //��ֱ�����ش�С
    input           capture_start,  //ͼ��ɼ���ʼ�ź�
    output          cam_init_done,  //����ͷ��ʼ�����

    //Field synchronization signal
    output          cmos_frame_vsync,
    output          cmos_frame_href,
    output          cmos_frame_valid,
    output          cmos_frame_data 
    
);

// outports wire
wire [7:0]  	iic_data_out;
wire        	iic_ack;
wire        	iic_done;
wire        	scl;
wire        	dri_clk;

wire            iic_exe;
wire            iic_rw_ctrl;
wire [15:0]     iic_addr;
wire [7:0]  	iic_data_in;

iic_driver #(
    .DEVICE_ADDR 	( DEVICE_ADDR   ),
    .CLK_FREQ    	( CLK_FREQ      ),
    .I2C_FREQ    	( I2C_FREQ      )
)
u_iic_driver(
    .sys_clk      	( sys_clk       ),
    .sys_rst      	( sys_rst       ),
    
    .bit_ctrl     	( BIT_CTRL      ),
    .iic_exe      	( iic_exe       ),
    .iic_rw_ctrl  	( iic_rw_ctrl   ),
    .iic_addr     	( iic_addr      ),
    .iic_data_in  	( iic_data_in   ),
    
    .iic_data_out 	( iic_data_out  ),
    .iic_ack      	( iic_ack       ),
    .iic_done     	( iic_done      ),
    .scl          	( cam_scl       ),
    .sda          	( cam_sda       ),
    
    .dri_clk      	( dri_clk       )
);


ov5640_cfg u_ov5640_cfg(
    .clk                (dri_clk),          //ʱ���ź�
    .rst_n              (sys_rst),          //��λ�źţ��͵�ƽ��Ч
    
    .i2c_data_r         (iic_data_out),     //I2C����������
    .i2c_done           (iic_done),         //I2C�Ĵ�����������ź�
    .cmos_h_pixel       (cmos_h_pixel),
    .cmos_v_pixel       (cmos_v_pixel),
    .total_h_pixel      (total_h_pixel),    //ˮƽ�����ش�С
    .total_v_pixel      (total_v_pixel),    //��ֱ�����ش�С
    
    .i2c_exec           (iic_exe),          //I2C����ִ���ź�   
    .i2c_data           (iic_data_in),      //I2CҪ���õĵ�ַ������(��16λ��ַ,��8λ����)
    .i2c_rh_wl          (iic_rw_ctrl),      //I2C��д�����ź�
    .init_done          (cam_init_done)     //��ʼ������ź�
);

cmos_capture_data u_cmos_capture_data(
    .rst_n              (sys_rst),          //��λ�ź�    
                        
    .cam_pclk           (cam_pclk),         //cmos ��������ʱ��
    .cam_vsync          (cam_vsync),        //cmos ��ͬ���ź�
    .cam_href           (cam_href),         //cmos ��ͬ���ź�
    .cam_data           (cam_data),                      
                        
    .cmos_frame_vsync   (cmos_frame_vsync), //֡��Ч�ź�    
    .cmos_frame_href    (cmos_frame_href),  //����Ч�ź�
    .cmos_frame_valid   (cmos_frame_valid), //������Чʹ���ź�
    .cmos_frame_data    (cmos_frame_data)   //��Ч����        
    );

endmodule //ov5640_dri
