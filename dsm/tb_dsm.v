module tb_delta_sigma_modulator;

  reg clk;
  reg reset;
  reg signed [15:0] data_in; // Use signed data type for sine wave

  wire quant_out;

  reg quant_out_capture; // Added for capturing quant_out value

  delta_sigma_modulator uut (
    .clk(clk),
    .reset(reset),
    .data_in(data_in),
    .quant_out(quant_out)
  );

  always @(posedge clk) begin
    // Capture quant_out value for probing
    quant_out_capture <= quant_out;
  end

  initial begin
    // Initialize inputs
    clk = 0;
    reset = 1;
    data_in = 0;

    // Apply reset
    #5 reset = 0;

    // Generate sine wave as input
    integer i = 0;
    while (i < 360) begin
      data_in = $signed(1000 * sin(i * $clog2(10) / 180)); 
