module mipi_phy (
    input        rst_n,

    input        mipi_clk_p,
    input        mipi_clk_n,

    input [1:0]  mipi_lane_p,
    input [1:0]  mipi_lane_n,

    output       clk_bit,
    output       clk_byte,

    output [7:0] lane0_data,
    output [7:0] lane1_data
    
);

wire   clk_bit_inv;
wire   clk_bit_pre;
wire   clk_div;

assign clk_bit_inv = ~clk_bit;
assign clk_byte    =  clk_div;

//mipi_clk
IBUFDS #(
      .DIFF_TERM("FALSE"),       // Differential Termination
      .IBUF_LOW_PWR("TRUE"),     // Low power="TRUE", Highest performance="FALSE" 
      .IOSTANDARD("DIFF_HSTL_II_18")     // Specify the input I/O standard
) IBUFDS_clk (
      .O(clk_bit_pre),  // Buffer output
      .I(mipi_clk_p),  // Diff_p buffer input (connect directly to top-level port)
      .IB(mipi_clk_n) // Diff_n buffer input (connect directly to top-level port)
   );

BUFGCE BUFGCE_clk (
      .O(clk_bit),   // 1-bit output: Clock output
      .CE(1'b1), // 1-bit input: Clock enable input for I0
      .I(clk_bit_pre)    // 1-bit input: Primary clock
   );

BUFR #(
      .BUFR_DIVIDE("4"),   // Values: "BYPASS, 1, 2, 3, 4, 5, 6, 7, 8" 
      .SIM_DEVICE("7SERIES")  // Must be set to "7SERIES" 
   )
   BUFR_clk (
      .O(clk_div),     // 1-bit output: Clock output port
      .CE(1'b1),   // 1-bit input: Active high, clock enable (Divided modes only)
      .CLR(~rst_n), // 1-bit input: Active high, asynchronous clear (Divided modes only)
      .I(clk_bit_pre)      // 1-bit input: Clock buffer input driven by an IBUF, MMCM or local interconnect
   );

//mipi_lane
wire [1:0] mipi_bit;

IBUFDS #(
      .DIFF_TERM("FALSE"),       // Differential Termination
      .IBUF_LOW_PWR("TRUE"),     // Low power="TRUE", Highest performance="FALSE" 
      .IOSTANDARD("DIFF_HSTL_II_18")     // Specify the input I/O standard
) IBUFDS_lane_0 (
      .O(mipi_bit[0]),  // Buffer output
      .I(mipi_lane_p[0]),  // Diff_p buffer input (connect directly to top-level port)
      .IB(mipi_lane_n[0]) // Diff_n buffer input (connect directly to top-level port)
   );

IBUFDS #(
      .DIFF_TERM("FALSE"),       // Differential Termination
      .IBUF_LOW_PWR("TRUE"),     // Low power="TRUE", Highest performance="FALSE" 
      .IOSTANDARD("DIFF_HSTL_II_18")     // Specify the input I/O standard
) IBUFDS_lane_1 (
      .O(mipi_bit[1]),  // Buffer output
      .I(mipi_lane_p[1]),  // Diff_p buffer input (connect directly to top-level port)
      .IB(mipi_lane_n[1]) // Diff_n buffer input (connect directly to top-level port)
   );

wire in_delayed_0;

IDELAYE2 #(
      .CINVCTRL_SEL("FALSE"),          // Enable dynamic clock inversion (FALSE, TRUE)
      .DELAY_SRC("IDATAIN"),           // Delay input (IDATAIN, DATAIN)
      .HIGH_PERFORMANCE_MODE("TRUE"), // Reduced jitter ("TRUE"), Reduced power ("FALSE")
      .IDELAY_TYPE("FIXED"),           // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
      .IDELAY_VALUE(0),                // Input delay tap setting (0-31)
      .PIPE_SEL("FALSE"),              // Select pipelined mode, FALSE, TRUE
      .REFCLK_FREQUENCY(200.0),        // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
      .SIGNAL_PATTERN("DATA")          // DATA, CLOCK input signal
   )
   IDELAYE2_inst_0 (
      .CNTVALUEOUT(), // 5-bit output: Counter value output
      .DATAOUT(in_delayed_0),         // 1-bit output: Delayed data output
      .C(clk_div),                     // 1-bit input: Clock input
      .CE(1'b0),                   // 1-bit input: Active high enable increment/decrement input
      .CINVCTRL(1'b0),       // 1-bit input: Dynamic clock inversion input
      .CNTVALUEIN(5'b00000),   // 5-bit input: Counter value input
      .DATAIN(1'b0),           // 1-bit input: Internal delay data input
      .IDATAIN(mipi_bit[0]),         // 1-bit input: Data input from the I/O
      .INC(1'b0),                 // 1-bit input: Increment / Decrement tap delay input
      .LD(1'b0),                   // 1-bit input: Load IDELAY_VALUE input
      .LDPIPEEN(1'b0),       // 1-bit input: Enable PIPELINE register to load data input
      .REGRST(1'b0)            // 1-bit input: Active-high reset tap-delay input
   );

wire delay_locked_0;

IDELAYCTRL IDELAYCTRL_inst_0 (
      .RDY(delay_locked_0),       // 1-bit output: Ready output
      .REFCLK(clk_div), // 1-bit input: Reference clock input
      .RST(1'b0)        // 1-bit input: Active high reset input
   );

wire in_delayed_1;

IDELAYE2 #(
      .CINVCTRL_SEL("FALSE"),          // Enable dynamic clock inversion (FALSE, TRUE)
      .DELAY_SRC("IDATAIN"),           // Delay input (IDATAIN, DATAIN)
      .HIGH_PERFORMANCE_MODE("TRUE"), // Reduced jitter ("TRUE"), Reduced power ("FALSE")
      .IDELAY_TYPE("FIXED"),           // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
      .IDELAY_VALUE(0),                // Input delay tap setting (0-31)
      .PIPE_SEL("FALSE"),              // Select pipelined mode, FALSE, TRUE
      .REFCLK_FREQUENCY(200.0),        // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
      .SIGNAL_PATTERN("DATA")          // DATA, CLOCK input signal
   )
   IDELAYE2_inst_1 (
      .CNTVALUEOUT(), // 5-bit output: Counter value output
      .DATAOUT(in_delayed_1),         // 1-bit output: Delayed data output
      .C(clk_div),                     // 1-bit input: Clock input
      .CE(1'b0),                   // 1-bit input: Active high enable increment/decrement input
      .CINVCTRL(1'b0),       // 1-bit input: Dynamic clock inversion input
      .CNTVALUEIN(5'b00000),   // 5-bit input: Counter value input
      .DATAIN(1'b0),           // 1-bit input: Internal delay data input
      .IDATAIN(mipi_bit[1]),         // 1-bit input: Data input from the I/O
      .INC(1'b0),                 // 1-bit input: Increment / Decrement tap delay input
      .LD(1'b0),                   // 1-bit input: Load IDELAY_VALUE input
      .LDPIPEEN(1'b0),       // 1-bit input: Enable PIPELINE register to load data input
      .REGRST(1'b0)            // 1-bit input: Active-high reset tap-delay input
   );

ISERDESE2 #(
      .DATA_RATE("DDR"),           // DDR, SDR
      .DATA_WIDTH(8),              // Parallel data width (2-8,10,14)
      .DYN_CLKDIV_INV_EN("FALSE"), // Enable DYNCLKDIVINVSEL inversion (FALSE, TRUE)
      .DYN_CLK_INV_EN("FALSE"),    // Enable DYNCLKINVSEL inversion (FALSE, TRUE)
      // INIT_Q1 - INIT_Q4: Initial value on the Q outputs (0/1)
      .INIT_Q1(1'b0),
      .INIT_Q2(1'b0),
      .INIT_Q3(1'b0),
      .INIT_Q4(1'b0),
      .INTERFACE_TYPE("NETWORKING"),   // MEMORY, MEMORY_DDR3, MEMORY_QDR, NETWORKING, OVERSAMPLE
      .IOBDELAY("NONE"),           // NONE, BOTH, IBUF, IFD
      .NUM_CE(2),                  // Number of clock enables (1,2)
      .OFB_USED("FALSE"),          // Select OFB path (FALSE, TRUE)
      .SERDES_MODE("MASTER"),      // MASTER, SLAVE
      // SRVAL_Q1 - SRVAL_Q4: Q output values when SR is used (0/1)
      .SRVAL_Q1(1'b0),
      .SRVAL_Q2(1'b0),
      .SRVAL_Q3(1'b0),
      .SRVAL_Q4(1'b0)
   )
   ISERDESE2_inst_0 (
      .O(),                       // 1-bit output: Combinatorial output
      // Q1 - Q8: 1-bit (each) output: Registered data outputs
      .Q1(lane0_data[7]),
      .Q2(lane0_data[6]),
      .Q3(lane0_data[5]),
      .Q4(lane0_data[4]),
      .Q5(lane0_data[3]),
      .Q6(lane0_data[2]),
      .Q7(lane0_data[1]),
      .Q8(lane0_data[0]),
      // SHIFTOUT1, SHIFTOUT2: 1-bit (each) output: Data width expansion output ports
      .SHIFTOUT1(),
      .SHIFTOUT2(),
      .BITSLIP(1'b0),           // 1-bit input: The BITSLIP pin performs a Bitslip operation synchronous to
                                   // CLKDIV when asserted (active High). Subsequently, the data seen on the Q1
                                   // to Q8 output ports will shift, as in a barrel-shifter operation, one
                                   // position every time Bitslip is invoked (DDR operation is different from
                                   // SDR).

      // CE1, CE2: 1-bit (each) input: Data register clock enable inputs
      .CE1(1'b1),
      .CE2(1'b1),
      .CLKDIVP(1'b0),           // 1-bit input: TBD
      // Clocks: 1-bit (each) input: ISERDESE2 clock input ports
      .CLK(clk_bit),                   // 1-bit input: High-speed clock
      .CLKB(clk_bit_inv),                 // 1-bit input: High-speed secondary clock
      .CLKDIV(clk_div),             // 1-bit input: Divided clock
      .OCLK(1'b0),                 // 1-bit input: High speed output clock used when INTERFACE_TYPE="MEMORY" 
      // Dynamic Clock Inversions: 1-bit (each) input: Dynamic clock inversion pins to switch clock polarity
      .DYNCLKDIVSEL(1'b0), // 1-bit input: Dynamic CLKDIV inversion
      .DYNCLKSEL(1'b0),       // 1-bit input: Dynamic CLK/CLKB inversion
      // Input Data: 1-bit (each) input: ISERDESE2 data input ports
      .D(1'b0),                       // 1-bit input: Data input
      .DDLY(in_delayed_0),                 // 1-bit input: Serial data from IDELAYE2
      .OFB(1'b0),                   // 1-bit input: Data feedback from OSERDESE2
      .OCLKB(1'b0),               // 1-bit input: High speed negative edge output clock
      .RST(~rst_n),                   // 1-bit input: Active high asynchronous reset
      // SHIFTIN1, SHIFTIN2: 1-bit (each) input: Data width expansion input ports
      .SHIFTIN1(1'b0),
      .SHIFTIN2(1'b0)
   );

ISERDESE2 #(
      .DATA_RATE("DDR"),           // DDR, SDR
      .DATA_WIDTH(8),              // Parallel data width (2-8,10,14)
      .DYN_CLKDIV_INV_EN("FALSE"), // Enable DYNCLKDIVINVSEL inversion (FALSE, TRUE)
      .DYN_CLK_INV_EN("FALSE"),    // Enable DYNCLKINVSEL inversion (FALSE, TRUE)
      // INIT_Q1 - INIT_Q4: Initial value on the Q outputs (0/1)
      .INIT_Q1(1'b0),
      .INIT_Q2(1'b0),
      .INIT_Q3(1'b0),
      .INIT_Q4(1'b0),
      .INTERFACE_TYPE("NETWORKING"),   // MEMORY, MEMORY_DDR3, MEMORY_QDR, NETWORKING, OVERSAMPLE
      .IOBDELAY("NONE"),           // NONE, BOTH, IBUF, IFD
      .NUM_CE(2),                  // Number of clock enables (1,2)
      .OFB_USED("FALSE"),          // Select OFB path (FALSE, TRUE)
      .SERDES_MODE("MASTER"),      // MASTER, SLAVE
      // SRVAL_Q1 - SRVAL_Q4: Q output values when SR is used (0/1)
      .SRVAL_Q1(1'b0),
      .SRVAL_Q2(1'b0),
      .SRVAL_Q3(1'b0),
      .SRVAL_Q4(1'b0)
   )
   ISERDESE2_inst_1 (
      .O(),                       // 1-bit output: Combinatorial output
      // Q1 - Q8: 1-bit (each) output: Registered data outputs
      .Q1(lane1_data[7]),
      .Q2(lane1_data[6]),
      .Q3(lane1_data[5]),
      .Q4(lane1_data[4]),
      .Q5(lane1_data[3]),
      .Q6(lane1_data[2]),
      .Q7(lane1_data[1]),
      .Q8(lane1_data[0]),
      // SHIFTOUT1, SHIFTOUT2: 1-bit (each) output: Data width expansion output ports
      .SHIFTOUT1(),
      .SHIFTOUT2(),
      .BITSLIP(1'b0),           // 1-bit input: The BITSLIP pin performs a Bitslip operation synchronous to
                                   // CLKDIV when asserted (active High). Subsequently, the data seen on the Q1
                                   // to Q8 output ports will shift, as in a barrel-shifter operation, one
                                   // position every time Bitslip is invoked (DDR operation is different from
                                   // SDR).

      // CE1, CE2: 1-bit (each) input: Data register clock enable inputs
      .CE1(1'b1),
      .CE2(1'b1),
      .CLKDIVP(1'b0),           // 1-bit input: TBD
      // Clocks: 1-bit (each) input: ISERDESE2 clock input ports
      .CLK(clk_bit),                   // 1-bit input: High-speed clock
      .CLKB(clk_bit_inv),                 // 1-bit input: High-speed secondary clock
      .CLKDIV(clk_div),             // 1-bit input: Divided clock
      .OCLK(1'b0),                 // 1-bit input: High speed output clock used when INTERFACE_TYPE="MEMORY" 
      // Dynamic Clock Inversions: 1-bit (each) input: Dynamic clock inversion pins to switch clock polarity
      .DYNCLKDIVSEL(1'b0), // 1-bit input: Dynamic CLKDIV inversion
      .DYNCLKSEL(1'b0),       // 1-bit input: Dynamic CLK/CLKB inversion
      // Input Data: 1-bit (each) input: ISERDESE2 data input ports
      .D(1'b0),                       // 1-bit input: Data input
      .DDLY(in_delayed_1),                 // 1-bit input: Serial data from IDELAYE2
      .OFB(1'b0),                   // 1-bit input: Data feedback from OSERDESE2
      .OCLKB(1'b0),               // 1-bit input: High speed negative edge output clock
      .RST(~rst_n),                   // 1-bit input: Active high asynchronous reset
      // SHIFTIN1, SHIFTIN2: 1-bit (each) input: Data width expansion input ports
      .SHIFTIN1(1'b0),
      .SHIFTIN2(1'b0)
   );

endmodule //mipi_phy
