del wave wave.vcd
iverilog -o wave iic_driver_tb.v E:\fpga\project\imag_processing\user\src\Base\IIC\iic_driver.v
vvp -n wave -lxt
gtkwave wave.vcd
pause





