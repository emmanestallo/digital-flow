module delta_sigma_modulator (
  input wire clk,      // Clock input
  input wire reset,    // Reset input
  input wire data_in,  // Input analog signal
  output reg quant_out // Digital output (1-bit quantized)
);

  reg [15:0] integrator1, integrator2, integrator3; // Integrators (16-bit)
  reg [15:0] feedback1, feedback2, feedback3;       // Feedback signals
  reg [2:0]  quantizer;                             // Quantizer (3-bit for third-order)

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      integrator1 <= 16'b0;
      integrator2 <= 16'b0;
      integrator3 <= 16'b0;
      feedback1   <= 16'b0;
      feedback2   <= 16'b0;
      feedback3   <= 16'b0;
      quantizer   <= 3'b0;
    end else begin
      // Delta-Sigma Modulator Operation (third-order)
      integrator1 <= integrator1 + data_in - feedback1;
      integrator2 <= integrator2 + integrator1 - feedback2;
      integrator3 <= integrator3 + integrator2 - feedback3;

      // Quantization
      quantizer <= {integrator3[15], integrator2[15], integrator1[15]}; // 3-bit quantization

      // Feedback generation
      feedback1 <= (quantizer[0] << 15); // Feedback1 = quantizer[0] * 2^15
      feedback2 <= (quantizer[1] << 15); // Feedback2 = quantizer[1] * 2^15
      feedback3 <= (quantizer[2] << 15); // Feedback3 = quantizer[2] * 2^15
    end
  end

  always @(posedge clk) begin
    // Output the 1-bit quantized result
    quant_out <= quantizer[2];
  end

endmodule
