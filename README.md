# Introduction

1. This repository is used for imag processing

## Base

### IIC

#### Physical Layer

1. 时钟线: SCL;
2. 数据线: SDA;
3. 总线空闲时处于高阻状态,适用于输入/输出。若需要产生高电平,需要外部使用上拉电阻;

#### Protocol Layer

- 开始信号: SCL为高电平时,SDA由高电平向低电平跳变,开始传送数据。
- 结束信号: SCL为高电平时,SDA由低电平向高电平跳变,结束传送数据。
- 应答信号: 从机接收到8bit数据后,会向主机发送应答信号。如果此应答信号为低电平脉冲,表示已收到数据。

1. SCL为高电平时,SDA必须保持稳定状态;SCL为低电平时,SDA允许电平跳变;
2. 时序图如下:
                
           
        

















