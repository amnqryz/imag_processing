# ОўПа zynq7010

## CLK and Reset
set_property -dict {PACKAGE_PIN H16 IOSTANDARD LVCMOS33} [get_ports sys_clk]
set_property -dict {PACKAGE_PIN B19 IOSTANDARD LVCMOS33} [get_ports sys_rst]

## LCD
set_property -dict {PACKAGE_PIN Y14 IOSTANDARD LVCMOS33} [get_ports lcd_clk]
set_property -dict {PACKAGE_PIN U15 IOSTANDARD LVCMOS33} [get_ports lcd_hs]
set_property -dict {PACKAGE_PIN U14 IOSTANDARD LVCMOS33} [get_ports lcd_vs]
set_property -dict {PACKAGE_PIN V13 IOSTANDARD LVCMOS33} [get_ports lcd_de]
set_property -dict {PACKAGE_PIN W14 IOSTANDARD LVCMOS33} [get_ports lcd_disp]

set_property -dict {PACKAGE_PIN W19 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[0]]
set_property -dict {PACKAGE_PIN W18 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[1]]
set_property -dict {PACKAGE_PIN U19 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[2]]
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[3]]
set_property -dict {PACKAGE_PIN W16 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[4]]
set_property -dict {PACKAGE_PIN V16 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[5]]
set_property -dict {PACKAGE_PIN W15 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[6]]
set_property -dict {PACKAGE_PIN V15 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[7]]
set_property -dict {PACKAGE_PIN P19 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[8]]
set_property -dict {PACKAGE_PIN W20 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[9]]
set_property -dict {PACKAGE_PIN V20 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[10]]
set_property -dict {PACKAGE_PIN Y19 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[11]]
set_property -dict {PACKAGE_PIN N18 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[12]]
set_property -dict {PACKAGE_PIN Y18 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[13]]
set_property -dict {PACKAGE_PIN Y17 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[14]]
set_property -dict {PACKAGE_PIN Y16 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[15]]
set_property -dict {PACKAGE_PIN U20 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[16]]
set_property -dict {PACKAGE_PIN T20 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[17]]
set_property -dict {PACKAGE_PIN R18 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[18]]
set_property -dict {PACKAGE_PIN T17 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[19]]
set_property -dict {PACKAGE_PIN P20 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[20]]
set_property -dict {PACKAGE_PIN N20 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[21]]
set_property -dict {PACKAGE_PIN P18 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[22]]
set_property -dict {PACKAGE_PIN N17 IOSTANDARD LVCMOS33} [get_ports lcd_rgb[23]]
























