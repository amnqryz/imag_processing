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
set_property -dict {PACKAGE_PIN U2 IOSTANDARD LVCMOS33} [get_ports sys_rst_n]

## USB

set_property -dict {PACKAGE_PIN Y4 IOSTANDARD LVCMOS33} [get_ports usb_clk_60m]

set_property -dict {PACKAGE_PIN W1 IOSTANDARD LVCMOS33} [get_ports usb_rxf_n]
set_property -dict {PACKAGE_PIN AA5 IOSTANDARD LVCMOS33} [get_ports usb_txe_n]
set_property -dict {PACKAGE_PIN U3 IOSTANDARD LVCMOS33} [get_ports usb_oe_n]
set_property -dict {PACKAGE_PIN V4 IOSTANDARD LVCMOS33} [get_ports usb_rd_n]
set_property -dict {PACKAGE_PIN Y3 IOSTANDARD LVCMOS33} [get_ports usb_wr_n]

set_property -dict {PACKAGE_PIN Y1 IOSTANDARD LVCMOS33} [get_ports {usb_data[7]}]
set_property -dict {PACKAGE_PIN AA1 IOSTANDARD LVCMOS33} [get_ports {usb_data[6]}]
set_property -dict {PACKAGE_PIN AB1 IOSTANDARD LVCMOS33} [get_ports {usb_data[5]}]
set_property -dict {PACKAGE_PIN AB2 IOSTANDARD LVCMOS33} [get_ports {usb_data[4]}]
set_property -dict {PACKAGE_PIN AA3 IOSTANDARD LVCMOS33} [get_ports {usb_data[3]}]
set_property -dict {PACKAGE_PIN AB3 IOSTANDARD LVCMOS33} [get_ports {usb_data[2]}]
set_property -dict {PACKAGE_PIN AA4 IOSTANDARD LVCMOS33} [get_ports {usb_data[1]}]
set_property -dict {PACKAGE_PIN AB5 IOSTANDARD LVCMOS33} [get_ports {usb_data[0]}]

set_property -dict {PACKAGE_PIN V3 IOSTANDARD LVCMOS33} [get_ports usb_siwu_n]


create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 4096 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list usb_clk_60m_IBUF_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {rd_data[0]} {rd_data[1]} {rd_data[2]} {rd_data[3]} {rd_data[4]} {rd_data[5]} {rd_data[6]} {rd_data[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 8 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {wr_data[0]} {wr_data[1]} {wr_data[2]} {wr_data[3]} {wr_data[4]} {wr_data[5]} {wr_data[6]} {wr_data[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 1 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list empty]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list full]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list rd_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list usb_oe_n_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list usb_rd_n_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list usb_rxf_n_IBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list usb_txe_n_IBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list usb_wr_n_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list wr_en]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets usb_clk_60m_IBUF_BUFG]
