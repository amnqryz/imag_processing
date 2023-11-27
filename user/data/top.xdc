# Microphase zynq7010

## CLK and Reset
#set_property -dict {PACKAGE_PIN H16 IOSTANDARD LVCMOS33} [get_ports sys_clk]
#set_property -dict {PACKAGE_PIN B19 IOSTANDARD LVCMOS33} [get_ports sys_rst]

## LCD
#set_property -dict {PACKAGE_PIN Y14 IOSTANDARD LVCMOS33} [get_ports lcd_clk]
#set_property -dict {PACKAGE_PIN U15 IOSTANDARD LVCMOS33} [get_ports lcd_hs]
#set_property -dict {PACKAGE_PIN U14 IOSTANDARD LVCMOS33} [get_ports lcd_vs]
#set_property -dict {PACKAGE_PIN V13 IOSTANDARD LVCMOS33} [get_ports lcd_de]
#set_property -dict {PACKAGE_PIN W14 IOSTANDARD LVCMOS33} [get_ports lcd_disp]

#set_property -dict {PACKAGE_PIN W19 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[0]]
#set_property -dict {PACKAGE_PIN W18 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[1]]
#set_property -dict {PACKAGE_PIN U19 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[2]]
#set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[3]]
#set_property -dict {PACKAGE_PIN W16 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[4]]
#set_property -dict {PACKAGE_PIN V16 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[5]]
#set_property -dict {PACKAGE_PIN W15 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[6]]
#set_property -dict {PACKAGE_PIN V15 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[7]]
#set_property -dict {PACKAGE_PIN P19 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[8]]
#set_property -dict {PACKAGE_PIN W20 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[9]]
#set_property -dict {PACKAGE_PIN V20 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[10]]
#set_property -dict {PACKAGE_PIN Y19 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[11]]
#set_property -dict {PACKAGE_PIN N18 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[12]]
#set_property -dict {PACKAGE_PIN Y18 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[13]]
#set_property -dict {PACKAGE_PIN Y17 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[14]]
#set_property -dict {PACKAGE_PIN Y16 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[15]]
#set_property -dict {PACKAGE_PIN U20 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[16]]
#set_property -dict {PACKAGE_PIN T20 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[17]]
#set_property -dict {PACKAGE_PIN R18 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[18]]
#set_property -dict {PACKAGE_PIN T17 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[19]]
#set_property -dict {PACKAGE_PIN P20 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[20]]
#set_property -dict {PACKAGE_PIN N20 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[21]]
#set_property -dict {PACKAGE_PIN P18 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[22]]
#set_property -dict {PACKAGE_PIN N17 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[23]]

# zhengdianyuanzi XC7A35TFGG484-1

## CLK and Reset

#set_property -dict {PACKAGE_PIN H16 IOSTANDARD LVCMOS33} [get_ports sys_clk]
#set_property -dict {PACKAGE_PIN U2 IOSTANDARD LVCMOS33} [get_ports sys_rst_n]

## USB

#set_property -dict {PACKAGE_PIN Y4 IOSTANDARD LVCMOS33} [get_ports usb_clk_60m]

#set_property -dict {PACKAGE_PIN W1 IOSTANDARD LVCMOS33} [get_ports usb_rxf_n]
#set_property -dict {PACKAGE_PIN AA5 IOSTANDARD LVCMOS33} [get_ports usb_txe_n]
#set_property -dict {PACKAGE_PIN U3 IOSTANDARD LVCMOS33} [get_ports usb_oe_n]
#set_property -dict {PACKAGE_PIN V4 IOSTANDARD LVCMOS33} [get_ports usb_rd_n]
#set_property -dict {PACKAGE_PIN Y3 IOSTANDARD LVCMOS33} [get_ports usb_wr_n]

#set_property -dict {PACKAGE_PIN Y1 IOSTANDARD LVCMOS33} [get_ports {usb_data[7]}]
#set_property -dict {PACKAGE_PIN AA1 IOSTANDARD LVCMOS33} [get_ports {usb_data[6]}]
#set_property -dict {PACKAGE_PIN AB1 IOSTANDARD LVCMOS33} [get_ports {usb_data[5]}]
#set_property -dict {PACKAGE_PIN AB2 IOSTANDARD LVCMOS33} [get_ports {usb_data[4]}]
#set_property -dict {PACKAGE_PIN AA3 IOSTANDARD LVCMOS33} [get_ports {usb_data[3]}]
#set_property -dict {PACKAGE_PIN AB3 IOSTANDARD LVCMOS33} [get_ports {usb_data[2]}]
#set_property -dict {PACKAGE_PIN AA4 IOSTANDARD LVCMOS33} [get_ports {usb_data[1]}]
#set_property -dict {PACKAGE_PIN AB5 IOSTANDARD LVCMOS33} [get_ports {usb_data[0]}]

#set_property -dict {PACKAGE_PIN V3 IOSTANDARD LVCMOS33} [get_ports usb_siwu_n]

# heijing XC7A35TFGG484-1

## CLK and Reset
set_property -dict {PACKAGE_PIN Y18 IOSTANDARD LVCMOS33} [get_ports sys_clk]
set_property -dict {PACKAGE_PIN F20 IOSTANDARD LVCMOS33} [get_ports sys_rst]

## EEPROM
set_property -dict {PACKAGE_PIN N18 IOSTANDARD LVCMOS33} [get_ports scl]
set_property -dict {PACKAGE_PIN N19 IOSTANDARD LVCMOS33} [get_ports sda]

## LED
set_property -dict {PACKAGE_PIN F19 IOSTANDARD LVCMOS33} [get_ports led]

## KEY
set_property -dict {PACKAGE_PIN K14 IOSTANDARD LVCMOS33} [get_ports iic_rw_ctrl]


create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 8192 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list sys_clk_IBUF_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 5 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {u_iic_driver/state_next[0]} {u_iic_driver/state_next[1]} {u_iic_driver/state_next[2]} {u_iic_driver/state_next[3]} {u_iic_driver/state_next[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 8 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {iic_data_out[0]} {iic_data_out[1]} {iic_data_out[2]} {iic_data_out[3]} {iic_data_out[4]} {iic_data_out[5]} {iic_data_out[6]} {iic_data_out[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 5 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {u_iic_driver/state_now[0]} {u_iic_driver/state_now[1]} {u_iic_driver/state_now[2]} {u_iic_driver/state_now[3]} {u_iic_driver/state_now[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list iic_ack]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list iic_done]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list scl_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list u_iic_driver/sda_in]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list u_iic_driver/sda_out]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets sys_clk_IBUF_BUFG]
